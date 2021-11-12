import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/extensions/size_extensions.dart';
import 'package:coddr/presentation/journeys/Rewards/rewards_vouchers.dart';
import 'package:flutter/material.dart';

class RewardsPage extends StatelessWidget {
  final int coins;

  const RewardsPage({Key key, @required this.coins}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Rewards Page',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w200),
          ),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black)),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(Sizes.dimen_18.w),
            child: Card(
              elevation: Sizes.dimen_8.w,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Sizes.dimen_16.w),
              ),
              color: Colors.grey[200],
              child: Column(
                children: [
                  SizedBox(
                    height: Sizes.dimen_30.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/coins.png',
                        height: Sizes.dimen_50.w,
                        width: Sizes.dimen_50.w,
                      ),
                      SizedBox(
                        width: Sizes.dimen_20.w,
                      ),
                      Text(
                        '$coins',
                        style: TextStyle(
                            color: Colors.red[600],
                            fontSize: Sizes.dimen_26.w,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Text(
                    'Coin Balance',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: Sizes.dimen_20.w,
                        fontWeight: FontWeight.bold),
                  ),
                  Text('Use Coins to redeem exciting vouchers'),
                  SizedBox(
                    height: Sizes.dimen_30.w,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.fromLTRB(Sizes.dimen_12.w, 0, 0, Sizes.dimen_8.w),
            child: Text(
              'Redeem Vouchers',
              style: TextStyle(fontSize: Sizes.dimen_20.w),
            ),
          ),
          RewardsVouchers(),
        ],
      ),
    );
  }
}
