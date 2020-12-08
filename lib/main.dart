import 'package:flutter/material.dart';
import 'bloc_comm_page.dart';
import 'cubit_comm_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
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
