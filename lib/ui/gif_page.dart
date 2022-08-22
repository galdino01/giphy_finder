import 'package:flutter/material.dart';

class GifPage extends StatelessWidget {
  const GifPage({Key? key, required this.gifData}) : super(key: key);

  final Map gifData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(gifData['title']),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Center(
          child: Image.network(gifData['images']['fixed_height']['url'])),
    );
  }
}
