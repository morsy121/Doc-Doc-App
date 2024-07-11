import 'package:appointement_booking_app/core/networking/api_service.dart';
import 'package:appointement_booking_app/core/networking/dio_factory.dart';
import 'package:appointement_booking_app/features/login/data/repo/login_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/login/presentaion/logic/login_cubit/login_cubit.dart';

final getIt = GetIt.instance;
Future<void> setupGetIt() async {
  getIt.registerSingleton(());

  ///dio and Api Sercices
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio));

  ///login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt<ApiServices>()));
  getIt.registerLazySingleton<LogincubitCubit>(
      () => LogincubitCubit(getIt<LoginRepo>()));
}
