import 'package:flutter/material.dart';
import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/extensions/size_extensions.dart';

class RewardsVouchers extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GridView(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: Sizes.dimen_6.w,
        mainAxisSpacing: Sizes.dimen_6.w,
        // mainAxisExtent: 199
      ),
      shrinkWrap: true,
      children: [
        Card(
          elevation: Sizes.dimen_8.w,
          child: Column(
            children: [
              Image.asset(
                'assets/images/ganna.jpg',
                height: Sizes.dimen_100.w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/coins.png',
                    height: Sizes.dimen_30.w,
                    width: Sizes.dimen_30.w,
                  ),
                  Text('  500 coins')
                ],
              ),
              Row(
                children: [
                  Flexible(
                      child: Text(
                        'Flat 50% off-3 months membership @99',
                        textAlign: TextAlign.center,
                      )),
                ],
              ),
            ],
          ),
        ),
        Card(
          elevation: Sizes.dimen_8.w,
          child: Column(
            children: [
              Image.asset(
                'assets/images/giveindia.jpg',
                height: Sizes.dimen_100.w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/coins.png',
                    height: Sizes.dimen_30.w,
                    width: Sizes.dimen_30.w,
                  ),
                  Text('  100 coins')
                ],
              ),
              Row(
                children: [
                  Flexible(
                      child: Text(
                        'Donate 1 Meal For a Child',
                        textAlign: TextAlign.center,
                      )),
                ],
              ),
            ],
          ),
        ),
        Card(
          elevation: Sizes.dimen_8.w,
          child: Column(
            children: [
              Image.asset(
                'assets/images/paytm.jpg',
                height: Sizes.dimen_100.w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/coins.png',
                    height: Sizes.dimen_30.w,
                    width: Sizes.dimen_30.w,
                  ),
                  Text('  300 coins')
                ],
              ),
              Row(
                children: [
                  Flexible(
                      child: Text(
                        '5% cashback on Paytm DTH Recharge',
                        textAlign: TextAlign.center,
                      )),
                ],
              ),
            ],
          ),
        ),
        Card(
          elevation: Sizes.dimen_8.w,
          child: Column(
            children: [
              Image.asset(
                'assets/images/myntra.jpg',
                height: Sizes.dimen_100.w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/coins.png',
                    height: Sizes.dimen_30.w,
                    width: Sizes.dimen_30.w,
                  ),
                  Text('  250 coins')
                ],
              ),
              Row(
                children: [
                  Flexible(
                      child: Text(
                        'Rs. 150 Off on Myntra Select Styles',
                        textAlign: TextAlign.center,
                      )),
                ],
              ),
            ],
          ),
        ),
        Card(
          elevation: Sizes.dimen_8.w,
          child: Column(
            children: [
              Image.asset(
                'assets/images/puma.jpg',
                height: Sizes.dimen_100.w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/coins.png',
                    height: Sizes.dimen_30.w,
                    width: Sizes.dimen_30.w,
                  ),
                  Text('  300 coins')
                ],
              ),
              Row(
                children: [
                  Flexible(
                      child: Text(
                        'Rs. 1000 Off on PUMA Footwear',
                        textAlign: TextAlign.center,
                      )),
                ],
              ),
            ],
          ),
        ),
        Card(
          elevation: Sizes.dimen_8.w,
          child: Column(
            children: [
              Image.asset(
                'assets/images/boat.png',
                height: Sizes.dimen_100.w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/coins.png',
                    height: Sizes.dimen_30.w,
                    width: Sizes.dimen_30.w,
                  ),
                  Text('  1500 coins')
                ],
              ),
              Row(
                children: [
                  Flexible(
                      child: Text(
                        'Rs. 1000 off on Boat Headphones',
                        textAlign: TextAlign.center,
                      )),
                ],
              ),
            ],
          ),
        ),
        Card(
          elevation: Sizes.dimen_8.w,
          child: Column(
            children: [
              Image.asset(
                'assets/images/Dominos.png',
                height: Sizes.dimen_100.w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/coins.png',
                    height: Sizes.dimen_30.w,
                    width: Sizes.dimen_30.w,
                  ),
                  Text('  250 coins')
                ],
              ),
              Row(
                children: [
                  Flexible(
                      child: Text(
                        'Rs. 200 Off on Dominos Pizza',
                        textAlign: TextAlign.center,
                      )),
                ],
              ),
            ],
          ),
        ),
        Card(
          elevation: Sizes.dimen_8.w,
          child: Column(
            children: [
              Image.asset(
                'assets/images/zee5.jpg',
                height: Sizes.dimen_100.w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/coins.png',
                    height: Sizes.dimen_30.w,
                    width: Sizes.dimen_30.w,
                  ),
                  Text('  300 coins')
                ],
              ),
              Row(
                children: [
                  Flexible(
                      child: Text(
                        '1 month Subscription of Zee5 Premium',
                        textAlign: TextAlign.center,
                      )),
                ],
              ),
            ],
          ),
        ),
      ],

    );
  }
}
