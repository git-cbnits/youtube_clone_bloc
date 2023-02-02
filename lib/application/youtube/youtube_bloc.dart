import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/youtube/repository/i_youtube_repository.dart';
import '../../infrastructure/youtube/models/youtube/channel_info_model.dart';
import '../../infrastructure/youtube/models/youtube/video_list_model.dart' as videoList ;

part 'youtube_bloc.freezed.dart';
part 'youtube_event.dart';
part 'youtube_state.dart';

class YouTubeBloc extends Bloc<YouTubeEvent,YoutubeState>{

  final IYouTubeRepository iYouTubeRepository;

  YouTubeBloc({required this.iYouTubeRepository}):super(YoutubeState.initial()){
    on<YouTubeEvent>(_onEvent);
  }

  Future<void> _onEvent(YouTubeEvent event, Emitter<YoutubeState> emit)async{
    await event.map(
      initialized: (e) async => emit(YoutubeState.initial()),
      fetch: (e)async{
        emit(state.copyWith(isLoading: true));
        ChannelInfo channelInfo = await iYouTubeRepository.getChannelInfo();
        videoList.VideosList videosList = await iYouTubeRepository.getVideosList(playListId: channelInfo.items[0].contentDetails.relatedPlaylists.uploads, pageToken: '');
        emit(state.copyWith(isLoading: false,channelInfo: channelInfo,videosList: videosList));
      },
    );
  }

}