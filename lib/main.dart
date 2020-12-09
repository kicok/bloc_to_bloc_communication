import 'package:bloc_to_bloc_commuication/blocs/counter_bloc.dart';
import 'package:bloc_to_bloc_commuication/cubits/color_cubit.dart';
import 'package:bloc_to_bloc_commuication/cubits/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc_comm_page.dart';
import 'cubit_comm_page.dart';
import 'blocs/color_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Bloc to Bloc
        BlocProvider(
          create: (context) => ColorBloc(),
        ),
        BlocProvider(
          create: (context) => CounterBloc(
            colorBloc: BlocProvider.of<ColorBloc>(context),
          ),
        ),

        // Cubit to Cubit
        BlocProvider(
          create: (context) => ColorCubit(),
        ),
        BlocProvider(
          create: (context) => CounterCubit(
            colorCubit: BlocProvider.of<ColorCubit>(context),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc2Bloc Comm'),
      ),
      body: Center(
        child: IntrinsicWidth(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              RaisedButton(
                child: Text('Bloc Version'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return BlocCommPage();
                  }));
                },
              ),
              RaisedButton(
                child: Text('Cubit Version'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return CubitcommPage();
                  }));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
