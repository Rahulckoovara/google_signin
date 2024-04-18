import 'package:flutter/material.dart';
import 'package:google_signinn/screens/youtube/player.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoListItem extends StatefulWidget {
  final Map<String, dynamic> video;

  const VideoListItem({Key? key, required this.video}) : super(key: key);

  @override
  _VideoListItemState createState() => _VideoListItemState();
}

class _VideoListItemState extends State<VideoListItem> {
  late YoutubePlayerController _controller;
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    final videoID = YoutubePlayer.convertUrlToId(widget.video['link']);
    _controller = YoutubePlayerController(
      initialVideoId: videoID!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final videoId = YoutubePlayer.convertUrlToId(widget.video['link'])!;
        final title = widget.video['title'];
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PlayerScreen(videoId: videoId, title: title),
        ));
      },
      child: VisibilityDetector(
        key: Key(widget.video['id'].toString()),
        onVisibilityChanged: (visibilityInfo) {
          setState(() {
            _isVisible = visibilityInfo.visibleFraction == 1;
          });
        },
        child: Column(
          children: [
            if (!_isVisible)
              Image.network(
                YoutubePlayer.getThumbnail(
                  videoId: YoutubePlayer.convertUrlToId(widget.video['link'])!,
                ),
              ),
            if (_isVisible)
              YoutubePlayerBuilder(
                player: YoutubePlayer(
                  controller: _controller,
                ),
                builder: (context, player) {
                  return player;
                },
              ),
            Container(
              width: double.infinity,
              height: 50,
              color: Colors.grey[900],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.video['title'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
