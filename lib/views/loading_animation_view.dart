import 'dart:async';

import 'package:flutter/material.dart';

class LoadingAnimationView extends StatefulWidget {
  LoadingAnimationView({Key key}) : super(key: key);

  @override
  _LoadingAnimationViewState createState() => _LoadingAnimationViewState();
}

class _LoadingAnimationViewState extends State<LoadingAnimationView> {
  double _deviceWidth;
  double _widthOfAnimatedContainer;

  @override
  void initState() {
    super.initState();
    _widthOfAnimatedContainer = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedContainer(
            height: 100,
            width: _widthOfAnimatedContainer,
            color: Colors.red,
            duration: Duration(seconds: 1),
          ),
          OutlineButton.icon(
              icon: Icon(Icons.cloud_download),
              label: Text("Start Download"),
              onPressed: () {
                _startTimer();
              }),
          OutlineButton.icon(
              icon: Icon(Icons.settings_backup_restore),
              label: Text("Restart Download"),
              onPressed: () {
                setState(() {
                  _widthOfAnimatedContainer = 0;
                });
              })
        ],
      ),
    );
  }

  void _startTimer() {
    setState(() {
      _deviceWidth = MediaQuery.of(context).size.width;
    });
    Timer.periodic(Duration(milliseconds: 200), (timer) {
      if (_widthOfAnimatedContainer.compareTo(_deviceWidth) == 1) {
        timer.cancel();
        showDialog(
            context: context,
            builder: (context) => Dialog(
                  child: Text("Download Completed"),
                ));
      } else {
        setState(() {
          _widthOfAnimatedContainer += _deviceWidth / 10;
        });
      }
      print("$_widthOfAnimatedContainer, $_deviceWidth");
    });
  }
}
