import 'package:flutter/material.dart';

class FadeImages extends StatefulWidget {
  const FadeImages({Key? key}) : super(key: key);

  @override
  State<FadeImages> createState() => _FadeImagesState();
}

class _FadeImagesState extends State<FadeImages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: SizedBox(
          height: 300,
          width: 300,
          child: FadeInImage(
            image: NetworkImage(
                'https://cdn.pixabay.com/photo/2015/06/19/21/24/avenue-815297__480.jpg'),
            placeholder: AssetImage('image/wait.jpg'),
          ),
        ),
      ),
    );
  }
}
