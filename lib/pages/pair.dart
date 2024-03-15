import 'package:flutter/material.dart';
import 'package:noa/bluetooth.dart';
import 'package:noa/pages/noa.dart';
import 'package:noa/style.dart';

class PairPage extends StatefulWidget {
  final FrameBluetooth bluetooth;
  const PairPage({super.key, required this.bluetooth});

  @override
  State<PairPage> createState() => _PairPageState();
}

class _PairPageState extends State<PairPage> {
  void _connect() async {
    FrameConnectionEnum device = await widget.bluetooth.connect(true);

    switch (device) {
      case FrameConnectionEnum.connected:
      case FrameConnectionEnum.new_connection:
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) =>
                NoaPage(bluetooth: widget.bluetooth),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
        );
        break;
      case FrameConnectionEnum.dfu_mode:
        // TODO
        break;
    }
  }

  void initState() {
    super.initState();
    _connect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundDarkColor,
      appBar: AppBar(
        backgroundColor: backgroundDarkColor,
        title: Image.asset('assets/brilliant_logo.png'),
      ),
      body: const Center(
        child: Text("Pair"),
      ),
    );
  }
}