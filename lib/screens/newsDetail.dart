import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import '../../models/article.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../styles/theme.dart' as Style;
import 'package:url_launcher/url_launcher.dart';

class DetailNews extends StatefulWidget {
  final ArticleModel article;
  DetailNews({Key key, @required this.article}) : super(key: key);
  @override
  _DetailNewsState createState() => _DetailNewsState(article);
}

class _DetailNewsState extends State<DetailNews> {
  final ArticleModel article;
  _DetailNewsState(this.article);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GestureDetector(
        onTap: () {
          launch(article.url);
        },
        child: Container(
          height: 48.0,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.white, gradient: Style.Colors.primaryGradient),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Read More",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "SFPro-Bold",
                    fontSize: 15.0),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
          title: const Text(
            'News App',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromARGB(255, 233, 111, 255),
                  Color.fromARGB(255, 255, 212, 83),
                  Color.fromARGB(255, 255, 223, 80),
                ],
              ),
            ),
          ),
        ),
      body: ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 16 / 9,
            child: FadeInImage.assetNetwork(
                alignment: Alignment.topCenter,
                placeholder: 'images/placeholder.png',
                image: article.img == null
                    ? "http://to-let.com.bd/operator/images/noimage.png"
                    : article.img,
                fit: BoxFit.cover,
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height * 1 / 3),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(article.date.substring(0, 10),
                        style: TextStyle(
                            color: Style.Colors.mainColor,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(article.title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20.0)),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  timeUntil(DateTime.parse(article.date)),
                  style: TextStyle(color: Colors.grey, fontSize: 12.0),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Html(
                  data: article.content,
                  renderNewlines: true,
                  defaultTextStyle:
                      TextStyle(fontSize: 14.0, color: Colors.black87),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  String timeUntil(DateTime date) {
    return timeago.format(date, allowFromNow: true);
  }
}
