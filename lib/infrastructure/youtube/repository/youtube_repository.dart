import 'package:youtube_clone_bloc/domain/youtube/repository/i_youtube_repository.dart';

import '../datasource/youtube_remote.dart';
import '../models/youtube/channel_info_model.dart';
import '../models/youtube/video_list_model.dart';

class YouTubeRepository implements IYouTubeRepository{
  final YouTubeRemoteDataSource youTubeRemoteDataSource;

  YouTubeRepository({required this.youTubeRemoteDataSource});

  @override
  Future<ChannelInfo> getChannelInfo()async{
    ChannelInfo response = await youTubeRemoteDataSource.getChannelInfo();
    return response;
  }

  @override
  Future<VideosList> getVideosList({required String playListId, required String pageToken})async{
    VideosList response = await youTubeRemoteDataSource.getVideosList(playListId: playListId, pageToken: pageToken);
    return response;
  }

}