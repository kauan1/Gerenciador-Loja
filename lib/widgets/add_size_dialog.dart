import 'package:flutter/material.dart';

class AddSizeDialog extends StatelessWidget {

  final _controler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.only(right: 8, left: 8, top: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              controller: _controler,
            ),
            Container(
              alignment: Alignment.centerRight,
              child: FlatButton(
                child: Text("add"),
                textColor: Colors.pinkAccent,
                onPressed: (){
                  Navigator.of(context).pop(_controler.text);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
