import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'color_cubit.dart';

class CounterCubit extends Cubit<int> {
  final ColorCubit colorCubit;
  int incrementStep = 1;

  StreamSubscription colorCubitSubscription;

  CounterCubit({@required this.colorCubit})
      : assert(colorCubit != null),
        super(0) {
    colorCubitSubscription = colorCubit.listen((colorState) {
      if (colorState == Colors.red) {
        incrementStep = 1;
      } else if (colorState == Colors.green) {
        incrementStep = 10;
      } else if (colorState == Colors.blue) {
        incrementStep = 100;
      } else if (colorState == Colors.black) {
        incrementStep = -100;
        emit(state - 100);
      }
    });
  }

  @override
  Future<void> close() {
    colorCubitSubscription.cancel();
    return super.close();
  }

  void nextCounter() {
    emit(state + incrementStep);
  }
}
