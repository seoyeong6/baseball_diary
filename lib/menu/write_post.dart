import 'package:flutter/material.dart';

class WritePost extends StatelessWidget {
  const WritePost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Write Post'),
        centerTitle: true,
      ),
    );
  }
}
