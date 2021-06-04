import 'package:coddr/data/core/api_client.dart';
import 'package:coddr/data/data_sources/authentication_data_source.dart';
import 'package:coddr/data/data_sources/remote_data_source.dart';
import 'package:coddr/data/repositories/platform_repository_impl.dart';
import 'package:coddr/domain/usecases/get_cf_contest_list.dart';
import 'package:coddr/domain/usecases/get_emailId.dart';
import 'package:coddr/domain/usecases/is_signed_in.dart';
import 'package:coddr/domain/usecases/sign_in.dart';
import 'package:coddr/domain/usecases/sign_out.dart';
import 'package:coddr/domain/usecases/sign_up.dart';
import 'package:coddr/presentation/blocs/contest_listing/contest_listing_bloc.dart';
import 'package:coddr/presentation/journeys/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final getItInstance = GetIt.I;

Future init() async {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  getItInstance.registerLazySingleton<Client>(() => Client());
  getItInstance
      .registerLazySingleton<APIClient>(() => APIClient(getItInstance()));
  getItInstance.registerFactory<RemoteDataSourceImpl>(
      () => RemoteDataSourceImpl(apiClient: getItInstance()));

  getItInstance.registerFactory(
      () => AuthenticationDataSourceImpl(firebaseAuth: firebaseAuth));

  getItInstance.registerLazySingleton<PlatformRepositoryImpl>(() =>
      PlatformRepositoryImpl(
          remoteDataSourceImpl: getItInstance(),
          authenticationDataSourceImpl: getItInstance()));

  getItInstance.registerLazySingleton<HomeScreen>(() => HomeScreen());

  getItInstance.registerLazySingleton<GetCFContestList>(
      () => GetCFContestList(platformRepository: getItInstance()));

  getItInstance.registerLazySingleton<GetEmailId>(
      () => GetEmailId(platformRepositoryImpl: getItInstance()));

  getItInstance.registerLazySingleton<IsSignedIn>(
      () => IsSignedIn(platformRepositoryImpl: getItInstance()));

  getItInstance.registerLazySingleton<SignIn>(
      () => SignIn(platformRepositoryImpl: getItInstance()));

  getItInstance.registerLazySingleton<SignOut>(
      () => SignOut(platformRepositoryImpl: getItInstance()));

  getItInstance.registerLazySingleton<SignUp>(
      () => SignUp(platformRepositoryImpl: getItInstance()));

  getItInstance.registerLazySingleton<ContestListingBloc>(
      () => ContestListingBloc(getCFContestList: getItInstance()));
}
