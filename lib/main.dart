import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_playground/some-feature/screens/some_feature_screen.dart';
import 'widgets/random_words_table_widget.dart';
import 'widgets/counter_button_widget.dart';
import 'widgets/animation_frame_widget.dart';
import 'widgets/signature_canvas_widget.dart';
import 'widgets/app_widgets_list_widget.dart';
import 'widgets/dialog_widget.dart';
import 'widgets/json_data_list_widget.dart';
import 'package:flutter_playground/widgets/input_form_widget.dart';

void main() {
  runApp(MaterialApp(
    home: Localizations(
        locale: const Locale('en', 'US'),
        child: SafeArea(
            child: AppWidgetsListWidget(const <String, String>{
          "Signature canvas": "signature_canvas_widget",
          "Animation frame": "animation_frame_widget",
          "Counter button": "counter_button_widget",
          "Random Words": "random_words_table_widget",
          "Json data list ": "json_data_list_widget",
          "Input Form Widget": "input_list_widget",
          "Dialog Widget": "dialog_widget",
          "Some feature": "some_feature",
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
      '/dialog_widget': (BuildContext context) => DialogWidget(),
      '/some_feature': (BuildContext context) => SomeFeatureScreenWidget(),
    },
  ));
}
