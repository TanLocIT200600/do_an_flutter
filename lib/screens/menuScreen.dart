import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/loader.dart';
import 'package:flutter_application_1/shared/getSources.dart';
import '../../models/source.dart';
import '../../models/sourceResponse.dart';
import '../../screens/sourceDetail.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  void initState() {
    super.initState();
    getSources..getSources();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SourceResponse>(
      stream: getSources.subject.stream,
      builder: (context, AsyncSnapshot<SourceResponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return Container();
          }
          return _buildSourcesWidget(snapshot.data);
        } else if (snapshot.hasError) {
          return Container();
        } else {
          return buildLoadingWidget();
        }
      },
    );
  }

  Widget _buildSourcesWidget(SourceResponse data) {
    List<SourceModel> sources = data.sources;
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 10.0),
      child: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                "The News Saved",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
