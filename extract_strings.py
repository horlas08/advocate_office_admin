#!/usr/bin/env python3
"""
Scan the `lib/` directory for Dart string literals and print candidates
for translation. Filters out import lines, package/URI-like strings,
pure numbers, dates, times, emails, urls, and common non-translatable
tokens.

Usage: run from the workspace root:
    python extract_strings.py

This script does NOT modify any code. It only prints findings.
"""
import os
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent
LIB_DIR = ROOT / 'lib'

# Regex to capture Dart single or double quoted string literals, including r'' raw strings and triple quotes
STRING_RE = re.compile(r"(?P<prefix>r)?(?P<quote>'''|\"\"\"|'|\")(?P<body>.*?)(?P=quote)", re.DOTALL)

# Filters: patterns that indicate the string should be ignored
URL_RE = re.compile(r'https?://|www\.|@')
FILEPATH_RE = re.compile(r'(^[A-Za-z]:\\|/|\\)')
PACKAGE_RE = re.compile(r'^(package:|dart:|file:|asset:|assets/|fonts/|/assets/)')
NUMBER_ONLY_RE = re.compile(r'^\s*[\d\.,\-\s]+\s*$')
ISO_DATE_RE = re.compile(r'^(\d{4}-\d{2}-\d{2})([ T]\d{2}:\d{2}(:\d{2})?)?$')
TIME_RE = re.compile(r'^\d{1,2}:\d{2}(:\d{2})?$')
HEX_COLOR_RE = re.compile(r'^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$')
EMAIL_RE = re.compile(r'^[\w.+-]+@[\w.-]+\.[A-Za-z]{2,}$')

# Common tokens that are not user-facing
NON_UI_TOKENS = set([
    'true', 'false', 'null', 'ok', 'OK', 'yes', 'no', 'null', 'NaN'
])


def looks_translatable(s: str) -> bool:
    if not s or s.strip() == '':
        return False
    if s in NON_UI_TOKENS:
        return False
    if PACKAGE_RE.search(s):
        return False
    if URL_RE.search(s):
        return False
    if EMAIL_RE.search(s):
        return False
    if ISO_DATE_RE.search(s) or TIME_RE.search(s):
        return False
    if NUMBER_ONLY_RE.search(s):
        return False
    if HEX_COLOR_RE.search(s):
        return False
    # Likely a file path (contains slash or backslash and dot extension)
    if re.search(r'\\|/', s) and re.search(r'\.[A-Za-z0-9]{1,5}', s):
        return False
    # If string contains only identifier-like tokens (no spaces, no punctuation), skip
    if re.match(r'^[A-Za-z0-9_\-]+$', s) and len(s) <= 30 and '_' in s:
        return False
    # If it's too short and looks like an abbreviation or code, skip
    if len(s.strip()) <= 2:
        return False
    # If contains {{ }} or %d or interpolation patterns likely programmatic, still allow but user will review
    return True


def extract_from_file(path: Path):
    results = []
    try:
        text = path.read_text(encoding='utf-8')
    except Exception:
        return results

    # Skip import lines entirely
    lines = text.splitlines()
    for i, line in enumerate(lines, start=1):
        if line.strip().startswith('import ') or line.strip().startswith('part ') or line.strip().startswith('export '):
            continue
        for m in STRING_RE.finditer(line):
            body = m.group('body')
            # Remove escaped quotes and common escape sequences for evaluation
            candidate = body.encode('utf-8').decode('unicode_escape') if '\\' in body else body
            candidate = candidate.strip()
            if looks_translatable(candidate):
                results.append((i, candidate))

    # Also search across file for multiline/triple quoted strings
    for m in STRING_RE.finditer(text):
        body = m.group('body')
        # compute approximate line number
        start = text[:m.start()].count('\n') + 1
        candidate = body.encode('utf-8').decode('unicode_escape') if '\\' in body else body
        candidate = candidate.strip()
        if looks_translatable(candidate):
            # avoid duplicates already captured per-line
            if not any(start == r[0] and candidate == r[1] for r in results):
                results.append((start, candidate))

    return results


def walk_lib():
    hits = []
    for root, dirs, files in os.walk(LIB_DIR):
        for f in files:
            if not f.endswith('.dart'):
                continue
            path = Path(root) / f
            for lineno, s in extract_from_file(path):
                hits.append((path.relative_to(ROOT), lineno, s))
    return hits


def main():
    if not LIB_DIR.exists():
        print('lib/ folder not found in workspace root:', LIB_DIR)
        sys.exit(1)
    import argparse
    parser = argparse.ArgumentParser(description='Extract candidate translatable strings from lib/')
    parser.add_argument('--out', '-o', help='Save unique strings to this txt file (one per line)')
    args = parser.parse_args()

    hits = walk_lib()
    if args.out:
        # write unique strings only
        uniq = []
        seen = set()
        for _path, _lineno, s in hits:
            if s not in seen:
                seen.add(s)
                uniq.append(s)
        outpath = Path(args.out)
        outpath.write_text('\n'.join(uniq), encoding='utf-8')
        print(f'Wrote {len(uniq)} unique strings to {outpath}')
    else:
        for path, lineno, s in hits:
            print(f'{path}:{lineno}: {s}')


if __name__ == '__main__':
    main()
