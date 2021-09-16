import 'package:flutter/cupertino.dart';
import 'random_words_table_widget.dart';
import 'counter_button_widget.dart';
import 'animation_frame_widget.dart';
import 'signature_canvas_widget.dart';
import 'app_widgets_list_widget.dart';

void main() {
  runApp(CupertinoApp(
    home: AppWidgetsListWidget(),
    routes: <String, WidgetBuilder>{
      '/random_words_table_widget': (BuildContext context) =>
          RandomWordsTableWidget(),
      '/counter_button_widget': (BuildContext context) => CounterButtonWidget(),
      '/animation_frame_widget': (BuildContext context) =>
          AnimationFrameWidget(),
      '/signature_canvas_widget': (BuildContext context) =>
          SignatureCanvasWidget(),
    },
  ));
}
