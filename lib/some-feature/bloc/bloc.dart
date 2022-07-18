import 'dart:developer';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';

part 'event.dart';
part 'state.dart';

EventTransformer<E> throttleDroppable<E>() {
  return (events, mapper) {
    // final nonDebounceStream = events.where((event) {
    //   return event is! SelectTimeFeatureEvent;
    // });

    // final debounceStream = events.where((event) {
    //   return event is SelectTimeFeatureEvent;
    // }).debounce(const Duration(seconds: 2));
    return restartable<E>()
        .call(events.debounce(const Duration(seconds: 5)), mapper);
  };
}

class SomeFeatureBloc extends Bloc<SomeFeatureEvent, SomeFeatureState> {
  SomeFeatureBloc() : super(const InitialSomeFeatureState()) {
    on<SomeFeatureEvent>(
      (event, emit) async {
        try {
          if (event is SelectTimeFeatureEvent) {
            log('time: ${event.time}');
          }
        } on Exception catch (ex, st) {
          assert(false, ex.toString());
        }
      },
      transformer: throttleDroppable(),
    );
  }
}
