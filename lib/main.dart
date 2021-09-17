import 'package:flutter/cupertino.dart';
import 'random_words_table_widget.dart';
import 'counter_button_widget.dart';
import 'animation_frame_widget.dart';
import 'signature_canvas_widget.dart';
import 'app_widgets_list_widget.dart';
import 'json_data_list_widget.dart';

void main() {
  runApp(CupertinoApp(
    home: AppWidgetsListWidget(<String, String>{
      "Signature canvas": "signature_canvas_widget",
      "Animation frame": "animation_frame_widget",
      "Counter button": "counter_button_widget",
      "Random Words": "random_words_table_widget",
      "Json data list ": "json_data_list_widget"
    }),
    routes: <String, WidgetBuilder>{
      '/random_words_table_widget': (BuildContext context) =>
          RandomWordsTableWidget(),
      '/counter_button_widget': (BuildContext context) => CounterButtonWidget(),
      '/animation_frame_widget': (BuildContext context) =>
          AnimationFrameWidget(),
      '/signature_canvas_widget': (BuildContext context) =>
          SignatureCanvasWidget(),
      '/json_data_list_widget': (BuildContext context) => JsonDataListWidget(),
    },
  ));
}
