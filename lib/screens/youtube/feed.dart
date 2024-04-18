import 'package:flutter/material.dart';
import 'package:google_signinn/screens/youtube/video_list.dart';

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

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  void _onScroll() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Youtubee")),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: videos.length,
        itemBuilder: (context, index) {
          return VideoListItem(
            video: videos[index],
          );
        },
      ),
    );
  }
}
