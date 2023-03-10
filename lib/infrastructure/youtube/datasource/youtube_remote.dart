import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../../constant.dart';
import '../models/youtube/channel_info_model.dart';
import '../models/youtube/video_list_model.dart';


class YouTubeRemoteDataSource{
  static const channelId = 'UC5lbdURzjB0irr-FTbjWN1A';
  static const _baseUrl = 'www.googleapis.com';

  Future<ChannelInfo> getChannelInfo() async {
    Map<String, String> parameters = {
      'part': 'snippet,contentDetails,statistics',
      'id': channelId,
      'key': apiKey,
    };
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/youtube/v3/channels',
      parameters,
    );
    Response response = await http.get(uri, headers: headers);
    ChannelInfo channelInfo = channelInfoFromJson(response.body);
    return channelInfo;
  }

  Future<VideosList> getVideosList({required String playListId, required String pageToken}) async {
    Map<String, String> parameters = {
      'part': 'snippet',
      'playlistId': playListId,
      'maxResults': '10',
      'pageToken': pageToken,
      'key': apiKey,
    };
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/youtube/v3/playlistItems',
      parameters,
    );
    Response response = await http.get(uri, headers: headers);
    VideosList videosList = videosListFromJson(response.body);
    return videosList;
  }
}