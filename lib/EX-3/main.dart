import 'package:flutter/material.dart';

List<String> images = [
  "assets/EX3/bird.jpg",
  "assets/EX3/bird2.jpg",
  "assets/EX3/insect.jpg",
  "assets/EX3/girl.jpg",
  "assets/EX3/man.jpg",
];

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false, // Why this line ? Can you explain it ?
      home: ImageView(),
    ));

class ImageView extends StatefulWidget {
  const ImageView({
    super.key,
  });

  @override
  State<ImageView> createState() => _ImageState();
}

class _ImageState extends State<ImageView> {
  int currentIndex = 0;

  void nextImage(){
    setState(() {
      if (currentIndex < images.length - 1) {
        currentIndex++;
      }else{
        currentIndex = 0;
      }
    });
  }

  void previousImage(){
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
      }else{
        currentIndex = images.length - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: previousImage,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: nextImage,
            ),
          ),
        ],
      ),
      body: Image.asset(images[currentIndex]),
    );
  }
}