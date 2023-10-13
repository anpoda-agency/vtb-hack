// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:vtb_hack/data/models/from_json.dart';

part 'department_response.g.dart';

@JsonSerializable()
class DepartmentResponse {
  @JsonKey(name: 'department', fromJson: FromJsonBase.jsonToString)
  final String department;
  @JsonKey(name: 'longitude', fromJson: FromJsonBase.jsonToDouble)
  final double longitude;
  @JsonKey(name: 'latitude', fromJson: FromJsonBase.jsonToDouble)
  final double latitude;
  @JsonKey(name: 'service', fromJson: FromJsonBase.jsonToListInt)
  final List<int> service;
  @JsonKey(name: 'workload', fromJson: FromJsonBase.jsonToDouble)
  final double workload;
  @JsonKey(name: 'radius', fromJson: FromJsonBase.jsonToInt)
  final int radius;
  @JsonKey(name: 'accountWorkload', fromJson: FromJsonBase.jsonToBool)
  final bool accountWorkload;

  const DepartmentResponse({
    this.department = '',
    this.longitude = 0,
    this.latitude = 0,
    this.service = const [],
    this.workload = 0,
    this.radius = 0,
    this.accountWorkload = false,
  });

  factory DepartmentResponse.fromJson(Map<String, dynamic> json) =>
      _$DepartmentResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DepartmentResponseToJson(this);

  DepartmentResponse copyWith({
    String? department,
    double? longitude,
    double? latitude,
    List<int>? service,
    double? workload,
    int? radius,
    bool? accountWorkload,
  }) {
    return DepartmentResponse(
      department: department ?? this.department,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      service: service ?? this.service,
      workload: workload ?? this.workload,
      radius: radius ?? this.radius,
      accountWorkload: accountWorkload ?? this.accountWorkload,
    );
  }
}
