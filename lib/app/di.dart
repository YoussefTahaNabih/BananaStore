import 'package:app/app/app_prefs.dart';
import 'package:app/data/data_source/local_dataSource.dart';
import 'package:app/data/data_source/remote_dataSource.dart';
import 'package:app/data/network/app_api.dart';
import 'package:app/data/network/dio_factory.dart';
import 'package:app/data/network/network_info.dart';
import 'package:app/data/repository/repository_impl.dart';
import 'package:app/domain/usecase/forgetPass_usecase.dart';
import 'package:app/domain/usecase/home_usecase.dart';
import 'package:app/domain/usecase/login_usecase.dart';
import 'package:app/domain/usecase/register_usecase.dart';
import 'package:app/presentation/forget_pass/view_model/forgetpass_viewmodel.dart';
import 'package:app/presentation/login/view_model/login_viewmodel.dart';
import 'package:app/presentation/main/pages/home/view_model/home_view_model.dart';
import 'package:app/presentation/regester/view_model/register_viewmodel.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../domain/repository/repository.dart';
import '../domain/usecase/details_usecase.dart';
import '../presentation/store_details/view_model/details_view_models.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPrefs = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));
  Dio dio = await instance<DioFactory>().getDio();

  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(instance<AppServiceClient>()));
  // repository

  instance.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());
  instance.registerLazySingleton<Repository>(
      () => RepositoryImpl(instance(), instance(), instance()));
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}

initForgotPasswordModule() {
  if (!GetIt.I.isRegistered<ForgetPassUseCase>()) {
    instance.registerFactory<ForgetPassUseCase>(
        () => ForgetPassUseCase(instance()));
    instance.registerFactory<ForgotPasswordViewModel>(
        () => ForgotPasswordViewModel(instance()));
  }
}

initRegisterModule() {
  if (!GetIt.I.isRegistered<RegisterUseCase>()) {
    instance
        .registerFactory<RegisterUseCase>(() => RegisterUseCase(instance()));
    instance.registerFactory<RegisterViewModel>(
        () => RegisterViewModel(instance()));
    instance.registerFactory<ImagePicker>(() => ImagePicker());
  }
}

initHomeModule() {
  if (!GetIt.I.isRegistered<HomeUseCase>()) {
    instance.registerFactory<HomeUseCase>(() => HomeUseCase(instance()));
    instance.registerFactory<HomeViewModel>(() => HomeViewModel(instance()));
  }
}

initStoreDetailsModule() {
  if (!GetIt.I.isRegistered<StoreDetailsUseCase>()) {
    instance.registerFactory<StoreDetailsUseCase>(
        () => StoreDetailsUseCase(instance()));
    instance.registerFactory<StoreDetailsViewModel>(
        () => StoreDetailsViewModel(instance()));
  }
}
