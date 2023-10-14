import 'package:dio/dio.dart';
import 'package:vtb_hack/data/models/offers/department_request.dart';
import 'package:vtb_hack/data/models/offers/department_response.dart';
import 'package:vtb_hack/data/network/api/map_api.dart';
import 'package:vtb_hack/data/network/dio_exception.dart';

class MapRepository {
  final MapApi mapApi;

  MapRepository({required this.mapApi});

  var ex = [
    {
      "department": "Советская улица, 51",
      "longitude": 51.529646,
      "latitude": 46.018195,
      "service": [1],
      "workload": 2.0,
      "radius": 150,
      "accountWorkload": false
    },
    {
      "department": "Мирная улица, 5",
      "longitude": 51.629646,
      "latitude": 46.118195,
      "service": [2],
      "workload": 1.0,
      "radius": 150,
      "accountWorkload": false
    },
    {
      "department": "Верная улица, 5",
      "longitude": 52.629646,
      "latitude": 47.118195,
      "service": [1, 2],
      "workload": 1.5,
      "radius": 150,
      "accountWorkload": false
    }
  ];

  Future<List<DepartmentResponse>> getDepartments({required DepartmentRequest request}) async {
    try {
      final response = await mapApi.getDepartments(request: request);
      if (response.data is List<dynamic>) {
        List<DepartmentResponse> list = [];
        for (dynamic item in response.data as List<dynamic>) {
          list.add(DepartmentResponse.fromJson(item as Map<String, dynamic>));
        }
        return list;
      }
      return [];
      // List<DepartmentResponse> list = [];
      // for (var item in ex) {
      //   list.add(DepartmentResponse.fromJson(item as Map<String, dynamic>));
      // }
      // return list;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
