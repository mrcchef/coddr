import 'package:flutter/material.dart';

class CoddrAppBar extends StatelessWidget with PreferredSizeWidget {
  final Widget leftWidget;
  final Widget middleWidget;
  final Widget rightWidget;

  const CoddrAppBar({
    Key key,
    @required this.leftWidget,
    @required this.middleWidget,
    @required this.rightWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      actions: [
        leftWidget,
        Spacer(),
        middleWidget,
        Spacer(),
        rightWidget,
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  //Size get preferredSize => throw UnimplementedError();
}
