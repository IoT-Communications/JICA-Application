import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  final String labelText;
  final Color splashColor;
  final Color highlightColor;
  final Color fillColor;
  final Color textColor;
  final void Function() onPressed;
  final double radius;

  const CustomRaisedButton({
    Key key,
    @required this.labelText,
    @required this.onPressed,
    this.splashColor,
    this.highlightColor,
    this.fillColor,
    this.textColor,
    this.radius = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      highlightElevation: 0.0,
      splashColor: splashColor ?? Theme.of(context).accentColor,
      highlightColor: highlightColor ?? Theme.of(context).accentColor,
      elevation: 0.0,
      color: fillColor ?? Theme.of(context).accentColor,
      disabledColor: Colors.amberAccent[600],
      shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(radius)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            labelText,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: textColor,
              fontFamily: 'Trocchi',
            ),
          ),
          // SizedBox(width: 20),
          // Icon(Icons.arrow_forward_ios)
        ],
      ),
      onPressed: onPressed,
    );
  }
}
