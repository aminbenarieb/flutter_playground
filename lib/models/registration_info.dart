import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';



@immutable
class RegistrationInfo {

  const RegistrationInfo({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.birthDate,
    required this.cityId,
    required this.drivingExperienceYears,
    required this.carName,
    required this.carColor,
    required this.carIssueYear,
    required this.carNumberPlate,
    required this.iin,
  });

  final String firstName;
  final String lastName;
  final String phone;
  final String birthDate;
  final int cityId;
  final int drivingExperienceYears;
  final String carName;
  final String carColor;
  final int carIssueYear;
  final String carNumberPlate;
  final String iin;

  factory RegistrationInfo.fromJson(Map<String,dynamic> json) => RegistrationInfo(
    firstName: json['first_name'].toString(),
    lastName: json['last_name'].toString(),
    phone: json['phone'].toString(),
    birthDate: json['birth_date'].toString(),
    cityId: json['city_id'] as int,
    drivingExperienceYears: json['driving_experience_years'] as int,
    carName: json['car_name'].toString(),
    carColor: json['car_color'].toString(),
    carIssueYear: json['car_issue_year'] as int,
    carNumberPlate: json['car_number_plate'].toString(),
    iin: json['iin'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'first_name': firstName,
    'last_name': lastName,
    'phone': phone,
    'birth_date': birthDate,
    'city_id': cityId,
    'driving_experience_years': drivingExperienceYears,
    'car_name': carName,
    'car_color': carColor,
    'car_issue_year': carIssueYear,
    'car_number_plate': carNumberPlate,
    'iin': iin
  };

  RegistrationInfo clone() => RegistrationInfo(
    firstName: firstName,
    lastName: lastName,
    phone: phone,
    birthDate: birthDate,
    cityId: cityId,
    drivingExperienceYears: drivingExperienceYears,
    carName: carName,
    carColor: carColor,
    carIssueYear: carIssueYear,
    carNumberPlate: carNumberPlate,
    iin: iin
  );


  RegistrationInfo copyWith({
    String? firstName,
    String? lastName,
    String? phone,
    String? birthDate,
    int? cityId,
    int? drivingExperienceYears,
    String? carName,
    String? carColor,
    int? carIssueYear,
    String? carNumberPlate,
    String? iin
  }) => RegistrationInfo(
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
    phone: phone ?? this.phone,
    birthDate: birthDate ?? this.birthDate,
    cityId: cityId ?? this.cityId,
    drivingExperienceYears: drivingExperienceYears ?? this.drivingExperienceYears,
    carName: carName ?? this.carName,
    carColor: carColor ?? this.carColor,
    carIssueYear: carIssueYear ?? this.carIssueYear,
    carNumberPlate: carNumberPlate ?? this.carNumberPlate,
    iin: iin ?? this.iin,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is RegistrationInfo && firstName == other.firstName && lastName == other.lastName && phone == other.phone && birthDate == other.birthDate && cityId == other.cityId && drivingExperienceYears == other.drivingExperienceYears && carName == other.carName && carColor == other.carColor && carIssueYear == other.carIssueYear && carNumberPlate == other.carNumberPlate && iin == other.iin;

  @override
  int get hashCode => firstName.hashCode ^ lastName.hashCode ^ phone.hashCode ^ birthDate.hashCode ^ cityId.hashCode ^ drivingExperienceYears.hashCode ^ carName.hashCode ^ carColor.hashCode ^ carIssueYear.hashCode ^ carNumberPlate.hashCode ^ iin.hashCode;
}
