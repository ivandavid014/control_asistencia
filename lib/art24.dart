import 'package:flutter/material.dart';

class Art24 extends StatelessWidget {
  const Art24({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Art24'),
        /* onTap: () {
          showDialog(
            context: context,
            builder: (pop) => AlertDialog(
              title: Text("Show Alert Dialog Box"),
              content: Text("You have raised a Alert Dialog Box"),
              actions: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {
                    Navigator.of(pop).pop();
                  },
                  child: Text("Ok"),
                ),
              ],
            ),
          );
        },*/
      ),
    );
  }
}
