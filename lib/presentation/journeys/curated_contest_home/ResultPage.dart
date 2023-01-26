import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/extensions/size_extensions.dart';
import 'package:coddr/presentation/themes/themes.dart';
import 'package:flutter/cupertino.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.dimen_16.w,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: Sizes.dimen_16.w,
            ),
            child: Row(
              children: [
                Text(
                  'Total Participants:',
                  style:
                      ThemeText.bodyText1.copyWith(fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  'Winners: ',
                  style:
                      ThemeText.bodyText1.copyWith(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView(children: []),
          ),
        ],
      ),
    );
  }
}
