import 'package:flutter/material.dart';

class AlbumScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('앨범'),
      ),
      body: Center(
        child: Text('앨범 화면입니다.'),
      ),
    );
  }
}
