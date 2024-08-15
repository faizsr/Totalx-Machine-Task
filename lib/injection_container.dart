import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:totalx_machine_task/src/feature/auth/data/data_source/local/auth_local_datasource.dart';
import 'package:totalx_machine_task/src/feature/auth/data/data_source/local/auth_local_datasource_impl.dart';
import 'package:totalx_machine_task/src/feature/auth/data/data_source/remote/auth_remote_datasource.dart';
import 'package:totalx_machine_task/src/feature/auth/data/data_source/remote/auth_remote_datasource_impl.dart';
import 'package:totalx_machine_task/src/feature/auth/data/repositories/auth_repository_impl.dart';
import 'package:totalx_machine_task/src/feature/auth/domain/repositories/auth_repository.dart';
import 'package:totalx_machine_task/src/feature/auth/domain/usecases/get_login_status_usecase.dart';
import 'package:totalx_machine_task/src/feature/auth/domain/usecases/logout_usecase.dart';
import 'package:totalx_machine_task/src/feature/auth/domain/usecases/send_otp_usecase.dart';
import 'package:totalx_machine_task/src/feature/auth/domain/usecases/set_login_status_usecase.dart';
import 'package:totalx_machine_task/src/feature/auth/domain/usecases/verify_otp_usecase.dart';
import 'package:totalx_machine_task/src/feature/auth/presentation/providers/auth_provider.dart';
import 'package:totalx_machine_task/src/feature/user_management/data/data_source/remote/manage_user_data_source.dart';
import 'package:totalx_machine_task/src/feature/user_management/data/data_source/remote/manage_user_data_source_impl.dart';
import 'package:totalx_machine_task/src/feature/user_management/data/repositories/manage_user_repository_impl.dart';
import 'package:totalx_machine_task/src/feature/user_management/domain/repositories/manage_user_repository.dart';
import 'package:totalx_machine_task/src/feature/user_management/domain/usecases/add_user_usecase.dart';
import 'package:totalx_machine_task/src/feature/user_management/domain/usecases/get_all_users_usecase.dart';
import 'package:totalx_machine_task/src/feature/user_management/presentation/providers/manage_user_provider.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  await Firebase.initializeApp();

  final sharedPreferences = await SharedPreferences.getInstance();

  getIt.registerLazySingleton(() => sharedPreferences);

  // ------ Providers ------
  getIt.registerFactory<AuthProvider>(
    () => AuthProvider(
      sendOtpUsecase: getIt.call(),
      verifyOtpUsecase: getIt.call(),
      logoutUsecase: getIt.call(),
      setLoginStatusUsecase: getIt.call(),
    ),
  );
  getIt.registerFactory<ManageUserProvider>(
    () => ManageUserProvider(
      addUserUsecase: getIt.call(),
      getAllUsersUsecase: getIt.call(),
    ),
  );

  // ------ Use Cases ------
  getIt.registerLazySingleton<SendOtpUsecase>(
    () => SendOtpUsecase(authRepository: getIt.call()),
  );
  getIt.registerLazySingleton<VerifyOtpUsecase>(
    () => VerifyOtpUsecase(authRepository: getIt.call()),
  );
  getIt.registerLazySingleton<SetLoginStatusUsecase>(
    () => SetLoginStatusUsecase(authRepository: getIt.call()),
  );
  getIt.registerLazySingleton<GetLoginStatusUsecase>(
    () => GetLoginStatusUsecase(authRepository: getIt.call()),
  );
  getIt.registerLazySingleton<LogoutUsecase>(
    () => LogoutUsecase(authRepository: getIt.call()),
  );
  getIt.registerLazySingleton<AddUserUsecase>(
    () => AddUserUsecase(manageUserRepository: getIt.call()),
  );
  getIt.registerLazySingleton<GetAllUsersUsecase>(
    () => GetAllUsersUsecase(manageUserRepository: getIt.call()),
  );

  // ------ Repositories ------
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authRemoteDatasource: getIt.call(),
      authLocalDatasource: getIt.call(),
    ),
  );
  getIt.registerLazySingleton<ManageUserRepository>(
    () => ManageUserRepositoryImpl(
      manageUserDataSource: getIt.call(),
    ),
  );

  // ------ Data Sources (Remote) ------
  getIt.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImpl(),
  );
  getIt.registerLazySingleton<ManageUserDataSource>(
    () => ManageUserDataSourceImpl(),
  );

  // ------ Data Sources (Local) ------
  getIt.registerLazySingleton<AuthLocalDatasource>(
    () => AuthLocalDatasourceImpl(sharedPreferences: getIt.call()),
  );
}
