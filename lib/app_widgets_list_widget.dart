import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppWidgetsListWidget extends StatelessWidget {
  final _widgetNamesToRoutes = <String, String>{
    "Signature canvas": "signature_canvas_widget",
    "Animation frame": "animation_frame_widget",
    "Counter button": "counter_button_widget",
    "Random Words": "random_words_table_widget"
  };

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        // theme: ThemeData(brightness: Brightness.dark),
        navigationBar: CupertinoNavigationBar(
          middle: Text('App Widget List'),
        ),
        child: SafeArea(
            child: Scaffold(
                body: ListView.builder(
                    padding: const EdgeInsets.all(16.0),
                    itemCount: _widgetNamesToRoutes.length,
                    itemBuilder: (context, i) {
                      final widgetName = _widgetNamesToRoutes.keys.elementAt(i);
                      return ListTile(
                          title: Text(widgetName),
                          onTap: () => Navigator.of(context).pushNamed(
                              "/${_widgetNamesToRoutes[widgetName]!}"));
                    }))));
  }
}
