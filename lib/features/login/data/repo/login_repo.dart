import 'package:appointement_booking_app/core/networking/api_error_handlar.dart';
import 'package:appointement_booking_app/core/networking/api_result.dart';
import 'package:appointement_booking_app/core/networking/api_service.dart';
import 'package:appointement_booking_app/features/login/data/models/login_request_body.dart';
import 'package:appointement_booking_app/features/login/data/models/login_response.dart';

class LoginRepo {
  final ApiServices _apiServices;

  LoginRepo(this._apiServices);

  Future<ApiResult<LoginResponse>> login(
      LoginRequestBody loginRequestBody) async {
    try {
      final response = await _apiServices.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
