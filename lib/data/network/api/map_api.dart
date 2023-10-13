import 'package:dio/dio.dart';
import 'package:vtb_hack/core/constants.dart';
import 'package:vtb_hack/data/network/dio_client.dart';

class MapApi {
  final DioClient dioClient;

  MapApi({required this.dioClient});

  // Future<Response> getDepartments({required CodeSendActivationRequest request}) async {
  //   try {
  //     final Response response = await dioClient.post(
  //       AppConstants.department,
  //       body: request.toJson(),
  //     );
  //     return response;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
