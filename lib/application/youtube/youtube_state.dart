part of 'youtube_bloc.dart';

@freezed
class YoutubeState with _$YoutubeState{
  const YoutubeState._();

  const factory YoutubeState({
    required bool isLoading,
    required ChannelInfo channelInfo,
    required videoList.VideosList videosList,
  }) = _YoutubeState;

  factory YoutubeState.initial() => YoutubeState(
    isLoading: true,
    channelInfo: ChannelInfo(etag: '',items: [],kind: '',pageInfo: PageInfo(resultsPerPage:0),),
    videosList: videoList.VideosList(kind: '', etag: '', nextPageToken: '', videos: [], pageInfo: videoList.PageInfo(resultsPerPage: 0,totalResults: 0)),
  );

}