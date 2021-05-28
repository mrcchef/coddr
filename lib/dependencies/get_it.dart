import 'package:coddr/data/core/api_client.dart';
import 'package:coddr/data/data_sources/remote_data_source.dart';
import 'package:coddr/data/repositories/platform_repository_impl.dart';
import 'package:coddr/domain/usecases/get_cf_contest_list.dart';
import 'package:coddr/presentation/journeys/home/home_screen.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<Client>(() => Client());
  getItInstance
      .registerLazySingleton<APIClient>(() => APIClient(getItInstance()));
  getItInstance.registerFactory<RemoteDataSourceImpl>(
      () => RemoteDataSourceImpl(apiClient: getItInstance()));

  getItInstance.registerLazySingleton<PlatformRepositoryImpl>(
      () => PlatformRepositoryImpl(remoteDataSourceImpl: getItInstance()));

  getItInstance.registerLazySingleton<HomeScreen>(() => HomeScreen());

  getItInstance.registerLazySingleton<GetCFContestList>(
      () => GetCFContestList(platformRepository: getItInstance()));
}
