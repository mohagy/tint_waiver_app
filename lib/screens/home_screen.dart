import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../models/waiver_form_model.dart';
import '../services/storage_service.dart';
import '../services/pdf_service.dart';
import '../widgets/section_header.dart';
import '../widgets/form_field_widgets.dart';
import '../widgets/signature_pad.dart';
import '../utils/validators.dart';
import '../utils/formatters.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  late WaiverFormModel _formData;

  // Section A Controllers
  final _lastNameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _middleNameController = TextEditingController();
  final _dobController = TextEditingController();
  final _pobController = TextEditingController();
  final _nationalityController = TextEditingController();
  final _naturalizationController = TextEditingController();
  final _registrationController = TextEditingController();
  final _ethnicityController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneController = TextEditingController();
  final _cellController = TextEditingController();
  final _emailController = TextEditingController();
  final _idController = TextEditingController();
  final _passportController = TextEditingController();
  final _tinController = TextEditingController();

  // Section B Controllers
  final _professionController = TextEditingController();
  final _employerNameController = TextEditingController();
  final _employerAddressController = TextEditingController();
  final _employerPhoneController = TextEditingController();
  final _employerFaxController = TextEditingController();
  final _employerEmailController = TextEditingController();

  // Section C Controllers
  final _businessTypeController = TextEditingController();
  final _businessNameController = TextEditingController();
  final _businessAddressController = TextEditingController();
  final _businessPhoneController = TextEditingController();
  final _businessFaxController = TextEditingController();
  final _businessEmailController = TextEditingController();

  // Section D Controllers
  final _registeredOwnerController = TextEditingController();
  final _possessionNameController = TextEditingController();
  final _vehicleTypeController = TextEditingController();
  final _regNoController = TextEditingController();
  final _colourController = TextEditingController();
  final _seatingController = TextEditingController();
  final _idMarkController = TextEditingController();
  final _chassisController = TextEditingController();
  final _engineController = TextEditingController();
  final _dlNoController = TextEditingController();
  final _dlExpiryController = TextEditingController();
  final _mvLicenceController = TextEditingController();
  final _mvExpiryController = TextEditingController();
  final _fitnessNoController = TextEditingController();
  final _fitnessExpiryController = TextEditingController();

  // Section E Controllers
  final _lastWaiverDateController = TextEditingController();

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _formData = WaiverFormModel();
    _loadDraft();
  }

  @override
  void dispose() {
    // Dispose all controllers
    _lastNameController.dispose();
    _firstNameController.dispose();
    _middleNameController.dispose();
    _dobController.dispose();
    _pobController.dispose();
    _nationalityController.dispose();
    _naturalizationController.dispose();
    _registrationController.dispose();
    _ethnicityController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _cellController.dispose();
    _emailController.dispose();
    _idController.dispose();
    _passportController.dispose();
    _tinController.dispose();
    _professionController.dispose();
    _employerNameController.dispose();
    _employerAddressController.dispose();
    _employerPhoneController.dispose();
    _employerFaxController.dispose();
    _employerEmailController.dispose();
    _businessTypeController.dispose();
    _businessNameController.dispose();
    _businessAddressController.dispose();
    _businessPhoneController.dispose();
    _businessFaxController.dispose();
    _businessEmailController.dispose();
    _registeredOwnerController.dispose();
    _possessionNameController.dispose();
    _vehicleTypeController.dispose();
    _regNoController.dispose();
    _colourController.dispose();
    _seatingController.dispose();
    _idMarkController.dispose();
    _chassisController.dispose();
    _engineController.dispose();
    _dlNoController.dispose();
    _dlExpiryController.dispose();
    _mvLicenceController.dispose();
    _mvExpiryController.dispose();
    _fitnessNoController.dispose();
    _fitnessExpiryController.dispose();
    _lastWaiverDateController.dispose();
    super.dispose();
  }

  Future<void> _loadDraft() async {
    setState(() => _isLoading = true);
    final draft = await StorageService.loadDraft();
    if (draft != null) {
      setState(() {
        _formData = draft;
        _populateControllers();
      });
    }
    setState(() => _isLoading = false);
  }

  void _populateControllers() {
    _lastNameController.text = _formData.lastName;
    _firstNameController.text = _formData.firstName;
    _middleNameController.text = _formData.middleName;
    _dobController.text = _formData.dateOfBirth;
    _pobController.text = _formData.placeOfBirth;
    _nationalityController.text = _formData.nationality;
    _naturalizationController.text = _formData.naturalizationSpecify;
    _registrationController.text = _formData.registrationSpecify;
    _ethnicityController.text = _formData.ethnicity;
    _addressController.text = _formData.address;
    _phoneController.text = _formData.phoneNumber;
    _cellController.text = _formData.cellNumber;
    _emailController.text = _formData.email;
    _idController.text = _formData.idNumber;
    _passportController.text = _formData.passportNumber;
    _tinController.text = _formData.tin;
    _professionController.text = _formData.profession;
    _employerNameController.text = _formData.employerName;
    _employerAddressController.text = _formData.employerAddress;
    _employerPhoneController.text = _formData.employerPhone;
    _employerFaxController.text = _formData.employerFax;
    _employerEmailController.text = _formData.employerEmail;
    _businessTypeController.text = _formData.businessType;
    _businessNameController.text = _formData.businessName;
    _businessAddressController.text = _formData.businessAddress;
    _businessPhoneController.text = _formData.businessPhone;
    _businessFaxController.text = _formData.businessFax;
    _businessEmailController.text = _formData.businessEmail;
    _registeredOwnerController.text = _formData.registeredOwner;
    _possessionNameController.text = _formData.possessionName;
    _vehicleTypeController.text = _formData.vehicleType;
    _regNoController.text = _formData.registrationNumber;
    _colourController.text = _formData.vehicleColour;
    _seatingController.text = _formData.seatingCapacity;
    _idMarkController.text = _formData.identificationMark;
    _chassisController.text = _formData.chassisNumber;
    _engineController.text = _formData.engineNumber;
    _dlNoController.text = _formData.drivingLicenceNumber;
    _dlExpiryController.text = _formData.dlExpiry;
    _mvLicenceController.text = _formData.mvLicenceNumber;
    _mvExpiryController.text = _formData.mvExpiry;
    _fitnessNoController.text = _formData.fitnessNumber;
    _fitnessExpiryController.text = _formData.fitnessExpiry;
    _lastWaiverDateController.text = _formData.lastWaiverDate;
  }

  void _updateFormData() {
    _formData = _formData.copyWith(
      lastName: _lastNameController.text,
      firstName: _firstNameController.text,
      middleName: _middleNameController.text,
      dateOfBirth: _dobController.text,
      placeOfBirth: _pobController.text,
      nationality: _nationalityController.text,
      naturalizationSpecify: _naturalizationController.text,
      registrationSpecify: _registrationController.text,
      ethnicity: _ethnicityController.text,
      address: _addressController.text,
      phoneNumber: _phoneController.text,
      cellNumber: _cellController.text,
      email: _emailController.text,
      idNumber: _idController.text,
      passportNumber: _passportController.text,
      tin: _tinController.text,
      profession: _professionController.text,
      employerName: _employerNameController.text,
      employerAddress: _employerAddressController.text,
      employerPhone: _employerPhoneController.text,
      employerFax: _employerFaxController.text,
      employerEmail: _employerEmailController.text,
      businessType: _businessTypeController.text,
      businessName: _businessNameController.text,
      businessAddress: _businessAddressController.text,
      businessPhone: _businessPhoneController.text,
      businessFax: _businessFaxController.text,
      businessEmail: _businessEmailController.text,
      registeredOwner: _registeredOwnerController.text,
      possessionName: _possessionNameController.text,
      vehicleType: _vehicleTypeController.text,
      registrationNumber: _regNoController.text,
      vehicleColour: _colourController.text,
      seatingCapacity: _seatingController.text,
      identificationMark: _idMarkController.text,
      chassisNumber: _chassisController.text,
      engineNumber: _engineController.text,
      drivingLicenceNumber: _dlNoController.text,
      dlExpiry: _dlExpiryController.text,
      mvLicenceNumber: _mvLicenceController.text,
      mvExpiry: _mvExpiryController.text,
      fitnessNumber: _fitnessNoController.text,
      fitnessExpiry: _fitnessExpiryController.text,
      lastWaiverDate: _lastWaiverDateController.text,
    );
  }

  Future<void> _saveDraft() async {
    _updateFormData();
    setState(() => _isLoading = true);
    final success = await StorageService.saveDraft(_formData);
    setState(() => _isLoading = false);
    
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(success ? 'Draft saved successfully' : 'Failed to save draft'),
          backgroundColor: success ? Colors.green : Colors.red,
        ),
      );
    }
  }

  Future<void> _generatePdf() async {
    if (!_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all required fields correctly'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    _updateFormData();

    if (!_formData.isValid()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please complete all required sections including signature'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      await PdfService.generateAndHandlePdf(_formData);
      await StorageService.saveCompletedForm(_formData);
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('PDF generated successfully'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to generate PDF: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: Column(
          children: const [
            Text('Ministry of Home Affairs'),
            Text('APPLICATION FOR A TINT WAIVER', style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal)),
          ],
        ),
        centerTitle: true,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Form(
              key: _formKey,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInstructions(),
                    const SizedBox(height: 20),
                    _buildRegulationsInfo(),
                    const SizedBox(height: 20),
                    _buildSectionA(),
                    _buildSectionB(),
                    _buildSectionC(),
                    _buildSectionD(),
                    _buildExemptionsInfo(),
                    const SizedBox(height: 20),
                    _buildTintTestingSites(),
                    const SizedBox(height: 20),
                    _buildSectionE(),
                    _buildSignatureSection(),
                    const SizedBox(height: 30),
                    _buildActionButtons(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildInstructions() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'INSTRUCTION: Please complete form in BLOCK CAPITALS.',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
            ),
            const SizedBox(height: 8),
            const Text(
              'Failure to complete all sections and affix your signature will affect processing of the application.',
              style: TextStyle(fontSize: 12),
            ),
            const Divider(height: 24),
            const Text(
              'DOCUMENTS REQUIRED:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _bulletPoint('1. A copy of the Certificate of Vehicle Registration and the Certificate of Fitness.'),
            _bulletPoint('2. A copy of the last tint permit received (if applicable).'),
            _bulletPoint('3. Original Documents for verification.'),
            const SizedBox(height: 12),
            const Text(
              'IMPORTANT:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            _bulletPoint('Permits are valid for six (6) months.'),
            _bulletPoint('Processing time is 3 to 5 working days.'),
            _bulletPoint('Only vehicles with MANUFACTURER\'S TINT are eligible.'),
          ],
        ),
      ),
    );
  }

  Widget _bulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 12))),
        ],
      ),
    );
  }

  Widget _buildRegulationsInfo() {
    return Card(
      color: Colors.blue.shade50,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'MOTOR VEHICLES AND ROAD TRAFFIC (TINT) REGULATIONS 2025',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.blue),
            ),
            const SizedBox(height: 12),
            const Text(
              'Press Statement by Hon. Oneidge Walrond, MP, Minister of Home Affairs',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            const Text(
              'Date: December 29, 2025',
              style: TextStyle(fontSize: 11, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 12),
            const Text(
              'NEW VEHICLE TINT RULES TAKE EFFECT: JANUARY 1, 2026',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.red),
            ),
            const SizedBox(height: 8),
            const Text(
              'The Motor Vehicles and Road Traffic (Tint) Regulations 2025 is aimed to improve safety and fair enforcement across Guyana.',
              style: TextStyle(fontSize: 11),
            ),
            const SizedBox(height: 12),
            const Divider(height: 20),
            const Text(
              'KNOW THE LEGAL TINT LIMITS:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            const SizedBox(height: 8),
            _bulletPoint('Front windscreen: No tint permitted (this regulation is strictly enforced).'),
            _bulletPoint('Front side windows (driver and front passenger): Minimum 25% VLT (Visible Light Transmission).'),
            _bulletPoint('Rear side windows: Minimum 20% VLT.'),
            _bulletPoint('Rear windscreen: Minimum 20% VLT.'),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                border: Border.all(color: Colors.red, width: 1),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                '⚠️ IMPORTANT: All mirrored or reflective window tints are illegal under the new regulations.',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Colors.red),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'AMNESTY PERIOD:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            const SizedBox(height: 8),
            _bulletPoint('A three-month amnesty period begins January 1, 2026.'),
            _bulletPoint('The Guyana Police Force will establish FREE voluntary tint testing sites nationwide.'),
            _bulletPoint('Motorists can test the tint level on their windows at designated sites to determine whether adjustments are needed.'),
            _bulletPoint('Vehicle owners can use these sites to test their vehicles and make necessary adjustments WITHOUT PENALTY.'),
            _bulletPoint('Locations will be announced publicly.'),
            _bulletPoint('At the conclusion of the amnesty period, full enforcement will commence.'),
            const SizedBox(height: 12),
            const Text(
              'STANDARDISED ENFORCEMENT:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            const SizedBox(height: 8),
            _bulletPoint('Approved tint meters, certified by the Guyana National Bureau of Standards, will be used to ensure consistent and transparent enforcement.'),
            _bulletPoint('Standardised enforcement for everyone ensures fair and clear rules.'),
            const SizedBox(height: 12),
            const Text(
              'FINES FOR NON-COMPLIANCE:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            const SizedBox(height: 8),
            _bulletPoint('After the amnesty period, offences involving illegal tint will attract a fine of \$30,000 for drivers and businesses applying unlawful tint.'),
            _bulletPoint('This includes vehicle operators and businesses involved in applying tint contrary to the law.'),
            const SizedBox(height: 12),
            const Text(
              'SAFER ROADS THROUGH FAIR AND CLEAR RULES:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            const SizedBox(height: 8),
            const Text(
              'These regulations balance personal convenience with public safety, supporting safer interactions between motorists and law enforcement.',
              style: TextStyle(fontSize: 11),
            ),
            const SizedBox(height: 12),
            const Text(
              'NOTE:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            const Text(
              'All information will be recorded in a digital national tint registry.',
              style: TextStyle(fontSize: 11, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExemptionsInfo() {
    return Card(
      color: Colors.amber.shade50,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'EXEMPTIONS AND APPLICATION PROCESS',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.orange),
            ),
            const SizedBox(height: 12),
            const Text(
              'EXEMPTIONS FOR APPROVED CATEGORIES:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            const SizedBox(height: 8),
            const Text(
              'Exemptions are in place for categories of vehicles requiring enhanced protection or accommodation. These include:',
              style: TextStyle(fontSize: 11),
            ),
            const SizedBox(height: 8),
            _bulletPoint('Vehicles used by the President and Prime Minister.'),
            _bulletPoint('Designated senior government officials.'),
            _bulletPoint('The Police Force, Defence Force, Fire Service, and Prison Service.'),
            _bulletPoint('Emergency services, including ambulances.'),
            _bulletPoint('Diplomatic and consular missions.'),
            _bulletPoint('Licensed private security agencies.'),
            _bulletPoint('Individuals with certified medical conditions requiring reduced exposure to sunlight.'),
            _bulletPoint('Businesses engaged in high-risk cash handling or security-sensitive operations.'),
            const SizedBox(height: 12),
            const Text(
              'APPLICATION PROCEDURE:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            const SizedBox(height: 8),
            _bulletPoint('Applications for exemptions must be submitted using a prescribed system to the Minister of Home Affairs.'),
            _bulletPoint('The Minister will consider the application and has the authority to either issue or refuse an exemption certificate.'),
            _bulletPoint('For exemptions based on medical grounds, applications must be supported by certification from a registered medical practitioner.'),
            _bulletPoint('All approved exemptions will be recorded in the digital national tint registry.'),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                border: Border.all(color: Colors.orange, width: 1),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'EXEMPTION CERTIFICATES MUST BE CARRIED',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Colors.orange),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Approved exemption certificates must be kept in the vehicle at all times and are recorded in a national tint registry.',
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTintTestingSites() {
    return Card(
      color: Colors.green.shade50,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'SITES FOR TINT EXAMINATION/CERTIFICATION',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.green),
            ),
            const SizedBox(height: 12),
            const Text(
              'The Guyana Police Force will establish FREE voluntary tint testing sites at the following locations:',
              style: TextStyle(fontSize: 11),
            ),
            const SizedBox(height: 12),
            _buildRegionSites('Region 1', 'Port Kaituma, Mabaruma, Moruca Police Stations', 3),
            _buildRegionSites('Region 2', 'Aurora, Charity, Anna Regina, Suddie Police Stations', 4),
            _buildRegionSites('Region 3', 'Tuschen, Leonora, Den Amstel, Vreed-en-Hoop, La Grange, Wales, Parfaite Harmony Stations', 7),
            _buildRegionSites('Region 4A', 'East La Penitence, Brickdam, Traffic HQ, Ruimveldt, Turkeyen Police Stations', 5),
            _buildRegionSites('Region 4B', 'Providence, Farm-Hertselling, Diamond, Grove Stations, Madewini Outpost, Highway Patrol Base', 6),
            _buildRegionSites('Region 4C', 'Sparendaam, Beterverwagting, Vigilance, Cove & John, Mahaica Stations', 5),
            _buildRegionSites('Region 5', 'Mahaicony, Weldaad, Fort Wellington, Blairmont Stations', 4),
            _buildRegionSites('Region 6', 'New Amsterdam (Central), Albion, #51, Whim, Springlands Stations', 5),
            _buildRegionSites('Region 7', 'Bartica Police Station', 1),
            _buildRegionSites('Region 8', 'Mahdia Police Station', 1),
            _buildRegionSites('Region 9', 'Lethem, Annai, Aishalton Police Stations', 3),
            _buildRegionSites('Region 10', 'McKenzie, Wismar, Mabura Police Stations', 3),
            const SizedBox(height: 12),
            const Text(
              'Total: 47 Tint Testing Sites Nationwide',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRegionSites(String region, String sites, int count) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              region,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
            ),
          ),
          Expanded(
            child: Text(
              sites,
              style: const TextStyle(fontSize: 10),
            ),
          ),
          SizedBox(
            width: 60,
            child: Text(
              '($count sites)',
              style: const TextStyle(fontSize: 10, fontStyle: FontStyle.italic),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionA() {
    return Column(
      children: [
        const SectionHeader(title: 'A. PERSONAL INFORMATION', icon: Icons.person),
        Row(
          children: [
            Expanded(child: CustomTextField(label: 'Last Name *', controller: _lastNameController, validator: (v) => Validators.required(v, 'Last name'))),
            const SizedBox(width: 12),
            Expanded(child: CustomTextField(label: 'First Name *', controller: _firstNameController, validator: (v) => Validators.required(v, 'First name'))),
          ],
        ),
        const SizedBox(height: 16),
        CustomTextField(label: 'Middle Name', controller: _middleNameController),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(child: DatePickerField(label: 'Date of Birth *', controller: _dobController, validator: Validators.date)),
            const SizedBox(width: 12),
            Expanded(child: CustomTextField(label: 'Place of Birth', controller: _pobController)),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(child: CustomTextField(label: 'Nationality', controller: _nationalityController)),
            const SizedBox(width: 12),
            Expanded(
              child: CustomDropdown(
                label: 'Sex *',
                value: _formData.sex,
                items: const ['Male', 'Female'],
                onChanged: (v) => setState(() => _formData = _formData.copyWith(sex: v)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text('Citizenship By:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
        Wrap(
          spacing: 8,
          children: ['Birth', 'Naturalization', 'Registration', 'Marriage', 'Citizenship'].map((type) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Radio<String>(
                  value: type,
                  groupValue: _formData.citizenshipBy,
                  onChanged: (v) => setState(() => _formData = _formData.copyWith(citizenshipBy: v)),
                ),
                Text(type, style: const TextStyle(fontSize: 12)),
              ],
            );
          }).toList(),
        ),
        if (_formData.citizenshipBy == 'Naturalization')
          CustomTextField(label: 'Specify Naturalization', controller: _naturalizationController),
        if (_formData.citizenshipBy == 'Registration')
          CustomTextField(label: 'Specify Registration', controller: _registrationController),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(child: CustomTextField(label: 'Ethnicity', controller: _ethnicityController)),
            const SizedBox(width: 12),
            Expanded(
              child: CustomDropdown(
                label: 'Marital Status',
                value: _formData.maritalStatus,
                items: const ['Single', 'Married', 'Separated', 'Divorced', 'Widowed', 'Common Law'],
                onChanged: (v) => setState(() => _formData = _formData.copyWith(maritalStatus: v)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        CustomDropdown(
          label: 'Immigration Status (If Applicable)',
          value: _formData.immigrationStatus,
          items: const ['Permanent Resident', 'Voluntary Remigrant', 'Involuntary Remigrant'],
          onChanged: (v) => setState(() => _formData = _formData.copyWith(immigrationStatus: v)),
        ),
        const SizedBox(height: 16),
        CustomTextField(label: 'Present Address *', controller: _addressController, validator: (v) => Validators.required(v, 'Address')),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(child: CustomTextField(label: 'Tel No.', controller: _phoneController, keyboardType: TextInputType.phone)),
            const SizedBox(width: 12),
            Expanded(child: CustomTextField(label: 'Cell No. *', controller: _cellController, validator: (v) => Validators.required(v, 'Cell number'), keyboardType: TextInputType.phone)),
          ],
        ),
        const SizedBox(height: 16),
        CustomTextField(label: 'E-mail', controller: _emailController, keyboardType: TextInputType.emailAddress),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(child: CustomTextField(label: 'National I.D. No. *', controller: _idController, validator: (v) => Validators.required(v, 'ID number'))),
            const SizedBox(width: 12),
            Expanded(child: CustomTextField(label: 'Passport No.', controller: _passportController)),
          ],
        ),
        const SizedBox(height: 16),
        CustomTextField(label: 'TIN *', controller: _tinController, validator: (v) => Validators.required(v, 'TIN')),
      ],
    );
  }

  Widget _buildSectionB() {
    return Column(
      children: [
        const SectionHeader(title: 'B. EMPLOYER INFORMATION', icon: Icons.work),
        CustomTextField(label: 'Profession or Occupation', controller: _professionController),
        const SizedBox(height: 16),
        CustomTextField(label: 'Name of Employer', controller: _employerNameController),
        const SizedBox(height: 16),
        CustomTextField(label: 'Address of Employer', controller: _employerAddressController, maxLines: 2),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(child: CustomTextField(label: 'Tel No.', controller: _employerPhoneController)),
            const SizedBox(width: 12),
            Expanded(child: CustomTextField(label: 'Fax No.', controller: _employerFaxController)),
          ],
        ),
        const SizedBox(height: 16),
        CustomTextField(label: 'Employer E-mail', controller: _employerEmailController),
      ],
    );
  }

  Widget _buildSectionC() {
    return Column(
      children: [
        const SectionHeader(title: 'C. BUSINESS INFORMATION (Self Employed)', icon: Icons.business),
        CustomTextField(label: 'Type of Business', controller: _businessTypeController),
        const SizedBox(height: 16),
        CustomTextField(label: 'Name of Business', controller: _businessNameController),
        const SizedBox(height: 16),
        CustomTextField(label: 'Address', controller: _businessAddressController, maxLines: 2),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(child: CustomTextField(label: 'Tel No.', controller: _businessPhoneController)),
            const SizedBox(width: 12),
            Expanded(child: CustomTextField(label: 'Fax No.', controller: _businessFaxController)),
          ],
        ),
        const SizedBox(height: 16),
        CustomTextField(label: 'Business E-mail', controller: _businessEmailController),
      ],
    );
  }

  Widget _buildSectionD() {
    return Column(
      children: [
        const SectionHeader(title: 'D. VEHICLE INFORMATION', icon: Icons.directions_car),
        CustomTextField(label: 'Name of Registered Owner *', controller: _registeredOwnerController, validator: (v) => Validators.required(v, 'Registered owner')),
        const SizedBox(height: 16),
        CustomTextField(label: 'Name of Person in Possession', controller: _possessionNameController, hintText: 'If different from owner'),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(child: CustomTextField(label: 'Type of Vehicle', controller: _vehicleTypeController)),
            const SizedBox(width: 12),
            Expanded(child: CustomTextField(label: 'Registration No. *', controller: _regNoController, validator: (v) => Validators.required(v, 'Registration number'))),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(child: CustomTextField(label: 'Colour', controller: _colourController)),
            const SizedBox(width: 12),
            Expanded(child: CustomTextField(label: 'Seating Capacity', controller: _seatingController, keyboardType: TextInputType.number)),
          ],
        ),
        const SizedBox(height: 16),
        CustomTextField(label: 'Identification Mark', controller: _idMarkController),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(child: CustomTextField(label: 'Chassis No. *', controller: _chassisController, validator: (v) => Validators.required(v, 'Chassis number'))),
            const SizedBox(width: 12),
            Expanded(child: CustomTextField(label: 'Engine No.', controller: _engineController)),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(child: CustomTextField(label: 'Driving Licence No.', controller: _dlNoController)),
            const SizedBox(width: 12),
            Expanded(child: DatePickerField(label: 'DL Expiry', controller: _dlExpiryController)),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(child: CustomTextField(label: 'MV Licence No.', controller: _mvLicenceController)),
            const SizedBox(width: 12),
            Expanded(child: DatePickerField(label: 'MV Expiry', controller: _mvExpiryController)),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(child: CustomTextField(label: 'Fitness No.', controller: _fitnessNoController)),
            const SizedBox(width: 12),
            Expanded(child: DatePickerField(label: 'Fitness Expiry', controller: _fitnessExpiryController)),
          ],
        ),
      ],
    );
  }

  Widget _buildSectionE() {
    return Column(
      children: [
        const SectionHeader(title: 'E. OTHER', icon: Icons.more_horiz),
        Row(
          children: [
            const Expanded(child: Text('Is This Your First Application?', style: TextStyle(fontSize: 14))),
            Radio<bool>(
              value: true,
              groupValue: _formData.isFirstApplication,
              onChanged: (v) => setState(() => _formData = _formData.copyWith(isFirstApplication: v)),
            ),
            const Text('Yes'),
            Radio<bool>(
              value: false,
              groupValue: _formData.isFirstApplication,
              onChanged: (v) => setState(() => _formData = _formData.copyWith(isFirstApplication: v)),
            ),
            const Text('No'),
          ],
        ),
        if (!_formData.isFirstApplication)
          DatePickerField(label: 'Date of last tint waiver issued', controller: _lastWaiverDateController),
      ],
    );
  }

  Widget _buildSignatureSection() {
    return Column(
      children: [
        const SectionHeader(title: 'SIGNATURE', icon: Icons.edit),
        SignaturePad(
          initialSignature: _formData.signatureData,
          onSignatureSaved: (sig) {
            setState(() {
              _formData = _formData.copyWith(
                signatureData: sig,
                signatureDate: DateFormat('yyyy/MM/dd').format(DateTime.now()),
              );
            });
          },
        ),
        if (_formData.signatureDate.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text('Signed on: ${_formData.signatureDate}', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
          ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: _saveDraft,
            icon: const Icon(Icons.save),
            label: const Text('Save Draft'),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: _generatePdf,
            icon: const Icon(Icons.picture_as_pdf),
            label: const Text('Generate PDF'),
          ),
        ),
      ],
    );
  }
}

class _AppBarSubtitle extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String subtitle;

  const _AppBarSubtitle({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(subtitle, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal)),
        ],
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

