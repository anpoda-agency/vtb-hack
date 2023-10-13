import 'package:dio/dio.dart';
import 'package:vtb_hack/data/models/offers/department_request.dart';
import 'package:vtb_hack/data/models/offers/department_response.dart';
import 'package:vtb_hack/data/network/api/map_api.dart';
import 'package:vtb_hack/data/network/dio_exception.dart';

class MapRepository {
  final MapApi mapApi;

  MapRepository({required this.mapApi});

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
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
