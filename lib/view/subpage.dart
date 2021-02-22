import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class SubPage extends StatelessWidget {

  String Catch;
  String description;
  String event_url;

  SubPage({Key key, this.description,this.Catch,this.event_url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Catch),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            events_show(Catch,description,event_url),
            // _searchResult(),
          ],
        ),
      ),
    );
  }
}
  Widget events_show(String Catch, String description, String event_url){

    _launchURL(String event_url) async {
      if (await canLaunch(event_url)) {
        await launch(event_url);
      } else {
        throw 'Could not launch $event_url';
      }
    }

    return ListView(
      shrinkWrap: true,   //追加
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        Center(
          child: RaisedButton(
            child: const Text('urlへ飛ぶ'),
            onPressed: () {
              _launchURL(event_url);
            },
          ),
        ),
        Card(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Catch,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Text(
                  description,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),

        ),



      ],

    );
  }
