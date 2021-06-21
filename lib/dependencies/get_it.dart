import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coddr/data/core/api_client.dart';
import 'package:coddr/data/data_sources/authentication_data_source.dart';
import 'package:coddr/data/data_sources/remote_data_source.dart';
import 'package:coddr/data/repositories/platform_repository_impl.dart';
import 'package:coddr/domain/usecases/get_cf_contest_list.dart';
import 'package:coddr/domain/usecases/get_cf_user.dart';
import 'package:coddr/domain/usecases/get_emailId.dart';
import 'package:coddr/domain/usecases/is_signed_in.dart';
import 'package:coddr/domain/usecases/sign_in.dart';
import 'package:coddr/domain/usecases/sign_out.dart';
import 'package:coddr/domain/usecases/sign_up.dart';
import 'package:coddr/domain/usecases/store_user_credentials.dart';
import 'package:coddr/domain/usecases/verify_email.dart';
import 'package:coddr/presentation/blocs/authentication/authentication_bloc.dart';
import 'package:coddr/presentation/blocs/contest_listing/contest_listing_bloc.dart';
import 'package:coddr/presentation/blocs/signIn/signin_bloc.dart';
import 'package:coddr/presentation/blocs/signup/signup_bloc.dart';
import 'package:coddr/presentation/journeys/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final getItInstance = GetIt.I;

Future init() async {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  getItInstance.registerLazySingleton<Client>(() => Client());

  getItInstance
      .registerLazySingleton<APIClient>(() => APIClient(getItInstance()));

  getItInstance
      .registerLazySingleton<RemoteDataSourceImpl>(() => RemoteDataSourceImpl(
            apiClient: getItInstance(),
            firebaseFirestore: firebaseFirestore,
            authenticationDataSourceImpl: getItInstance(),
          ));

  getItInstance.registerLazySingleton(
      () => AuthenticationDataSourceImpl(firebaseAuth: firebaseAuth));

  getItInstance.registerLazySingleton<PlatformRepositoryImpl>(() =>
      PlatformRepositoryImpl(
          remoteDataSourceImpl: getItInstance(),
          authenticationDataSourceImpl: getItInstance()));

  getItInstance.registerLazySingleton<HomeScreen>(() => HomeScreen());

  getItInstance.registerLazySingleton<GetCFContestList>(
      () => GetCFContestList(platformRepository: getItInstance()));

  getItInstance.registerLazySingleton<GetCFUser>(
      () => GetCFUser(platformRepository: getItInstance()));

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

  getItInstance.registerLazySingleton<VerifyEmail>(
      () => VerifyEmail(platformRepositoryImpl: getItInstance()));

  getItInstance.registerFactory<ContestListingBloc>(
      () => ContestListingBloc(getCFContestList: getItInstance()));

  getItInstance.registerLazySingleton<StoreUserCredentials>(
      () => StoreUserCredentials(platformRepositoryImpl: getItInstance()));

  getItInstance.registerSingleton<AuthenticationBloc>(AuthenticationBloc(
    getEmailId: getItInstance(),
    isSignedIn: getItInstance(),
    signOut: getItInstance(),
  ));

  getItInstance.registerFactory<SignInBloc>(() => SignInBloc(
        signIn: getItInstance(),
      ));

  getItInstance.registerFactory<SignUpBloc>(() => SignUpBloc(
        signUp: getItInstance(),
        storeUserCredentials: getItInstance(),
        verifyEmail: getItInstance(),
      ));
}
