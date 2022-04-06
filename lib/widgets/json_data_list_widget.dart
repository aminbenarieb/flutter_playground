import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class JsonDataListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // theme: ThemeData(brightness: Brightness.dark),
      navigationBar: CupertinoNavigationBar(
        middle: Text('Random Words'),
      ),
      child: SafeArea(child: SampleAppPage()),
      //actions: [IconButton(icon: const Icon(Icons.list), onPressed: _pushSaved)]
    );
  }

  @override
  _SampleAppPageState createState() => _SampleAppPageState();
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key? key}) : super(key: key);

  @override
  _SampleAppPageState createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  List widgets = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  showLoadingDialog() {
    return widgets.length == 0;
  }

  getBody() {
    if (showLoadingDialog()) {
      return getProgressDialog();
    } else {
      return getListView();
    }
  }

  getProgressDialog() {
    return Center(child: CupertinoActivityIndicator());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: getBody());
  }

  ListView getListView() => ListView.builder(
      itemCount: widgets.length,
      itemBuilder: (BuildContext context, int position) {
        return getRow(position);
      });

  Widget getRow(int i) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Text("Row ${widgets[i]["title"]}"),
    );
  }

  loadData() async {
    Uri dataURL = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    http.Response response = await http.get(dataURL);
    setState(() {
      widgets = jsonDecode(response.body);
    });
  }
}
