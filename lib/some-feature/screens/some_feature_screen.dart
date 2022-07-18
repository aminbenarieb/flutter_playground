import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/some-feature/bloc/bloc.dart';

class SomeFeatureScreenWidget extends StatelessWidget {
  const SomeFeatureScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _Dependencies(
      child: Scaffold(
        // theme: ThemeData(brightness: Brightness.dark),
        appBar: AppBar(title: Text('Some Feature')),
        body: SafeArea(child: _SomeFeatureScreen()),
        //actions: [IconButton(icon: const Icon(Icons.list), onPressed: _pushSaved)]
      ),
    );
  }
}

class _SomeFeatureScreen extends StatelessWidget {
  const _SomeFeatureScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoDatePicker(
        initialDateTime: DateTime.now(),
        onDateTimeChanged: (val) {
          context.read<SomeFeatureBloc>().add(
                SelectTimeFeatureEvent(time: val),
              );
        });
  }
}

class _Dependencies extends StatelessWidget {
  final Widget child;

  const _Dependencies({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (context) => SomeFeatureBloc())],
        child: child);
  }
}
