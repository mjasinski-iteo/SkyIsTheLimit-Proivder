import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sky_is_the_limit_provider/domain/news.dart';
import 'package:sky_is_the_limit_provider/network/articles_api.dart';
import 'package:sky_is_the_limit_provider/style/colors.dart';
import 'package:sky_is_the_limit_provider/style/dimens.dart';
import 'package:toast/toast.dart';

class ListPage extends StatefulWidget {
  @override
  State createState() => _ListState();
}

class _ListState extends State<ListPage> {
  List<Article> _articles = List<Article>();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sky is the limit"),
      ),
      body: _isLoading ? _buildProgress() : _buildList(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.mainOrange,
        child: Icon(Icons.refresh),
        onPressed: _fetchArticles,
      ),
    );
  }

  Widget _buildProgress() => Center(
          child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.mainOrange),
      ));

  Center _buildList() {
    return Center(
      child: ListView.builder(
        itemBuilder: (context, index) => _buildItem(_articles[index]),
        itemCount: _articles.length,
      ),
    );
  }

  Widget _buildItem(Article item) => InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(Dimens.S),
          margin: EdgeInsets.only(
            top: Dimens.S,
            bottom: Dimens.S,
            left: Dimens.M,
            right: Dimens.M,
          ),
          decoration: BoxDecoration(
              color: AppColors.transparentAccentColor,
              border: Border.all(color: AppColors.accentColor),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(item.urlToImage),
              Padding(
                padding: const EdgeInsets.only(top: Dimens.S),
                child: Text(item.title),
              ),
            ],
          ),
        ),
      );

  @override
  void initState() {
    super.initState();
    _fetchArticles();
  }

  void _fetchArticles() {
    _setIsLoading();
    ArticlesApi().getArticles().then((articles) {
      setState(() => {_isLoading = false, _articles = articles});
    }, onError: (error) {
      _setIsNotLoading();
      Toast.show("An error occured", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    });
  }

  void _setIsLoading() {
    setState(() {
      _isLoading = true;
    });
  }

  void _setIsNotLoading() {
    setState(() {
      _isLoading = false;
    });
  }
}
