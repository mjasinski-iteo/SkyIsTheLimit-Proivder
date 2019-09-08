import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhotoHero extends StatelessWidget {
  const PhotoHero({Key key, this.photo}) : super(key: key);

  final String photo;

  Widget build(BuildContext context) {
    return SizedBox(
      child: Hero(
        tag: photo,
        child: Image.network(
          photo,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
