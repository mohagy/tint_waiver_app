import 'dart:convert';

class WaiverFormModel {
  // Section A: Personal Information
  final String lastName;
  final String firstName;
  final String middleName;
  final String dateOfBirth;
  final String placeOfBirth;
  final String nationality;
  final String sex;
  final String citizenshipBy; // Birth, Naturalization, Registration, Marriage, Citizenship
  final String naturalizationSpecify;
  final String registrationSpecify;
  final String ethnicity;
  final String maritalStatus; // Single, Married, Separated, Divorced, Widowed, Common Law
  final String immigrationStatus; // Permanent Resident, Voluntary Remigrant, Involuntary Remigrant
  final String address;
  final String phoneNumber;
  final String cellNumber;
  final String email;
  final String idNumber;
  final String passportNumber;
  final String tin;

  // Section B: Employer Information
  final String profession;
  final String employerName;
  final String employerAddress;
  final String employerPhone;
  final String employerFax;
  final String employerEmail;

  // Section C: Business Information
  final String businessType;
  final String businessName;
  final String businessAddress;
  final String businessPhone;
  final String businessFax;
  final String businessEmail;

  // Section D: Vehicle Information
  final String registeredOwner;
  final String possessionName;
  final String vehicleType;
  final String registrationNumber;
  final String vehicleColour;
  final String seatingCapacity;
  final String identificationMark;
  final String chassisNumber;
  final String engineNumber;
  final String drivingLicenceNumber;
  final String dlExpiry;
  final String mvLicenceNumber;
  final String mvExpiry;
  final String fitnessNumber;
  final String fitnessExpiry;

  // Section E: Other
  final bool isFirstApplication;
  final String lastWaiverDate;

  // Signature
  final String? signatureData;
  final String signatureDate;

  WaiverFormModel({
    this.lastName = '',
    this.firstName = '',
    this.middleName = '',
    this.dateOfBirth = '',
    this.placeOfBirth = '',
    this.nationality = '',
    this.sex = 'Male',
    this.citizenshipBy = 'Birth',
    this.naturalizationSpecify = '',
    this.registrationSpecify = '',
    this.ethnicity = '',
    this.maritalStatus = 'Single',
    this.immigrationStatus = '',
    this.address = '',
    this.phoneNumber = '',
    this.cellNumber = '',
    this.email = '',
    this.idNumber = '',
    this.passportNumber = '',
    this.tin = '',
    this.profession = '',
    this.employerName = '',
    this.employerAddress = '',
    this.employerPhone = '',
    this.employerFax = '',
    this.employerEmail = '',
    this.businessType = '',
    this.businessName = '',
    this.businessAddress = '',
    this.businessPhone = '',
    this.businessFax = '',
    this.businessEmail = '',
    this.registeredOwner = '',
    this.possessionName = '',
    this.vehicleType = '',
    this.registrationNumber = '',
    this.vehicleColour = '',
    this.seatingCapacity = '',
    this.identificationMark = '',
    this.chassisNumber = '',
    this.engineNumber = '',
    this.drivingLicenceNumber = '',
    this.dlExpiry = '',
    this.mvLicenceNumber = '',
    this.mvExpiry = '',
    this.fitnessNumber = '',
    this.fitnessExpiry = '',
    this.isFirstApplication = true,
    this.lastWaiverDate = '',
    this.signatureData,
    this.signatureDate = '',
  });

  Map<String, dynamic> toJson() {
    return {
      'lastName': lastName,
      'firstName': firstName,
      'middleName': middleName,
      'dateOfBirth': dateOfBirth,
      'placeOfBirth': placeOfBirth,
      'nationality': nationality,
      'sex': sex,
      'citizenshipBy': citizenshipBy,
      'naturalizationSpecify': naturalizationSpecify,
      'registrationSpecify': registrationSpecify,
      'ethnicity': ethnicity,
      'maritalStatus': maritalStatus,
      'immigrationStatus': immigrationStatus,
      'address': address,
      'phoneNumber': phoneNumber,
      'cellNumber': cellNumber,
      'email': email,
      'idNumber': idNumber,
      'passportNumber': passportNumber,
      'tin': tin,
      'profession': profession,
      'employerName': employerName,
      'employerAddress': employerAddress,
      'employerPhone': employerPhone,
      'employerFax': employerFax,
      'employerEmail': employerEmail,
      'businessType': businessType,
      'businessName': businessName,
      'businessAddress': businessAddress,
      'businessPhone': businessPhone,
      'businessFax': businessFax,
      'businessEmail': businessEmail,
      'registeredOwner': registeredOwner,
      'possessionName': possessionName,
      'vehicleType': vehicleType,
      'registrationNumber': registrationNumber,
      'vehicleColour': vehicleColour,
      'seatingCapacity': seatingCapacity,
      'identificationMark': identificationMark,
      'chassisNumber': chassisNumber,
      'engineNumber': engineNumber,
      'drivingLicenceNumber': drivingLicenceNumber,
      'dlExpiry': dlExpiry,
      'mvLicenceNumber': mvLicenceNumber,
      'mvExpiry': mvExpiry,
      'fitnessNumber': fitnessNumber,
      'fitnessExpiry': fitnessExpiry,
      'isFirstApplication': isFirstApplication,
      'lastWaiverDate': lastWaiverDate,
      'signatureData': signatureData,
      'signatureDate': signatureDate,
    };
  }

  factory WaiverFormModel.fromJson(Map<String, dynamic> json) {
    return WaiverFormModel(
      lastName: json['lastName'] ?? '',
      firstName: json['firstName'] ?? '',
      middleName: json['middleName'] ?? '',
      dateOfBirth: json['dateOfBirth'] ?? '',
      placeOfBirth: json['placeOfBirth'] ?? '',
      nationality: json['nationality'] ?? '',
      sex: json['sex'] ?? 'Male',
      citizenshipBy: json['citizenshipBy'] ?? 'Birth',
      naturalizationSpecify: json['naturalizationSpecify'] ?? '',
      registrationSpecify: json['registrationSpecify'] ?? '',
      ethnicity: json['ethnicity'] ?? '',
      maritalStatus: json['maritalStatus'] ?? 'Single',
      immigrationStatus: json['immigrationStatus'] ?? '',
      address: json['address'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      cellNumber: json['cellNumber'] ?? '',
      email: json['email'] ?? '',
      idNumber: json['idNumber'] ?? '',
      passportNumber: json['passportNumber'] ?? '',
      tin: json['tin'] ?? '',
      profession: json['profession'] ?? '',
      employerName: json['employerName'] ?? '',
      employerAddress: json['employerAddress'] ?? '',
      employerPhone: json['employerPhone'] ?? '',
      employerFax: json['employerFax'] ?? '',
      employerEmail: json['employerEmail'] ?? '',
      businessType: json['businessType'] ?? '',
      businessName: json['businessName'] ?? '',
      businessAddress: json['businessAddress'] ?? '',
      businessPhone: json['businessPhone'] ?? '',
      businessFax: json['businessFax'] ?? '',
      businessEmail: json['businessEmail'] ?? '',
      registeredOwner: json['registeredOwner'] ?? '',
      possessionName: json['possessionName'] ?? '',
      vehicleType: json['vehicleType'] ?? '',
      registrationNumber: json['registrationNumber'] ?? '',
      vehicleColour: json['vehicleColour'] ?? '',
      seatingCapacity: json['seatingCapacity'] ?? '',
      identificationMark: json['identificationMark'] ?? '',
      chassisNumber: json['chassisNumber'] ?? '',
      engineNumber: json['engineNumber'] ?? '',
      drivingLicenceNumber: json['drivingLicenceNumber'] ?? '',
      dlExpiry: json['dlExpiry'] ?? '',
      mvLicenceNumber: json['mvLicenceNumber'] ?? '',
      mvExpiry: json['mvExpiry'] ?? '',
      fitnessNumber: json['fitnessNumber'] ?? '',
      fitnessExpiry: json['fitnessExpiry'] ?? '',
      isFirstApplication: json['isFirstApplication'] ?? true,
      lastWaiverDate: json['lastWaiverDate'] ?? '',
      signatureData: json['signatureData'],
      signatureDate: json['signatureDate'] ?? '',
    );
  }

  WaiverFormModel copyWith({
    String? lastName,
    String? firstName,
    String? middleName,
    String? dateOfBirth,
    String? placeOfBirth,
    String? nationality,
    String? sex,
    String? citizenshipBy,
    String? naturalizationSpecify,
    String? registrationSpecify,
    String? ethnicity,
    String? maritalStatus,
    String? immigrationStatus,
    String? address,
    String? phoneNumber,
    String? cellNumber,
    String? email,
    String? idNumber,
    String? passportNumber,
    String? tin,
    String? profession,
    String? employerName,
    String? employerAddress,
    String? employerPhone,
    String? employerFax,
    String? employerEmail,
    String? businessType,
    String? businessName,
    String? businessAddress,
    String? businessPhone,
    String? businessFax,
    String? businessEmail,
    String? registeredOwner,
    String? possessionName,
    String? vehicleType,
    String? registrationNumber,
    String? vehicleColour,
    String? seatingCapacity,
    String? identificationMark,
    String? chassisNumber,
    String? engineNumber,
    String? drivingLicenceNumber,
    String? dlExpiry,
    String? mvLicenceNumber,
    String? mvExpiry,
    String? fitnessNumber,
    String? fitnessExpiry,
    bool? isFirstApplication,
    String? lastWaiverDate,
    String? signatureData,
    String? signatureDate,
  }) {
    return WaiverFormModel(
      lastName: lastName ?? this.lastName,
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      placeOfBirth: placeOfBirth ?? this.placeOfBirth,
      nationality: nationality ?? this.nationality,
      sex: sex ?? this.sex,
      citizenshipBy: citizenshipBy ?? this.citizenshipBy,
      naturalizationSpecify: naturalizationSpecify ?? this.naturalizationSpecify,
      registrationSpecify: registrationSpecify ?? this.registrationSpecify,
      ethnicity: ethnicity ?? this.ethnicity,
      maritalStatus: maritalStatus ?? this.maritalStatus,
      immigrationStatus: immigrationStatus ?? this.immigrationStatus,
      address: address ?? this.address,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      cellNumber: cellNumber ?? this.cellNumber,
      email: email ?? this.email,
      idNumber: idNumber ?? this.idNumber,
      passportNumber: passportNumber ?? this.passportNumber,
      tin: tin ?? this.tin,
      profession: profession ?? this.profession,
      employerName: employerName ?? this.employerName,
      employerAddress: employerAddress ?? this.employerAddress,
      employerPhone: employerPhone ?? this.employerPhone,
      employerFax: employerFax ?? this.employerFax,
      employerEmail: employerEmail ?? this.employerEmail,
      businessType: businessType ?? this.businessType,
      businessName: businessName ?? this.businessName,
      businessAddress: businessAddress ?? this.businessAddress,
      businessPhone: businessPhone ?? this.businessPhone,
      businessFax: businessFax ?? this.businessFax,
      businessEmail: businessEmail ?? this.businessEmail,
      registeredOwner: registeredOwner ?? this.registeredOwner,
      possessionName: possessionName ?? this.possessionName,
      vehicleType: vehicleType ?? this.vehicleType,
      registrationNumber: registrationNumber ?? this.registrationNumber,
      vehicleColour: vehicleColour ?? this.vehicleColour,
      seatingCapacity: seatingCapacity ?? this.seatingCapacity,
      identificationMark: identificationMark ?? this.identificationMark,
      chassisNumber: chassisNumber ?? this.chassisNumber,
      engineNumber: engineNumber ?? this.engineNumber,
      drivingLicenceNumber: drivingLicenceNumber ?? this.drivingLicenceNumber,
      dlExpiry: dlExpiry ?? this.dlExpiry,
      mvLicenceNumber: mvLicenceNumber ?? this.mvLicenceNumber,
      mvExpiry: mvExpiry ?? this.mvExpiry,
      fitnessNumber: fitnessNumber ?? this.fitnessNumber,
      fitnessExpiry: fitnessExpiry ?? this.fitnessExpiry,
      isFirstApplication: isFirstApplication ?? this.isFirstApplication,
      lastWaiverDate: lastWaiverDate ?? this.lastWaiverDate,
      signatureData: signatureData ?? this.signatureData,
      signatureDate: signatureDate ?? this.signatureDate,
    );
  }

  bool isValid() {
    return lastName.isNotEmpty &&
        firstName.isNotEmpty &&
        address.isNotEmpty &&
        cellNumber.isNotEmpty &&
        idNumber.isNotEmpty &&
        tin.isNotEmpty &&
        registeredOwner.isNotEmpty &&
        registrationNumber.isNotEmpty &&
        chassisNumber.isNotEmpty &&
        signatureData != null &&
        signatureDate.isNotEmpty;
  }
}
