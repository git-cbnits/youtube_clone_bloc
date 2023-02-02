

import '../../../infrastructure/youtube/models/youtube/channel_info_model.dart';
import '../../../infrastructure/youtube/models/youtube/video_list_model.dart';

abstract class IYouTubeRepository{
  Future<ChannelInfo> getChannelInfo();
  Future<VideosList> getVideosList({required String playListId, required String pageToken});
}