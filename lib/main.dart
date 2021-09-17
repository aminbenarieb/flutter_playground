import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'random_words_table_widget.dart';
import 'counter_button_widget.dart';
import 'animation_frame_widget.dart';
import 'signature_canvas_widget.dart';
import 'app_widgets_list_widget.dart';
import 'json_data_list_widget.dart';
import 'input_form_widget.dart';

void main() {
  runApp(MaterialApp(
    home: Localizations(
        locale: Locale('en', 'US'),
        child: SafeArea(
            child: AppWidgetsListWidget(<String, String>{
          "Signature canvas": "signature_canvas_widget",
          "Animation frame": "animation_frame_widget",
          "Counter button": "counter_button_widget",
          "Random Words": "random_words_table_widget",
          "Json data list ": "json_data_list_widget",
          "Input Form Widget": "input_list_widget"
        })),
        delegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          DefaultMaterialLocalizations.delegate
        ]),
    routes: <String, WidgetBuilder>{
      '/random_words_table_widget': (BuildContext context) =>
          RandomWordsTableWidget(),
      '/counter_button_widget': (BuildContext context) => CounterButtonWidget(),
      '/animation_frame_widget': (BuildContext context) =>
          AnimationFrameWidget(),
      '/signature_canvas_widget': (BuildContext context) =>
          SignatureCanvasWidget(),
      '/json_data_list_widget': (BuildContext context) => JsonDataListWidget(),
      '/input_list_widget': (BuildContext context) => InputFormWidget(),
    },
  ));
}
