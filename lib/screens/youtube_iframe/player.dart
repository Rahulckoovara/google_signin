import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class PlayerScreen extends StatefulWidget {
  final String? videoid;

  const PlayerScreen({Key? key, this.videoid}) : super(key: key);

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  final _ytController = YoutubePlayerController(
    params: const YoutubePlayerParams(
        showFullscreenButton: true, mute: false, showControls: true),
  );

  @override
  void initState() {
    super.initState();
    _play();
  }

  Future<void> _play() async {
    final videoId = widget.videoid;

    //? loadVideoByUrl doesn't work?
    // await _ytController.loadVideoByUrl(mediaContentUrl: _txtController.text);
    await _ytController.loadVideoById(videoId: videoId!);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.videoid == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Invalid video URL'),
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('YouTube Player'),
        ),
        body: YoutubePlayerScaffold(
          builder: (ctx, player) => SingleChildScrollView(
            child: Column(
              children: [player],
            ),
          ),
          controller: _ytController,
        ));
  }
}
