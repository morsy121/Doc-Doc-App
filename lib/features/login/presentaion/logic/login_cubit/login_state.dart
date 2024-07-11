import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_state.freezed.dart';

@freezed
class LogincubitState<T> with _$LogincubitState<T> {
  const factory LogincubitState.initial() = _Initial;
  const factory LogincubitState.loading() = Loading;
  const factory LogincubitState.success(T data) = Success<T>;
  const factory LogincubitState.error({required String error}) = Error;
}
