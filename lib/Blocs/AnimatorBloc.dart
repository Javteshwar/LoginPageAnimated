import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToggleAnimationEvent extends Equatable {
  const ToggleAnimationEvent();
  @override
  List<Object> get props => [];
}

class ToggleAnimationState extends Equatable {
  final bool isExpanded;
  const ToggleAnimationState({this.isExpanded});
  List<Object> get props => [isExpanded];
}

class ToggleAnimationBloc
    extends Bloc<ToggleAnimationEvent, ToggleAnimationState> {
  ToggleAnimationBloc() : super(ToggleAnimationState(isExpanded: false));
  @override
  Stream<ToggleAnimationState> mapEventToState(
      ToggleAnimationEvent event) async* {
    if (event is ToggleAnimationEvent)
      yield ToggleAnimationState(
        isExpanded: !state.isExpanded,
      );
  }
}
