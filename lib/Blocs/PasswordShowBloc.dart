import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TogglePassEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class TogglePassState extends Equatable {
  final bool obscTxt;
  const TogglePassState({this.obscTxt});
  @override
  List<Object> get props => [obscTxt];
}

class TogglePassBloc extends Bloc<TogglePassEvent, TogglePassState> {
  TogglePassBloc() : super(TogglePassState(obscTxt: true));

  @override
  Stream<TogglePassState> mapEventToState(TogglePassEvent event) async* {
    if (event is TogglePassEvent)
      yield TogglePassState(obscTxt: !state.obscTxt);
  }
}
