import 'package:coddr/common/constants/image_constants.dart';
import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/extensions/size_extensions.dart';
import 'package:flutter/material.dart';

class TopHomeScreen extends StatelessWidget {
  final String displayName;
  final String imageUrl;
  const TopHomeScreen({
    Key key,
    @required this.displayName,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('image URL' + imageUrl);
    print(displayName);
    return Container(
      height: Sizes.dimen_96.w,
      child: Row(
        children: [
          Container(
            width: Sizes.dimen_200.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome\n$displayName",
                  maxLines: 2,
                  style: Theme.of(context).textTheme.headline5,
                ),
                Container(
                  height: Sizes.dimen_1.w,
                  color: Colors.black26,
                ),
                Text(
                  "Earn money with your skill",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            ),
          ),
          //Expanded(
          // child: Container(
          //  child:
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(Sizes.dimen_10.h),
          //   child: imageUrl == ""
          //       ? Image.asset(
          //           Images.defaultUserImage,
          //           fit: BoxFit.cover,
          //         )
          //       : Image.network(
          //           imageUrl,
          //           fit: BoxFit.contain,
          //         ),
          // ),
          CircleAvatar(
            radius: Sizes.dimen_60.w,
            backgroundImage: (imageUrl != "")
                ? NetworkImage(imageUrl)
                : AssetImage(Images.defaultUserImage),
          ),
        ],
      ),
    );
  }
}
