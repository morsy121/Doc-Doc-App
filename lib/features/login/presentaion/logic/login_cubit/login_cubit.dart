import 'package:appointement_booking_app/features/login/data/models/login_request_body.dart';
import 'package:appointement_booking_app/features/login/data/repo/login_repo.dart';
import 'package:appointement_booking_app/features/login/presentaion/logic/login_cubit/login_state.dart';
import "package:bloc/bloc.dart";
import 'package:flutter/material.dart';

class LogincubitCubit extends Cubit<LogincubitState> {
  final LoginRepo _loginRepo;
  LogincubitCubit(
    this._loginRepo,
  ) : super(const LogincubitState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  void emitLoginStates(LoginRequestBody loginRequestBody) async {
    emit(const LogincubitState.loading());
    final response = await _loginRepo.login(loginRequestBody);
    response.when(success: (loginresponse) {
      emit(LogincubitState.success(loginresponse));
    }, failure: (error) {
      emit(LogincubitState.error(error: error.apiErrorModel.message ?? ""));
    });
  }
}
