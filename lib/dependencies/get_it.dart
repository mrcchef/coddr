import 'package:coddr/data/core/api_client.dart';
import 'package:coddr/data/data_sources/remote_data_source.dart';
import 'package:coddr/data/repositories/platform_repository_impl.dart';
import 'package:coddr/domain/usecases/get_cf_contest_list.dart';
import 'package:coddr/presentation/journeys/home/home_screen.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final getItInstacne = GetIt.I;

Future init() async {
  getItInstacne.registerLazySingleton<Client>(() => Client());
  getItInstacne
      .registerLazySingleton<APIClient>(() => APIClient(getItInstacne()));
  getItInstacne.registerFactory<RemoteDataSourceImpl>(
      () => RemoteDataSourceImpl(apiClient: getItInstacne()));

  getItInstacne.registerLazySingleton<PlatformRepositoryImpl>(
      () => PlatformRepositoryImpl(remoteDataSourceImpl: getItInstacne()));

  getItInstacne.registerLazySingleton<HomeScreen>(
      () => HomeScreen(getCFContestList: getItInstacne()));

  getItInstacne.registerLazySingleton<GetCFContestList>(
      () => GetCFContestList(platformRepository: getItInstacne()));
}
