import 'package:flutter/material.dart';
import 'package:no5_flutter_tests/view/subpage.dart';
import 'package:no5_flutter_tests/controller/connpass_api.dart';
import 'package:no5_flutter_tests/repository/conpass_api_model_repository.dart';
import 'dart:convert';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future _data ;


  final text_field_controller = TextEditingController();
  var _ConpassAPI= new ConpassAPI();
  String keyword;
  @override
  Widget build(BuildContext context) {
    if (keyword == null) {
      print('keyword-NULL');
      this.keyword = "python";
      this._data = _ConpassAPI.fetchPosts(this.keyword);  // 実際は非同期でデータを取ってきて代入する
    }else{
      this._data = _ConpassAPI.fetchPosts(this.keyword);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('イベントリスト'),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            _searchInput(),
            // _searchResult(),
          ],
        ),
      ),
    );
  }

  Widget _searchInput() {
      return ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          FutureBuilder(
            future: this._data,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // 非同期処理未完了 = 通信中
                return Center(
                  child: CircularProgressIndicator(),
                );
              }else if (snapshot.hasData) {
                Map conpass_decode  =  json.decode(snapshot.data);
                var _ConpassAPIModel =  new ConpassAPIModelRepository(conpass_decode);
                var instance_lists = _ConpassAPIModel.instance_lists;
                print(instance_lists.length);

                return Column(
                  children: [
                    TextField(
                      // enabled: true,
                      controller: text_field_controller,
                    ),
                    Center(
                      child: RaisedButton(
                        child: const Text('Search'),
                        onPressed: () {
                          setState(() {
                            this.keyword = text_field_controller.text;
                          });
                        },
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,   //追加
                      physics: const NeverScrollableScrollPhysics(),

                      itemCount: instance_lists.length, //並べたい要素の数を指定する
                      itemBuilder: (context, int index) { // index はこの ListView における要素の番号
                        return ListTile(
                            trailing: Icon(Icons.more_vert),
                        title: Text(instance_lists[index].title),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context,) => SubPage(
                                  Catch:'${instance_lists[index].title}',
                                  description:'${instance_lists[index].description}',
                                  event_url:'${instance_lists[index].event_url}',
                              ),
                            ),
                          );
                        });
                      },
                    ),
                  ],
                );
              }
              else {
                return Text("データが存在しません");
              }
            },
          ),
        ],
      );
  }


}