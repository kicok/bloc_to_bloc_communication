import 'package:bloc_to_bloc_commuication/blocs/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/color_bloc.dart';

class BlocCommPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorBloc = BlocProvider.of<ColorBloc>(context);
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc-To-Bloc Comm'),
      ),
      body: BlocBuilder<ColorBloc, Color>(
        builder: (context, coolrState) {
          return Container(
            color: coolrState,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<CounterBloc, int>(
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
                        colorBloc.add(ColorChanged());
                      },
                    ),
                    SizedBox(width: 20),
                    RaisedButton(
                      child: Text(
                        'Next Number',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      onPressed: () {
                        counterBloc.add(IncrementCounter());
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
