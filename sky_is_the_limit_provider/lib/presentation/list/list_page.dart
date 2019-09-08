import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_is_the_limit_provider/domain/auto_reload_timer.dart';
import 'package:sky_is_the_limit_provider/domain/news.dart';
import 'package:sky_is_the_limit_provider/network/articles_api.dart';
import 'package:sky_is_the_limit_provider/presentation/details/details_page.dart';
import 'package:sky_is_the_limit_provider/presentation/photo_hero.dart';
import 'package:sky_is_the_limit_provider/style/colors.dart';
import 'package:sky_is_the_limit_provider/style/dimens.dart';
import 'package:toast/toast.dart';

class ListPage extends StatefulWidget {
  @override
  State createState() => _ListState();
}

class _ListState extends State<ListPage> with TickerProviderStateMixin {
  ArticlesApi api;
  List<Article> _articles = List<Article>();
  bool _isLoading = false;
  bool _isInitialized = false;

  @override
  void didChangeDependencies() {
    api = Provider.of<ArticlesApi>(context);

//    final autoReload = Provider.of<AutoReloadTimer>(context);
//    autoReload.addListener(() {
//      _fetchArticles();
//    });
//    autoReload.startTimer();

    if (!_isInitialized) {
      _fetchArticles();
      _isInitialized = true;
    }
  }

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
        onTap: () {
          Navigator.push(
            context,
            _createDetailsRoute(item),
          );
        },
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
              PhotoHero(
                photo: item.urlToImage,
              ),
              Padding(
                padding: const EdgeInsets.only(top: Dimens.S),
                child: Text(item.title),
              ),
            ],
          ),
        ),
      );

  void _fetchArticles() {
    _setIsLoading();
    api.getArticles().then((articles) {
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

  @override
  void dispose() {
    Provider.of<AutoReloadTimer>(context).stopTimer();
    super.dispose();
  }

  Route _createDetailsRoute(Article item) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          DetailsPage(item),
      transitionDuration: Duration(seconds: 1),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          child: child,
          opacity: animation,
        );
      },
    );
  }
}
