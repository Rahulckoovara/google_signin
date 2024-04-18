import 'package:flutter/material.dart';
import 'package:google_signinn/screens/youtube_iframe/player.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

final List<Map<String, dynamic>> videos = [
  {
    "id": 1,
    "title": "Test video 1",
    "link": "https://www.youtube.com/watch?v=NrO0CJCbYLA",
  },
  {
    "id": 2,
    "title": "Test video 2",
    "link": "https://www.youtube.com/watch?v=AqCMFhb2wrA",
  },
  {
    "id": 3,
    "title": "Test video 3",
    "link": "https://youtu.be/R84AGg0lKs8?si=0P-42NSCRwkz0gfG",
  },
  {
    "id": 4,
    "title": "Test video 4",
    "link": "https://youtu.be/_1maHd_0otI?si=IQKPgjoccZazFSAq",
  },
  {
    "id": 5,
    "title": "Test video 5",
    "link": "https://youtu.be/Ul7lfaD289c?si=FXr5OgD-DwGG9VWC",
  },
  {
    "id": 6,
    "title": "Test video 6",
    "link": "https://youtu.be/I-AZQP4Yctg?si=fvSXCs3OZ43LLm25",
  },
  {
    "id": 7,
    "title": "Test video 1",
    "link": "https://www.youtube.com/watch?v=NrO0CJCbYLA",
  },
  {
    "id": 8,
    "title": "Test video 2",
    "link": "https://www.youtube.com/watch?v=AqCMFhb2wrA",
  },
  {
    "id": 9,
    "title": "Test video 3",
    "link": "https://www.youtube.com/watch?v=D7PG_GBnf-g",
  },
  {
    "id": 10,
    "title": "Test video 1",
    "link": "https://www.youtube.com/watch?v=NrO0CJCbYLA",
  },
  {
    "id": 11,
    "title": "Test video 2",
    "link": "https://www.youtube.com/watch?v=AqCMFhb2wrA",
  },
  {
    "id": 12,
    "title": "Test video 3",
    "link": "https://www.youtube.com/watch?v=D7PG_GBnf-g",
  },
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final List<Map<String, dynamic>> _videos;

  @override
  void initState() {
    super.initState();
    try {
      // _videos = jsonDecode(jsonString).cast<Map<String, dynamic>>().toList();
    } catch (e) {
      print('Error decoding JSON: $e');
      _videos = [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Play YT Video'),
      ),
      body: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context, index) {
          final videoId =
              YoutubePlayerController.convertUrlToId(videos[index]['link']);
          return ListTile(
            title: Image.network(
                YoutubePlayerController.getThumbnail(videoId: videoId!)),
            subtitle: Text(videos[index]['title']),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PlayerScreen(videoid: videoId),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
