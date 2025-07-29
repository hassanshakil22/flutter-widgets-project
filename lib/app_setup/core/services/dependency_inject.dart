
import 'package:flutter_widgets/app_setup/core/services/http_service.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

void setupLocator() {
  // Services
  sl.registerLazySingleton<HttpService>(() => HttpService());

  // Repositories
  // sl.registerLazySingleton<RegistrationRepository>(
  //   () => RegistrationRepository(httpService: sl<HttpService>()),
  // );
  // sl.registerLazySingleton<AuthRepository>(
  //   () => AuthRepository(httpService: sl<HttpService>()),
  // );
  // sl.registerLazySingleton<AssignRepository>(
  //   () => AssignRepository(httpService: sl<HttpService>()),
  // );
  // sl.registerLazySingleton<HomeRepository>(
  //   () => HomeRepository(httpService: sl<HttpService>()),
  // );
  // // sl.registerLazySingleton<OnboardingRepository>(
  // //   () => OnboardingRepository(httpService: sl<HttpService>()),
  // // );
  // // sl.registerLazySingleton<HomeRepository>(
  // //   () => HomeRepository(httpService: sl<HttpService>()),
  // // );

  // // Providers
  // sl.registerFactory<NavBarProvider>(() => NavBarProvider());
  // sl.registerFactory<GuardRegistrationProvider>(
  //   () =>
  //       GuardRegistrationProvider(regRepository: sl<RegistrationRepository>()),
  // );
  // sl.registerFactory<ClientRegistrationProvider>(
  //   () =>
  //       ClientRegistrationProvider(regRepository: sl<RegistrationRepository>()),
  // );
  // sl.registerFactory<AuthProvider>(
  //   () => AuthProvider(authRepository: sl<AuthRepository>()),
  // );
  // sl.registerFactory<HomeProvider>(
  //   () => HomeProvider(homeRepository: sl<HomeRepository>()),
  // );
  // sl.registerFactory<AssignProvider>(
  //   () => AssignProvider(assignRepository: sl<AssignRepository>()),
  // );

  // sl.registerFactory<AuthValidationProvider>(() => AuthValidationProvider());
  // sl.registerFactory<HomeProvider>(
  //   () => HomeProvider(),
  // );
  // // sl.registerFactory<LocationProvider>(() => LocationProvider());
  // sl.registerFactory<NavBarProvider>(() => NavBarProvider());
  // sl.registerFactory<LocationProvider>(() => LocationProvider());
  // // sl.registerFactory<BuyerProvider>(() => BuyerProvider());
  // sl.registerFactory<OnboardingProvider>(
  //   () => OnboardingProvider(authRepository: sl<AuthRepository>()),
  // );
}
