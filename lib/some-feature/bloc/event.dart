part of 'bloc.dart';

abstract class SomeFeatureEvent extends Equatable {
  const SomeFeatureEvent();

  @override
  List<Object> get props => [];
}

class SelectTimeFeatureEvent extends SomeFeatureEvent {
  final DateTime? time;

  const SelectTimeFeatureEvent({required this.time});
}
