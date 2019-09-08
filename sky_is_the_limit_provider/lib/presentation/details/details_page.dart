import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sky_is_the_limit_provider/domain/news.dart';
import 'package:sky_is_the_limit_provider/presentation/photo_hero.dart';
import 'package:sky_is_the_limit_provider/style/dimens.dart';

class DetailsPage extends StatelessWidget {
  Article _article;

  DetailsPage(this._article);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_article.title),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            PhotoHero(photo: _article.urlToImage),
            Padding(
              padding: const EdgeInsets.all(Dimens.S),
              child: Text(
                _article.title,
                style: TextStyle(fontWeight: FontWeight.w900),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(Dimens.S),
              child: Text(_article.content),
            ),
          ],
        ),
      ),
    );
  }
}
