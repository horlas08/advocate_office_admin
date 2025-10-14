import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({
    super.key,
    required this.desktop,
    required this.tablet,
    required this.phone,
  });
  final Widget desktop;
  final Widget tablet;
  final Widget phone;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1250) {
          return desktop;
        } else if (constraints.maxWidth >= 768) {
          return tablet;
        } else if (constraints.maxWidth >= 320) {
          return phone;
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
