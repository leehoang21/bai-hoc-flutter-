import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:messenger_app/screens/signup/signup.dart';
import 'package:messenger_app/screens/verifying_email/domain/usecase/check_verified.dart';
import 'package:messenger_app/screens/verifying_email/domain/usecase/send_email_verify.dart';
import 'package:messenger_app/screens/verifying_email/verify.dart';
import 'screens/home/home.dart';
import 'screens/login/login.dart';
import 'core/core.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! External
  sl.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  sl.registerSingleton<FacebookAuth>(FacebookAuth.instance);
  sl.registerSingleton<GoogleSignIn>(GoogleSignIn());

  // Blocs
  sl.registerFactory<LoginCubit>(
    () => LoginCubit(
        loginEmail: sl.get<LoginEmail>(),
        loginFace: sl.get<LoginFace>(),
        loginGoogle: sl.get<LoginGoogle>()),
  );
  sl.registerFactory<HomeCubit>(
    () => HomeCubit(
      signOut: sl.get<SignOut>(),
      getUser: sl.get<GetUser>(),
    ),
  );
  sl.registerFactory<SignUpCubit>(
    () => SignUpCubit(
      sl.get<SignUpWithEmailAndPassword>(),
    ),
  );
  sl.registerFactory<VerifyCubit>(
    () => VerifyCubit(
      cancelVerify: sl.get<CancelVerify>(),
      checkVerify: sl.get<CheckVerify>(),
      sendEmailVerify: sl.get<SendEmailVerify>(),
    ),
  );

  // Use cases
  sl.registerLazySingleton<LoginEmail>(
      () => LoginEmail(sl.get<LoginRepository>()));
  sl.registerLazySingleton<LoginFace>(
      () => LoginFace(sl.get<LoginRepository>()));
  sl.registerLazySingleton<LoginGoogle>(
      () => LoginGoogle(sl.get<LoginRepository>()));
  sl.registerLazySingleton<GetUser>(() => GetUser(sl.get<HomeRepository>()));
  sl.registerLazySingleton<SignOut>(() => SignOut(sl.get<HomeRepository>()));
  sl.registerLazySingleton<SignUpWithEmailAndPassword>(
    () => SignUpWithEmailAndPassword(sl.get<SignUpRepositories>()),
  );
  sl.registerLazySingleton<CancelVerify>(
    () => CancelVerify(sl.get<VerifyRepositories>()),
  );
  sl.registerLazySingleton<CheckVerify>(
    () => CheckVerify(sl.get<VerifyRepositories>()),
  );
  sl.registerLazySingleton<SendEmailVerify>(
    () => SendEmailVerify(sl.get<VerifyRepositories>()),
  );

  // Repository
  sl.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(
      remoteDatasource: sl.get<LoginRemoteDatasource>(),
      localDataSource: sl.get<LoginLocalDataSource>(),
    ),
  );
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      remoteDataSource: sl.get<HomeRemoteLocalDataSource>(),
      localDataSource: sl.get<HomeLocalDataSource>(),
    ),
  );
  sl.registerLazySingleton<SignUpRepositories>(
    () => SignUpRepositoriesImpl(
      remoteDataSource: sl.get<SignUpRemoteDataSource>(),
    ),
  );
  sl.registerLazySingleton<VerifyRepositories>(
    () => VerifyRepositoriesImpl(
      remoteDataSource: sl.get<VerifyRemoteDataSource>(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<LoginRemoteDatasource>(
    () => LoginRemoteDatasource(
      firebaseAuth: sl.get<FirebaseAuth>(),
      facebookAuth: sl.get<FacebookAuth>(),
      googleSignIn: sl.get<GoogleSignIn>(),
    ),
  );
  sl.registerLazySingleton<HomeRemoteLocalDataSource>(
    () => HomeRemoteLocalDataSource(sl.get<FirebaseAuth>()),
  );
  sl.registerLazySingleton<SignUpRemoteDataSource>(
    () => SignUpRemoteDataSource(firebaseAuth: sl.get<FirebaseAuth>()),
  );
  sl.registerLazySingleton<VerifyRemoteDataSource>(
    () => VerifyRemoteDataSource(firebaseAuth: sl.get<FirebaseAuth>()),
  );

  sl.registerLazySingleton<LoginLocalDataSource>(
    () => LoginLocalDataSource(cacheClient: sl.get<CacheClient>()),
  );
  sl.registerLazySingleton<HomeLocalDataSource>(
    () => HomeLocalDataSource(cacheClient: sl.get<CacheClient>()),
  );

  //! Core
  sl.registerLazySingleton<CacheClient>(() => CacheClient());
}
