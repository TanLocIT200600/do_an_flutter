import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/loader.dart';
import '../../models/article.dart';
import '../../models/articleResponse.dart';
import '../../screens/newsDetail.dart';
import '../../styles/theme.dart' as Style;
import '../../shared/search.dart';
import 'package:timeago/timeago.dart' as timeago;

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    search..search("");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
          child: TextFormField(
            style: TextStyle(fontSize: 14.0, color: Colors.black),
            controller: _searchController,
            onChanged: (changed) {
              search..search(_searchController.text);
            },
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              filled: true,
              fillColor: Colors.grey[100],
              suffixIcon: _searchController.text.length > 0
                  ? IconButton(
                      icon: Icon(
                        EvaIcons.backspaceOutline,
                        color: Colors.grey[500],
                        size: 16.0,
                      ),
                      onPressed: () {
                        setState(() {
                          FocusScope.of(context).requestFocus(FocusNode());
                          _searchController.clear();
                          search..search(_searchController.text);
                        });
                      })
                  : Icon(
                      EvaIcons.searchOutline,
                      color: Colors.grey[500],
                      size: 16.0,
                    ),
              enabledBorder: OutlineInputBorder(
                  borderSide:
                      new BorderSide(color: Colors.grey[100].withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(30.0)),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      new BorderSide(color: Colors.grey[100].withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(30.0)),
              contentPadding: EdgeInsets.only(left: 15.0, right: 10.0),
              labelText: "Search...",
              hintStyle: TextStyle(
                  fontSize: 14.0,
                  color: Style.Colors.grey,
                  fontWeight: FontWeight.w500),
              labelStyle: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500),
            ),
            autocorrect: false,
            // autovalidate: true,
          ),
        ),
        Expanded(
            child: StreamBuilder<ArticleResponse>(
          stream: search.subject.stream,
          builder: (context, AsyncSnapshot<ArticleResponse> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.error != null &&
                  snapshot.data.error.length > 0) {
                return Container();
              }
              return _buildSourceNewsWidget(snapshot.data);
            } else if (snapshot.hasError) {
              return Container();
            } else {
              return buildLoadingWidget();
            }
          },
        ))
      ],
    );
  }

  Widget _buildSourceNewsWidget(ArticleResponse data) {
    List<ArticleModel> articles = data.articles;

    if (articles.length == 0) {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "No more news",
              style: TextStyle(color: Colors.black45),
            ),
          ],
        ),
      );
    } else
      return ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailNews(
                              article: articles[index],
                            )));
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.grey[200], width: 1.0),
                  ),
                  // borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                height: 150,
                margin: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                child: Row(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(right: 10.0),
                        width: 170,
                        height: 130,
                        child: FadeInImage.assetNetwork(
                            alignment: Alignment.topCenter,
                            placeholder: 'assets/img/placeholder.jpg',
                            image: articles[index].img == null
                                ? "http://to-let.com.bd/operator/images/noimage.png"
                                : articles[index].img,
                            fit: BoxFit.fitHeight,
                            width: double.maxFinite,
                            height:
                                MediaQuery.of(context).size.height * 1 / 3)),
                    Container(
                      padding: EdgeInsets.only(
                          top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
                      width: 160,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(articles[index].title,
                              maxLines: 3,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 14.0)),
                          Expanded(
                              child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      timeUntil(
                                          DateTime.parse(articles[index].date)),
                                      style: TextStyle(
                                          color: Colors.black26,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10.0),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(0),
                                      child: IconButton(
                                        padding: const EdgeInsets.all(0),
                                        alignment: Alignment.centerRight,
                                        icon: Icon(Icons.favorite),
                                        color: Colors.red[500],
                                        iconSize: 20.0,
                                        onPressed: () {},
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
  }

  String timeUntil(DateTime date) {
    return timeago.format(date, allowFromNow: true, locale: 'en');
  }
}
