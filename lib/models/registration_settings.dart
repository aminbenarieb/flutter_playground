import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';



@immutable
class RegistrationSettings {

  const RegistrationSettings({
    required this.status,
  });

  final int status;

  factory RegistrationSettings.fromJson(Map<String,dynamic> json) => RegistrationSettings(
    status: json['status'] as int
  );
  
  Map<String, dynamic> toJson() => {
    'status': status
  };

  RegistrationSettings clone() => RegistrationSettings(
    status: status
  );


  RegistrationSettings copyWith({
    int? status
  }) => RegistrationSettings(
    status: status ?? this.status,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is RegistrationSettings && status == other.status;

  @override
  int get hashCode => status.hashCode;
}
