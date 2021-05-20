import 'package:coddr/common/constants/size_constants.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        elevation: Sizes.dimen_40,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Sizes.dimen_32),
          topRight: Radius.circular(Sizes.dimen_32),
        ),
        color: Colors.black12,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.account_circle_outlined,
                size: Sizes.dimen_32,
              ),
              Expanded(child: Container()),
              Icon(
                Icons.home_outlined,
                size: Sizes.dimen_32,
              ),
              Expanded(child: Container()),
              Icon(
                Icons.search,
                size: Sizes.dimen_32,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
