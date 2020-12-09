import 'package:bloc_to_bloc_commuication/cubits/color_cubit.dart';
import 'package:bloc_to_bloc_commuication/cubits/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitcommPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cubit-To-Cubit Comm'),
      ),
      body: BlocBuilder<ColorCubit, Color>(
        builder: (context, colorState) {
          return Container(
            color: colorState,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<CounterCubit, int>(
                  builder: (context, counterState) {
                    return Text(
                      '$counterState',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                      ),
                    );
                  },
                ),
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      child: Text(
                        'Next Color',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      onPressed: () {
                        BlocProvider.of<ColorCubit>(context).nextColor();
                      },
                    ),
                    SizedBox(width: 20),
                    RaisedButton(
                      child: Text(
                        'Next Number',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).nextCounter();
                      },
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
