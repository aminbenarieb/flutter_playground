part of 'bloc.dart';

abstract class SomeFeatureState extends Equatable {
  const SomeFeatureState();

  @override
  List<dynamic> get props => [];
}

class InitialSomeFeatureState extends SomeFeatureState {
  const InitialSomeFeatureState();
}
