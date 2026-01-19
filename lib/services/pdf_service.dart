import 'dart:typed_data';
import 'dart:convert';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../models/waiver_form_model.dart';

/// Service for generating and handling PDF documents
class PdfService {
  /// Generates a PDF and handles it (download on web, share on mobile/desktop)
  static Future<void> generateAndHandlePdf(WaiverFormModel form) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        build: (pw.Context context) {
          return [
            _buildHeader(),
            pw.SizedBox(height: 10),
            _buildInstructions(),
            pw.SizedBox(height: 15),
            _buildSectionA(form),
            _buildSectionB(form),
            _buildSectionC(form),
            _buildSectionD(form),
            _buildSectionE(form),
            pw.SizedBox(height: 20),
            _buildSignature(form),
          ];
        },
      ),
    );

    final bytes = await pdf.save();
    final fileName = 'Tint_Waiver_Application_${form.lastName}.pdf';

    await Printing.sharePdf(
      bytes: bytes,
      filename: fileName,
    );
  }

  static pw.Widget _buildHeader() {
    return pw.Column(
      children: [
        pw.Text(
          'Ministry of Home Affairs',
          style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
          textAlign: pw.TextAlign.center,
        ),
        pw.Text(
          'APPLICATION FOR A TINT WAIVER',
          style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
          textAlign: pw.TextAlign.center,
        ),
        pw.SizedBox(height: 5),
        pw.Divider(),
      ],
    );
  }

  static pw.Widget _buildInstructions() {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          'INSTRUCTION: Please complete form in BLOCK CAPITALS.',
          style: pw.TextStyle(fontWeight: pw.FontWeight.bold, color: PdfColors.red),
        ),
        pw.SizedBox(height: 5),
        pw.Text(
          'DOCUMENTS REQUIRED:',
          style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10),
        ),
        pw.Bullet(text: 'A copy of the Certificate of Vehicle Registration and the Certificate of Fitness.'),
        pw.Bullet(text: 'A copy of the last tint permit received (if applicable).'),
        pw.Bullet(text: 'Original Documents for verification.'),
        pw.SizedBox(height: 5),
        pw.Text(
          'IMPORTANT: Exemption certificates for individuals are valid for two (2) years from date of issue or renewal. Processing time is 3-5 working days.',
          style: pw.TextStyle(fontSize: 9, fontStyle: pw.FontStyle.italic),
        ),
      ],
    );
  }

  static pw.Widget _buildSectionA(WaiverFormModel form) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        _sectionTitle('A. PERSONAL INFORMATION'),
        _row([
          _field('Last Name', form.lastName),
          _field('First Name', form.firstName),
          _field('Middle Name', form.middleName),
        ]),
        _row([
          _field('Date of Birth', form.dateOfBirth),
          _field('Place of Birth', form.placeOfBirth),
          _field('Nationality', form.nationality),
        ]),
        _row([
          _field('Sex', form.sex),
          _field('Ethnicity', form.ethnicity),
          _field('Marital Status', form.maritalStatus),
        ]),
        _row([
          _field('Citizenship By', form.citizenshipBy),
          _field('Immigration Status', form.immigrationStatus),
        ]),
        _field('Present Address', form.address),
        _row([
          _field('Tel No.', form.phoneNumber),
          _field('Cell No.', form.cellNumber),
          _field('E-mail', form.email),
        ]),
        _row([
          _field('National I.D. No.', form.idNumber),
          _field('Passport No.', form.passportNumber),
          _field('TIN', form.tin),
        ]),
        pw.SizedBox(height: 10),
      ],
    );
  }

  static pw.Widget _buildSectionB(WaiverFormModel form) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        _sectionTitle('B. EMPLOYER INFORMATION'),
        _field('Profession or Occupation', form.profession),
        _field('Name of Employer', form.employerName),
        _field('Address of Employer', form.employerAddress),
        _row([
          _field('Tel No.', form.employerPhone),
          _field('Fax No.', form.employerFax),
          _field('E-mail', form.employerEmail),
        ]),
        pw.SizedBox(height: 10),
      ],
    );
  }

  static pw.Widget _buildSectionC(WaiverFormModel form) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        _sectionTitle('C. BUSINESS INFORMATION (Self Employed)'),
        _row([
          _field('Type of Business', form.businessType),
          _field('Name of Business', form.businessName),
        ]),
        _field('Address', form.businessAddress),
        _row([
          _field('Tel No.', form.businessPhone),
          _field('Fax No.', form.businessFax),
          _field('E-mail', form.businessEmail),
        ]),
        pw.SizedBox(height: 10),
      ],
    );
  }

  static pw.Widget _buildSectionD(WaiverFormModel form) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        _sectionTitle('D. VEHICLE INFORMATION'),
        _field('Name of Registered Owner', form.registeredOwner),
        _field('Name of Person in Possession', form.possessionName),
        _row([
          _field('Type of Vehicle', form.vehicleType),
          _field('Registration No.', form.registrationNumber),
          _field('Colour', form.vehicleColour),
        ]),
        _row([
          _field('Seating Capacity', form.seatingCapacity),
          _field('Identification Mark', form.identificationMark),
        ]),
        _row([
          _field('Chassis No.', form.chassisNumber),
          _field('Engine No.', form.engineNumber),
        ]),
        _row([
          _field('Driving Licence No.', form.drivingLicenceNumber),
          _field('Expiry', form.dlExpiry),
        ]),
        _row([
          _field('Motor Vehicle Licence No.', form.mvLicenceNumber),
          _field('Expiry', form.mvExpiry),
        ]),
        _row([
          _field('Certificate of Fitness No.', form.fitnessNumber),
          _field('Expiry', form.fitnessExpiry),
        ]),
        pw.SizedBox(height: 10),
      ],
    );
  }

  static pw.Widget _buildSectionE(WaiverFormModel form) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        _sectionTitle('E. OTHER'),
        pw.Text(
          'Is This Your First Application: ${form.isFirstApplication ? "YES" : "NO"}',
          style: pw.TextStyle(fontSize: 10),
        ),
        if (!form.isFirstApplication)
          _field('Date of last tint waiver issued', form.lastWaiverDate),
      ],
    );
  }

  static pw.Widget _buildSignature(WaiverFormModel form) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Divider(),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text('Signature of Applicant:', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                if (form.signatureData != null)
                  pw.Container(
                    height: 50,
                    width: 150,
                    child: pw.Image(
                      pw.MemoryImage(
                        base64Decode(form.signatureData!.split(',').last),
                      ),
                    ),
                  ),
                pw.SizedBox(height: 5),
                pw.Text('Date: ${form.signatureDate}', style: pw.TextStyle(fontSize: 10)),
              ],
            ),
            pw.Container(
              width: 150,
              padding: const pw.EdgeInsets.all(10),
              decoration: pw.BoxDecoration(
                border: pw.Border.all(),
              ),
              child: pw.Center(
                child: pw.Text(
                  'FOR OFFICIAL USE ONLY',
                  style: pw.TextStyle(fontSize: 8, fontWeight: pw.FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  static pw.Widget _sectionTitle(String title) {
    return pw.Container(
      margin: const pw.EdgeInsets.symmetric(vertical: 5),
      padding: const pw.EdgeInsets.all(4),
      decoration: const pw.BoxDecoration(color: PdfColors.grey300),
      width: double.infinity,
      child: pw.Text(
        title,
        style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 11),
      ),
    );
  }

  static pw.Widget _field(String label, String value) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 2),
      child: pw.RichText(
        text: pw.TextSpan(
          children: [
            pw.TextSpan(text: '$label: ', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10)),
            pw.TextSpan(text: value, style: const pw.TextStyle(fontSize: 10)),
          ],
        ),
      ),
    );
  }

  static pw.Widget _row(List<pw.Widget> children) {
    return pw.Row(
      children: children.map((c) => pw.Expanded(child: c)).toList(),
    );
  }
}
