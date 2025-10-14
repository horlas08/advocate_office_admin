// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:io';
import 'package:advocateoffice/data/info.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:universal_html/html.dart' as html;

class PaymentReceiptPdf extends GetxController {
  Future<void> generateTwoReceipts(Map<String, dynamic> receiptData) async {
    final PdfDocument document = PdfDocument();
    document.pageSettings.setMargins(10, 10, 10, 10);

    final PdfPage page = document.pages.add();
    final PdfGraphics graphics = page.graphics;
    final Size pageSize =
        Size(page.getClientSize().width, page.getClientSize().height);

    final PdfFont subHeaderFont = PdfStandardFont(PdfFontFamily.helvetica, 10);
    final PdfFont titleFont =
        PdfStandardFont(PdfFontFamily.helvetica, 16, style: PdfFontStyle.bold);
    final PdfFont fieldTitleFont = PdfStandardFont(PdfFontFamily.helvetica, 10);
    final PdfFont headerFont = PdfStandardFont(PdfFontFamily.helvetica, 12,
        style: PdfFontStyle.italic);
    final PdfFont footerFont =
        PdfStandardFont(PdfFontFamily.helvetica, 8, style: PdfFontStyle.italic);
    final PdfFont signatureFont = PdfStandardFont(PdfFontFamily.helvetica, 10);
    await _drawProfileImage(page);
    // Draw the first receipt
    double yPosition = 10;
    // Draw a border around the page
    graphics.drawRectangle(
      pen: PdfPen(PdfColor(0, 0, 0), width: 1), // Black border with 2pt width
      bounds: Rect.fromLTWH(0, 0, pageSize.width, pageSize.height / 2 - 80),
    );
    _drawReceipt(graphics, pageSize, yPosition, receiptData, headerFont,
        subHeaderFont, titleFont, fieldTitleFont, footerFont, signatureFont);

    final List<int> bytes = await document.save();
    document.dispose();

    if (kIsWeb) {
      _saveAndOpenWeb(bytes, 'MoneyReceipt.pdf');
    } else {
      _saveAndOpenMobile(bytes, 'MoneyReceipt.pdf');
    }
  }

  Future<double> _drawProfileImage(
    PdfPage page,
  ) async {
    const String imageUrl = 'assets/bg_removed.png';
    final ByteData data = await rootBundle.load(imageUrl);
    final Uint8List bytes = data.buffer.asUint8List();

    final PdfBitmap image = PdfBitmap(bytes);
    page.graphics.drawImage(image, const Rect.fromLTWH(5, 5, 80, 80));

    return 0;
  }
}

// Method to draw each receipt
void _drawReceipt(
  PdfGraphics graphics,
  Size pageSize,
  double yOffset,
  Map<String, dynamic> receiptData,
  PdfFont headerFont,
  PdfFont subHeaderFont,
  PdfFont titleFont,
  PdfFont fieldFont,
  PdfFont footerFont,
  PdfFont signatureFont,
) {
  graphics.drawString(
    'MONEY RECEIPT',
    titleFont,
    bounds: Rect.fromLTWH(150, yOffset + 50, 300, 30),
    format: PdfStringFormat(alignment: PdfTextAlignment.center),
  );
  graphics.drawRectangle(
    pen: PdfPen(PdfColor(0, 0, 0), width: .5),
    bounds: Rect.fromLTWH(210, yOffset + 45, 180, 30),
  );
  graphics.drawString(
    InfoData.companyName,
    PdfStandardFont(PdfFontFamily.helvetica, 14, style: PdfFontStyle.italic),
    bounds: Rect.fromLTWH(pageSize.width - 310, yOffset, 300, 20),
    format: PdfStringFormat(alignment: PdfTextAlignment.right),
  );

  graphics.drawString(
    InfoData.companyMail,
    subHeaderFont,
    bounds: Rect.fromLTWH(pageSize.width - 310, yOffset + 20, 300, 20),
    format: PdfStringFormat(alignment: PdfTextAlignment.right),
  );
  graphics.drawString(
    InfoData.companyPhone,
    subHeaderFont,
    bounds: Rect.fromLTWH(pageSize.width - 310, yOffset + 35, 300, 20),
    format: PdfStringFormat(alignment: PdfTextAlignment.right),
  );

  double yPosition = yOffset + 110;
  const double lineSpacing = 30;

  // Draw fields using the helper function
  _drawMrNoField(graphics, pageSize, yPosition, receiptData["mrNo"], headerFont,
      fieldFont);

  _drawDateField(graphics, pageSize, yPosition, receiptData["date"], headerFont,
      fieldFont);
  yPosition += lineSpacing;

  _drawNameField(graphics, pageSize, yPosition, receiptData["name"], headerFont,
      fieldFont);
  graphics.drawString(
    ",",
    headerFont,
    bounds: Rect.fromLTWH(pageSize.width - 175, yPosition + 1, 5, 20),
  );

  _drawContactField(graphics, pageSize, yPosition, receiptData["contact"],
      headerFont, fieldFont);
  yPosition += lineSpacing;

  _drawCaseIDField(graphics, pageSize, yPosition, receiptData["caseId"],
      headerFont, fieldFont);
  graphics.drawString(
    ",",
    headerFont,
    bounds: Rect.fromLTWH(135, yPosition + 1, 5, 20),
  );

  _drawCaseTypeField(graphics, pageSize, yPosition, receiptData["caseType"],
      headerFont, fieldFont);
  graphics.drawString(
    ",",
    headerFont,
    bounds: Rect.fromLTWH(355, yPosition + 1, 5, 20),
  );

  _drawAmountField(graphics, pageSize, yPosition, receiptData["amount"],
      headerFont, fieldFont);
  yPosition += lineSpacing;

  _drawPaymentMethodField(graphics, pageSize, yPosition,
      receiptData["paymentMethod"], headerFont, fieldFont);
  yPosition += lineSpacing * 2;

  graphics.drawString(
    'visit us: ${InfoData.companyWebSite}',
    signatureFont,
    bounds: Rect.fromLTWH(
        10, yOffset + pageSize.height / 2 - 120, pageSize.width / 2 - 20, 20),
  );

  graphics.drawString(
    'Authorized Signature',
    signatureFont,
    bounds: Rect.fromLTWH(pageSize.width - 150,
        yOffset + pageSize.height / 2 - 120, pageSize.width / 2 - 20, 20),
  );
  // Line for Client Signature
  graphics.drawLine(
    PdfPen(PdfColor(0, 0, 0), width: 1),
    Offset(pageSize.width - 20, yOffset + pageSize.height / 2 - 125),
    Offset(400, yOffset + pageSize.height / 2 - 125),
  );
}

// Helper function to draw  field with an underline

void _drawMrNoField(
  PdfGraphics graphics,
  Size pageSize,
  double yPosition,
  String mrNo,
  PdfFont fieldFont,
  PdfFont titleFont,
) {
  graphics.drawString(
    'MR No :',
    fieldFont,
    bounds: Rect.fromLTWH(10, yPosition, 50, 20),
  );

  graphics.drawString(
    mrNo,
    fieldFont,
    bounds: Rect.fromLTWH(50, yPosition, 100, 20),
  );
}

void _drawDateField(
  PdfGraphics graphics,
  Size pageSize,
  double yPosition,
  String date,
  PdfFont fieldFont,
  PdfFont titleFont,
) {
  graphics.drawString(
    'Date :',
    fieldFont,
    bounds: Rect.fromLTWH(pageSize.width - 160, yPosition, 50, 20),
  );

  graphics.drawString(
    date,
    fieldFont,
    bounds: Rect.fromLTWH(pageSize.width - 130, yPosition, 300, 20),
  );
}

void _drawNameField(
  PdfGraphics graphics,
  Size pageSize,
  double yPosition,
  String name,
  PdfFont fieldFont,
  PdfFont titleFont,
) {
  graphics.drawString(
    'Received payment with thanks from',
    titleFont,
    bounds: Rect.fromLTWH(10, yPosition, 150, 20),
  );

  graphics.drawString(
    name,
    fieldFont,
    bounds: Rect.fromLTWH(155, yPosition - 3, 300, 20),
  );

  graphics.drawLine(
    PdfPen(PdfColor(128, 128, 128)),
    Offset(150, yPosition + 12),
    Offset(pageSize.width - 180, yPosition + 12),
  );
}

void _drawContactField(
  PdfGraphics graphics,
  Size pageSize,
  double yPosition,
  String contact,
  PdfFont fieldFont,
  PdfFont titleFont,
) {
  graphics.drawString(
    'Contact No',
    titleFont,
    bounds: Rect.fromLTWH(pageSize.width - 165, yPosition, 300, 20),
  );

  graphics.drawString(
    contact,
    fieldFont,
    bounds: Rect.fromLTWH(pageSize.width - 105, yPosition - 3, 300, 20),
  );

  graphics.drawLine(
    PdfPen(PdfColor(128, 128, 128)),
    Offset(pageSize.width - 110, yPosition + 12),
    Offset(pageSize.width - 20, yPosition + 12),
  );
}

void _drawCaseIDField(
  PdfGraphics graphics,
  Size pageSize,
  double yPosition,
  String caseId,
  PdfFont fieldFont,
  PdfFont titleFont,
) {
  graphics.drawString(
    'Case ID',
    titleFont,
    bounds: Rect.fromLTWH(10, yPosition, 50, 20),
  );

  graphics.drawString(
    caseId,
    fieldFont,
    bounds: Rect.fromLTWH(55, yPosition - 3, 300, 20),
  );

  graphics.drawLine(
    PdfPen(PdfColor(128, 128, 128)),
    Offset(50, yPosition + 12),
    Offset(130, yPosition + 12),
  );
}

void _drawCaseTypeField(
  PdfGraphics graphics,
  Size pageSize,
  double yPosition,
  String caseType,
  PdfFont fieldFont,
  PdfFont titleFont,
) {
  graphics.drawString(
    'Case Type',
    titleFont,
    bounds: Rect.fromLTWH(150, yPosition, 300, 20),
  );

  graphics.drawString(
    caseType,
    fieldFont,
    bounds: Rect.fromLTWH(205, yPosition - 3, 300, 20),
  );

  graphics.drawLine(
    PdfPen(PdfColor(128, 128, 128)),
    Offset(200, yPosition + 12),
    Offset(350, yPosition + 12),
  );
}

void _drawAmountField(
  PdfGraphics graphics,
  Size pageSize,
  double yPosition,
  String amount,
  PdfFont fieldFont,
  PdfFont titleFont,
) {
  graphics.drawString(
    'Amount of',
    titleFont,
    bounds: Rect.fromLTWH(370, yPosition, 80, 20),
  );

  graphics.drawString(
    "$amount BDT",
    fieldFont,
    bounds: Rect.fromLTWH(pageSize.width - 150, yPosition - 3, 100, 20),
  );

  graphics.drawLine(
    PdfPen(PdfColor(128, 128, 128)),
    Offset(pageSize.width - 155, yPosition + 12),
    Offset(pageSize.width - 20, yPosition + 12),
  );
}

void _drawPaymentMethodField(
  PdfGraphics graphics,
  Size pageSize,
  double yPosition,
  String paymentMethod,
  PdfFont fieldFont,
  PdfFont titleFont,
) {
  graphics.drawString(
    'with',
    titleFont,
    bounds: Rect.fromLTWH(10, yPosition, 30, 20),
  );

  graphics.drawString(
    paymentMethod,
    fieldFont,
    bounds: Rect.fromLTWH(35, yPosition - 3, 100, 20),
  );

  graphics.drawLine(
    PdfPen(PdfColor(128, 128, 128)),
    Offset(30, yPosition + 12),
    Offset(130, yPosition + 12),
  );
}

// Web: Save and download the PDF file
Future<void> _saveAndOpenWeb(List<int> bytes, String fileName) async {
  final base64 = base64Encode(bytes);
  final html.AnchorElement anchor =
      html.AnchorElement(href: 'data:application/pdf;base64,$base64')
        ..setAttribute('download', fileName)
        ..click();
}

// Mobile: Save and open the PDF file
Future<void> _saveAndOpenMobile(List<int> bytes, String fileName) async {
  final Directory directory = await getApplicationDocumentsDirectory();
  final File file = File('${directory.path}/$fileName');
  await file.writeAsBytes(bytes);
  OpenFile.open(file.path);
}
