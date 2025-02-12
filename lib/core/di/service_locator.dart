import 'package:get_it/get_it.dart';
import 'package:weather_ai/festures/auth/data/data_source/remote_data_source.dart';
import 'package:weather_ai/festures/auth/data/repo/auth_repo_impl.dart';
import 'package:weather_ai/festures/auth/domain/repo/base_auth_repo.dart';
import 'package:weather_ai/festures/auth/domain/usecases/login_usecase.dart';
import 'package:weather_ai/festures/auth/domain/usecases/sign_up_usecase.dart';
import 'package:weather_ai/festures/auth/presentation/cubits/auth_cubit/auth_cubit.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static void setup() {
    //// Cubits
    sl.registerLazySingleton(() => AuthCubit(sl(), sl()));

    //// UseCases
    sl.registerLazySingleton(() => LoginUsecase(sl()));
    sl.registerLazySingleton(() => SignUpUsecase(sl()));

    //// Repositories
    sl.registerLazySingleton<BaseAuthRepo>(() => AuthRepoImpl(sl()));

    //// DataSources
    sl.registerLazySingleton(() => RemoteDataSource());
  }
}
