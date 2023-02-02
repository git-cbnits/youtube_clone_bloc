import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone_bloc/application/youtube/youtube_bloc.dart';
import 'package:youtube_clone_bloc/presentations/youtube/video_player_page.dart';

import '../../infrastructure/youtube/models/youtube/video_list_model.dart';



class ListingPage extends StatelessWidget {
  const ListingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<YouTubeBloc,YoutubeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('My YouTube Channel'),
          ),
          body: state.isLoading?
          const Center(
            child: CircularProgressIndicator(),
          ):
          ListView(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Image.network(state.channelInfo.items[0].snippet.thumbnails.medium.url,height: 40,width: 40,),
                      const SizedBox(width: 20,),
                      Text(
                        state.channelInfo.items[0].snippet.title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              state.videosList.videos.isEmpty?
              Container(
                height: MediaQuery.of(context).size.height/1.5,
                alignment: Alignment.center,
                child: const Text('No Video Found',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ):
              ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: state.videosList.videos.length,
                itemBuilder: (context, index) {
                  VideoItem videoItem = state.videosList.videos[index];
                  return InkWell(
                    onTap: () async {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return VideoPlayerScreen(
                              videoItem: videoItem,
                            );
                          }));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(videoItem.video.thumbnails.thumbnailsDefault.url),
                          const SizedBox(width: 20),
                          Flexible(
                            child: Text(
                              videoItem.video.title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
