import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/custom_navbar_bottom.dart';
import 'package:flutter_application_1/enums.dart';
import 'package:flutter_application_1/listWidget.dart';
import 'package:flutter_application_1/screens/details/details_screen.dart';
import 'package:flutter_application_1/screens/home/components/body.dart';
import 'package:flutter_application_1/shared/listItem.dart';
import '../../components/custom_navbar_bottom.dart';
import '../../widgets/headline_slider.dart';
import 'package:lipsum/lipsum.dart' as lipsum;

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin {
  List<ListItem> listTitles = [
    ListItem(
      "https://cdn.bongdaplus.vn/Assets/Media/2022/04/22/41/Lukaku.jpg",
      lipsum.createWord(numWords: 6),
      lipsum.createWord(numWords: 2),
      "25 April 2022",
    ),
    ListItem(
      "https://cdn.bongdaplus.vn/Assets/Media/2022/04/21/41/mu-vs-arsenal.jpg",
      lipsum.createWord(numWords: 6),
      lipsum.createWord(numWords: 2),
      "25 April 2022",
    ),
    ListItem(
      "https://cdn.bongdaplus.vn/Assets/Media/2022/04/21/8/maguire300400.jpgg",
      lipsum.createWord(numWords: 6),
      lipsum.createWord(numWords: 2),
      "25 April 2022",
    ),
    ListItem(
      "https://cdn.bongdaplus.vn/Assets/Media/2022/04/22/41/Lukaku.jpg",
      lipsum.createWord(numWords: 6),
      lipsum.createWord(numWords: 2),
      "25 April 2022",
    ),
  ];

  List<Tab> _tabList = [
    Tab(
      child: Text('Top'),
    ),
    Tab(
      child: Text('Popular'),
    ),
    Tab(
      child: Text('Trending'),
    ),
    Tab(
      child: Text('Editor Choice'),
    ),
    Tab(
      child: Text('Category'),
    ),
  ];

  late TabController _tabController;

  @override
  void initState() {
    //TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: _tabList.length);
  }

  @override
  void dispose() {
    //TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
          color: Colors.black,
        ),
        backgroundColor: Color(0xFFFAFAFA),
        centerTitle: true,
        title: Text(
          "News App",
          style: TextStyle(color: Colors.black),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30.0),
          child: TabBar(
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            isScrollable: true,
            controller: _tabController,
            tabs: _tabList,
          ),
        ),
      ),
      body: TabBarView(controller: _tabController, children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            child: ListView.builder(
              itemCount: listTitles.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                                  item: listTitles[index],
                                  tag: listTitles[index].newsTitle,
                                )));
                  },
                  child: listWidget(listTitles[index]),
                );
              },
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(),
        ),
      ]),
    );
  }
}
