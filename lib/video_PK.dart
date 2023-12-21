import 'package:flutter/material.dart';
import 'package:pokemon/models/video_model.dart';
import 'package:pokemon/provider/video_provider.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class videoPlayerPK extends StatefulWidget {
  const videoPlayerPK({Key? key}) : super(key: key);

  @override
  State<videoPlayerPK> createState() => _videoPlayerPKState();
}

class _videoPlayerPKState extends State<videoPlayerPK> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();
    final videoProvider = Provider.of<VideoProvider>(context , listen: false);
    _initializeVideoController(listVideo[videoProvider.currentIndex].urlVideo);
  }

  void _initializeVideoController(String videoUrl) {
    controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videoUrl) ?? '',
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        // Other YoutubePlayerFlags configurations...
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    final videoProvider = Provider.of<VideoProvider>(context);
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: listVideo.length,
      itemBuilder: (BuildContext context, int index) {
        _initializeVideoController(listVideo[index].urlVideo);
        return GestureDetector(
          onTap: (){
            videoProvider.currentIndex = index;
          },
          child: Container(
            margin: EdgeInsets.only(left: 12, bottom: 12),
            width: 200,
            child: Column(
              children: [
                YoutubePlayer(
                  controller: controller,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.blueAccent,
                ),
                Text(
                  listVideo[index].nameVideo,
                  style: TextStyle(fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}