// SPDX-License-Identifier: Apache-2.0

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_monitor/kuksa-server/vehicle_config.dart';
import 'package:flutter_monitor/kuksa-server/vehicle_methods.dart';

import '../home_page.dart';

class OnBoardingPage extends ConsumerStatefulWidget {
  const OnBoardingPage({Key? key, required this.client, required this.socket})
      : super(key: key);
  final WebSocket socket;
  final HttpClient client;

  @override
  ConsumerState<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends ConsumerState<OnBoardingPage> {
  late Timer _timer;
  late WebSocket _socket;

  @override
  void initState() {
    super.initState();
    _socket = widget.socket;
    VISS.init(widget.socket, ref);
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      //print("Timer widget refresh");
      if (widget.socket.readyState == 3) {
        ref.refresh(sockConnectprovider(widget.client));
        print("ref: $ref");
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.socket.listen(
        (data) {
          VISS.parseData(ref, data);
        },
        onError: (e, stk) {
          print(e.toString());
          ref.refresh(sockConnectprovider(widget.client));
        },
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    widget.socket.close(786887, "Connection lost with server!");
  }

  @override
  Widget build(BuildContext context) {
    return HomePage(
      socket: _socket,
    );
  }
}
