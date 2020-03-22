import 'package:flutter/material.dart';

class DashboardButton extends MaterialButton {
  DashboardButton({
    Key key,
    @required VoidCallback onPressed,
    VoidCallback onLongPress,
    ValueChanged<bool> onHighlightChanged,
    ButtonTextTheme textTheme,
    Color textColor,
    Color disabledTextColor,
    Color color,
    Color disabledColor,
    Color focusColor,
    Color hoverColor,
    Color highlightColor,
    Color splashColor,
    Brightness colorBrightness,
    EdgeInsetsGeometry padding,
    ShapeBorder shape,
    Clip clipBehavior = Clip.none,
    FocusNode focusNode,
    bool autofocus = false,
    MaterialTapTargetSize materialTapTargetSize,
    @required String text,
  }) : super(
    key: key,
    onPressed: onPressed,
    onLongPress: onLongPress,
    onHighlightChanged: onHighlightChanged,
    textTheme: textTheme,
    textColor: textColor,
    disabledTextColor: disabledTextColor,
    color: color,
    disabledColor: disabledColor,
    focusColor: focusColor,
    hoverColor: hoverColor,
    highlightColor: highlightColor,
    splashColor: splashColor,
    colorBrightness: colorBrightness,
    padding: padding,
    shape: RoundedRectangleBorder(
  borderRadius: new BorderRadius.circular(10.0),
  ),

    clipBehavior: clipBehavior,
    focusNode: focusNode,
    autofocus: autofocus,
    materialTapTargetSize: materialTapTargetSize,
    child: Center(child: Text(text, style: TextStyle(fontFamily: "Roboto", fontSize: 18), textAlign: TextAlign.center)),
  );

  @override
  Color get color => Colors.white;
}
