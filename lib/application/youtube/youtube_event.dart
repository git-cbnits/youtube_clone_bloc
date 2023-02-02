part of 'youtube_bloc.dart';

@freezed
class YouTubeEvent with _$YouTubeEvent{
  const factory YouTubeEvent.initialized() = _Initialized;
  const factory YouTubeEvent.fetch() = _Fetch;
}