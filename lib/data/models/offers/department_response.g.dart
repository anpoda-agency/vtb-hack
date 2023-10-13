// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepartmentResponse _$DepartmentResponseFromJson(Map<String, dynamic> json) =>
    DepartmentResponse(
      department: json['department'] == null
          ? ''
          : FromJsonBase.jsonToString(json['department']),
      longitude: json['longitude'] == null
          ? 0
          : FromJsonBase.jsonToDouble(json['longitude']),
      latitude: json['latitude'] == null
          ? 0
          : FromJsonBase.jsonToDouble(json['latitude']),
      service: json['service'] == null
          ? const []
          : FromJsonBase.jsonToListInt(json['service']),
      workload: json['workload'] == null
          ? 0
          : FromJsonBase.jsonToDouble(json['workload']),
      radius:
          json['radius'] == null ? 0 : FromJsonBase.jsonToInt(json['radius']),
      accountWorkload: json['accountWorkload'] == null
          ? false
          : FromJsonBase.jsonToBool(json['accountWorkload']),
    );

Map<String, dynamic> _$DepartmentResponseToJson(DepartmentResponse instance) =>
    <String, dynamic>{
      'department': instance.department,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'service': instance.service,
      'workload': instance.workload,
      'radius': instance.radius,
      'accountWorkload': instance.accountWorkload,
    };
