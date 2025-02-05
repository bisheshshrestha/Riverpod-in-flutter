import 'package:flutter/material.dart';
import 'package:pod_player/pod_player.dart';



class VideoWidget extends StatefulWidget {
  final String url;
  const VideoWidget({super.key, required this.url});

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {

  late final PodPlayerController controller;

  @override
  void initState() {
    controller = PodPlayerController(
      podPlayerConfig: PodPlayerConfig(
        autoPlay: true,
        isLooping: true
      ),
      playVideoFrom: PlayVideoFrom.youtube(
        'https://youtu.be/${widget.url}',
      ),
    )..initialise();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    print(widget.url);
    return PodVideoPlayer(
        controller: controller
    );

  }
}
