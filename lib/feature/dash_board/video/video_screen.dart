import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoScreen extends StatefulWidget {
  final String videoUrl;
  final String description;

  const VideoScreen({
    super.key,
    required this.videoUrl,
    required this.description,
  });

  @override
  // ignore: library_private_types_in_public_api
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late YoutubePlayerController _controller;
  late WebViewController _webViewController;

  @override
  void initState() {
    super.initState();

    String? videoId = YoutubePlayerController.convertUrlToId(widget.videoUrl);

    if (!kIsWeb) {
      _controller = YoutubePlayerController.fromVideoId(
        videoId: videoId ?? '',
        autoPlay: true,
        params: const YoutubePlayerParams(
          showControls: true,
          showFullscreenButton: true,
        ),
      );
    } else {
      _webViewController = WebViewController()
        ..loadRequest(Uri.parse("https://www.youtube.com/embed/$videoId"));
    }
  }

  @override
  void dispose() {
    if (!kIsWeb) {
      _controller.close();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // العنوان + زر الرجوع
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: EdgeInsets.all(8.sp),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ),
                SizedBox(width: 5.w),
                Expanded(
                  child: Text(
                    widget.description,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),

          // الفيديو بنسبة 16:9 داخل Expanded
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10.0.sp),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: kIsWeb
                    ? WebViewWidget(controller: _webViewController)
                    : YoutubePlayer(controller: _controller),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
