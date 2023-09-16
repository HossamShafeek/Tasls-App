import 'package:dio/dio.dart';
import 'package:tasks_app/core/api/api_services.dart';
import 'package:tasks_app/core/api/end_points.dart';

class ApiServicesImplementation implements ApiServices {
  Dio? _dio;

  ApiServicesImplementation() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: EndPoints.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 10 * 1000, //10 second
      receiveTimeout: 10 * 1000,
    );
    _dio = Dio(baseOptions);
  }

  @override
  Future<Map<String, dynamic>> get({
    required String endPoint,
    required Map<String, dynamic> queryParameters,
  }) async {
    Response response =
        await _dio!.get(endPoint, queryParameters: queryParameters);
    return response.data;
  }

  @override
  Future<Response> post(
      {required String endPoint,
      Map<String, dynamic>? queryParameters,
      required Map<String, dynamic> data}) async {
    // _dio!.options.headers = {
    //   'Authorization': token??'',
    //   'Content-Type': 'application/json',
    // };
    return await _dio!.post(
      endPoint,
      queryParameters: queryParameters,
      data: data,
    );
  }
}
