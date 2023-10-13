import 'package:dio/dio.dart';
import 'package:vtb_hack/data/network/api/map_api.dart';

class MapRepository {
  final MapApi mapApi;

  MapRepository({required this.mapApi});

  // Future<CodeSendActivationResponse> codeSend({required CodeSendActivationRequest request}) async {
  //   try {
  //     final response = await activationCodeApi.codeSend(request: request);
  //     return CodeSendActivationResponse.fromJson(response.data);
  //   } on DioException catch (e) {
  //     final errorMessage = DioExceptions.fromDioError(e).toString();
  //     throw errorMessage;
  //   }
  // }
}
