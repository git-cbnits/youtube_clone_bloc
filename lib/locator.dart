import 'package:get_it/get_it.dart';

import 'application/youtube/youtube_bloc.dart';
import 'infrastructure/youtube/datasource/youtube_remote.dart';
import 'infrastructure/youtube/repository/youtube_repository.dart';

GetIt locator = GetIt.instance;

void setupLocator(){

  locator.registerLazySingleton(() => YouTubeRemoteDataSource());
  locator.registerLazySingleton(() => YouTubeRepository(youTubeRemoteDataSource: locator<YouTubeRemoteDataSource>()));
  locator.registerLazySingleton(() => YouTubeBloc(iYouTubeRepository: locator<YouTubeRepository>()),);

}


