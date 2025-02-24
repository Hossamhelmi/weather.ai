import 'package:get_it/get_it.dart';
import 'package:weather_ai/festures/auth/data/data_source/remote_data_source.dart';
import 'package:weather_ai/festures/auth/data/repo/auth_repo_impl.dart';
import 'package:weather_ai/festures/auth/domain/repo/base_auth_repo.dart';
import 'package:weather_ai/festures/auth/domain/usecases/login_usecase.dart';
import 'package:weather_ai/festures/auth/domain/usecases/sign_up_usecase.dart';
import 'package:weather_ai/festures/auth/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:weather_ai/festures/home/data/data_source/weather_remote_data_source.dart';
import 'package:weather_ai/festures/home/data/repo/weather_repo_impl.dart';
import 'package:weather_ai/festures/home/domain/repo/base_weather_repo.dart';
import 'package:weather_ai/festures/home/domain/use_case/get_weather_usecase.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static void setup() {
    //// Cubits
    sl.registerLazySingleton(() => AuthCubit(sl(), sl()));

    //// UseCases
    sl.registerLazySingleton(() => LoginUsecase(sl()));
    sl.registerLazySingleton(() => SignUpUsecase(sl()));
    sl.registerLazySingleton(() => GetWeatherUsecase(sl()));

    //// Repositories
    sl.registerLazySingleton<BaseAuthRepo>(() => AuthRepoImpl(sl()));
    sl.registerLazySingleton<BaseWeatherRepo>(() => WeatherRepoImpl(sl()));


    //// DataSources
    sl.registerLazySingleton(() => RemoteDataSourceAuth());
    sl.registerLazySingleton(() => RemoteDataSourceWeather());
  }
}
