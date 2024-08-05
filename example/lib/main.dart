import 'package:flutter/material.dart';
import 'package:rtsp_ffmpeg/rtsp_ffmpeg.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MaterialApp(
      home: MyScreen(),
    ),
  );
}

class MyScreen extends StatefulWidget {
  const MyScreen({super.key});
  @override
  State<MyScreen> createState() => MyScreenState();
}

class MyScreenState extends State<MyScreen> {
  RtspController? _controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller?.stop();
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: RtspFFMpeg(createdCallback: (controller) {
      setState(() {
        _controller = controller;
      });
      _controller?.play("rtsp://my.ip.address/h264");
    }));
  }
}
