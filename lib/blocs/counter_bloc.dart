// events
import 'dart:async';

import 'package:bloc_to_bloc_commuication/blocs/color_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CounterEvent {}

class IncrementCounter extends CounterEvent {}

class DecrementCounter extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
  final ColorBloc colorBloc;

  StreamSubscription colorBlocSubscription;
  int incrementStep = 1;

  CounterBloc({@required this.colorBloc})
      : assert(colorBloc != null),
        super(0) {
    colorBlocSubscription = colorBloc.listen((colorState) {
      if (colorState == Colors.red) {
        incrementStep = 1;
      } else if (colorState == Colors.green) {
        incrementStep = 10;
      } else if (colorState == Colors.blue) {
        incrementStep = 100;
      } else if (colorState == Colors.black) {
        incrementStep = -100;
        add(DecrementCounter());
      }
    });
  }

  @override
  Future<void> close() {
    colorBlocSubscription.cancel();
    return super.close();
  }

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    if (event is IncrementCounter) {
      yield state + incrementStep;
    } else if (event is DecrementCounter) {
      yield state - 100;
    }
  }
}
