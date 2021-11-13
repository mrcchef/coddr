import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coddr/data/core/api_client.dart';
import 'package:coddr/data/data_sources/authentication_data_source.dart';
import 'package:coddr/data/data_sources/remote_data_source.dart';
import 'package:coddr/data/repositories/platform_repository_impl.dart';
import 'package:coddr/domain/repositories/platform_repository.dart';
import 'package:coddr/domain/usecases/create_curated_contest.dart';
import 'package:coddr/domain/usecases/fetch_curated_contest.dart';
import 'package:coddr/domain/usecases/fetch_curated_contest_list.dart';
import 'package:coddr/domain/usecases/fetch_participated_contests.dart';
import 'package:coddr/domain/usecases/fetch_user_detail.dart';
import 'package:coddr/domain/usecases/get_cf_contest_list.dart';
import 'package:coddr/domain/usecases/get_cf_standings.dart';
import 'package:coddr/domain/usecases/get_cf_user.dart';
import 'package:coddr/domain/usecases/get_emailId.dart';
import 'package:coddr/domain/usecases/is_email_verified.dart';
import 'package:coddr/domain/usecases/is_signed_in.dart';
import 'package:coddr/domain/usecases/sign_in.dart';
import 'package:coddr/domain/usecases/sign_out.dart';
import 'package:coddr/domain/usecases/sign_up.dart';
import 'package:coddr/domain/usecases/store_user_credentials.dart';
import 'package:coddr/domain/usecases/update_curated_contest.dart';
import 'package:coddr/domain/usecases/update_is_Handle_verified.dart';
import 'package:coddr/domain/usecases/update_is_email_verified.dart';
import 'package:coddr/domain/usecases/update_participated_contests.dart';
import 'package:coddr/domain/usecases/update_user_model.dart';
import 'package:coddr/domain/usecases/verify_email.dart';
import 'package:coddr/presentation/blocs/authentication/authentication_bloc.dart';
import 'package:coddr/presentation/blocs/contest_listing/contest_listing_bloc.dart';
import 'package:coddr/presentation/blocs/contest_standings/contest_standings_bloc.dart';
import 'package:coddr/presentation/blocs/create_curated_contest/create_curated_contest_bloc.dart';
import 'package:coddr/presentation/blocs/curated_contest/curated_contest_bloc.dart';
import 'package:coddr/presentation/blocs/email_verification/email_verification_bloc.dart';
import 'package:coddr/presentation/blocs/handel_verification/handel_verification_bloc.dart';
import 'package:coddr/presentation/blocs/participated_contest/participated_contest_bloc.dart';
import 'package:coddr/presentation/blocs/profile/profile_bloc.dart';
import 'package:coddr/presentation/blocs/send_verification_email/send_verification_email_bloc.dart';
import 'package:coddr/presentation/blocs/signIn/signin_bloc.dart';
import 'package:coddr/presentation/blocs/signup/signup_bloc.dart';
import 'package:coddr/presentation/blocs/update_curated_contest/update_curated_contest_bloc.dart';
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
      .registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(
            apiClient: getItInstance(),
            firebaseFirestore: firebaseFirestore,
            authenticationDataSource: getItInstance(),
          ));

  getItInstance.registerLazySingleton<AuthenticationDataSource>(
      () => AuthenticationDataSourceImpl(firebaseAuth: firebaseAuth));

  getItInstance.registerLazySingleton<PlatformRepository>(() =>
      PlatformRepositoryImpl(
          remoteDataSource: getItInstance(),
          authenticationDataSource: getItInstance()));

  getItInstance.registerLazySingleton<HomeScreen>(() => HomeScreen());

  getItInstance.registerLazySingleton<GetCFContestList>(
      () => GetCFContestList(platformRepository: getItInstance()));

  getItInstance.registerLazySingleton<FetchUserDetail>(
      () => FetchUserDetail(platformRepository: getItInstance()));

  getItInstance.registerLazySingleton<GetCFUser>(
      () => GetCFUser(platformRepository: getItInstance()));

  getItInstance.registerLazySingleton<GetCFStandings>(
      () => GetCFStandings(platformRepository: getItInstance()));

  getItInstance
      .registerLazySingleton<CreateCuratedContest>(() => CreateCuratedContest(
            platformRepository: getItInstance(),
          ));

  getItInstance.registerLazySingleton<FetchCuratedContestList>(
      () => FetchCuratedContestList(platformRepository: getItInstance()));

  getItInstance.registerLazySingleton<GetEmailId>(
      () => GetEmailId(platformRepository: getItInstance()));

  getItInstance.registerLazySingleton<IsSignedIn>(
      () => IsSignedIn(platformRepository: getItInstance()));

  getItInstance.registerLazySingleton<IsEmailVerified>(
      () => IsEmailVerified(platformRepository: getItInstance()));

  getItInstance.registerLazySingleton<UpdateIsHandleVerified>(
      () => UpdateIsHandleVerified(platformRepository: getItInstance()));

  getItInstance.registerLazySingleton<UpdateParticipatedContests>(
      () => UpdateParticipatedContests(platformRepository: getItInstance()));

  getItInstance.registerLazySingleton<UpdateUserModel>(
      () => UpdateUserModel(platformRepository: getItInstance()));

  getItInstance.registerLazySingleton<UpdateCuratedContest>(
      () => UpdateCuratedContest(platformRepository: getItInstance()));

  getItInstance.registerLazySingleton<FetchCuratedContest>(
      () => FetchCuratedContest(platformRepository: getItInstance()));

  getItInstance.registerLazySingleton<FetchParticipatedContests>(
      () => FetchParticipatedContests(platformRepository: getItInstance()));

  getItInstance.registerLazySingleton<SignIn>(
      () => SignIn(platformRepository: getItInstance()));

  getItInstance.registerLazySingleton<UpdateIsEmailVerified>(
      () => UpdateIsEmailVerified(platformRepository: getItInstance()));

  getItInstance.registerLazySingleton<SignOut>(
      () => SignOut(platformRepository: getItInstance()));

  getItInstance.registerLazySingleton<SignUp>(
      () => SignUp(platformRepository: getItInstance()));

  getItInstance.registerLazySingleton<VerifyEmail>(
      () => VerifyEmail(platformRepository: getItInstance()));

  getItInstance.registerFactory<ContestListingBloc>(
      () => ContestListingBloc(getCFContestList: getItInstance()));

  getItInstance.registerLazySingleton<EmailVerificationBloc>(() =>
      EmailVerificationBloc(
          isEmailVerified: getItInstance(),
          updateIsEmailVerified: getItInstance()));

  getItInstance.registerLazySingleton<SendVerificationEmailBloc>(
      () => SendVerificationEmailBloc(
            verifyEmail: getItInstance(),
          ));
  getItInstance
      .registerFactory<UpdateCuratedContestBloc>(() => UpdateCuratedContestBloc(
            updateCuratedContest: getItInstance(),
            updateUserModel: getItInstance(),
            updateParticipatedContests: getItInstance(),
          ));

  getItInstance.registerFactory<ProfileBloc>(
      () => ProfileBloc(fetchUserDetail: getItInstance()));

  getItInstance.registerLazySingleton<HandelVerificationBloc>(() =>
      HandelVerificationBloc(
          getCFUser: getItInstance(), updateIsHandleVerified: getItInstance()));

  getItInstance.registerFactory<StoreUserCredentials>(
      () => StoreUserCredentials(platformRepository: getItInstance()));

  // getItInstance.registerFactory(() => AuthenticationBloc(
  //       getEmailId: getItInstance(),
  //       isSignedIn: getItInstance(),
  //       signOut: getItInstance(),
  //     ));

  // getItInstance.registerSingleton<AuthenticationBloc>(AuthenticationBloc(
  //   getEmailId: getItInstance(),
  //   isSignedIn: getItInstance(),
  //   signOut: getItInstance(),
  // ));

  getItInstance
      .registerLazySingleton<AuthenticationBloc>(() => AuthenticationBloc(
            getEmailId: getItInstance(),
            isSignedIn: getItInstance(),
            signOut: getItInstance(),
          ));

  // getItInstance.registerSingleton<SignInBloc>(SignInBloc(
  //   signIn: getItInstance(),
  // ));

  getItInstance.registerFactory<SignInBloc>(() => SignInBloc(
        signIn: getItInstance(),
      ));

  getItInstance
      .registerFactory<ContestStandingsBloc>(() => ContestStandingsBloc(
            getCFStandings: getItInstance(),
          ));
  getItInstance.registerFactory<CuratedContestBloc>(() => CuratedContestBloc(
        fetchCuratedContestList: getItInstance(),
      ));

  getItInstance
      .registerFactory<CreateCuratedContestBloc>(() => CreateCuratedContestBloc(
            createCuratedContest: getItInstance(),
            updateUserModel: getItInstance(),
            updateParticipatedContests: getItInstance(),
          ));

  getItInstance
      .registerFactory<ParticipatedContestBloc>(() => ParticipatedContestBloc(
            fetchCuratedContest: getItInstance(),
            fetchParticipatedContests: getItInstance(),
          ));

  // getItInstance.registerSingleton<SignUpBloc>(SignUpBloc(
  //   signUp: getItInstance(),
  //   storeUserCredentials: getItInstance(),
  //   verifyEmail: getItInstance(),
  // ));

  getItInstance.registerFactory<SignUpBloc>(() => SignUpBloc(
        signUp: getItInstance(),
        storeUserCredentials: getItInstance(),
        verifyEmail: getItInstance(),
      ));
}
