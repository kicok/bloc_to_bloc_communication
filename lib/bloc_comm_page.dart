import 'package:flutter/material.dart';

class BlocCommPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc-To-Bloc Comm'),
      ),
      body: Container(
        color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '0',
              style: TextStyle(
                color: Colors.white,
                fontSize: 60,
              ),
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
                  onPressed: () {},
                ),
                SizedBox(width: 20),
                RaisedButton(
                  child: Text(
                    'Next Number',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
