import 'package:flutter/material.dart';
import 'package:drinks/config/Palette.dart';

class InputWidget extends StatelessWidget {
  InputWidget({IconData this.icon});

  final IconData icon;
  final TextEditingController textEditingController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Material(
            child: new Container(
              margin: new EdgeInsets.symmetric(horizontal: 1.0),
              child: new IconButton(
                icon: new Icon(this.icon),
                color: Palette.primaryColor,
              ),
            ),
            color: Colors.white,
          ),

          // Text input
          Flexible(
            child: Container(
              child: TextField(
                style:
                    TextStyle(color: Palette.primaryTextColor, fontSize: 15.0),
                controller: textEditingController,
                decoration: InputDecoration.collapsed(
                  hintText: 'Type a message',
                  hintStyle: TextStyle(color: Palette.greyColor),
                ),
              ),
            ),
          ),

          // Send Message Button
          Material(
            child: new Container(
              margin: new EdgeInsets.symmetric(horizontal: 8.0),
              child: new IconButton(
                icon: new Icon(Icons.send),
                onPressed: () => {},
                color: Palette.primaryColor,
              ),
            ),
            color: Colors.white,
          ),
        ],
      ),
      width: double.infinity,
      height: 50.0,
      decoration: new BoxDecoration(
          border: new Border(
              top: new BorderSide(color: Palette.greyColor, width: 0.5)),
          color: Colors.white),
    );
  }
}
