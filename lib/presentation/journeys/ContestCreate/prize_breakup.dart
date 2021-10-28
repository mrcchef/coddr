import 'package:flutter/material.dart';
import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/extensions/size_extensions.dart';

class PrizeBreakup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Prize Breakup',
          style: TextStyle(fontSize: Sizes.dimen_16.w, fontWeight: FontWeight.w200),
        ),
        backgroundColor: Colors.black,
        toolbarHeight: Sizes.dimen_46.w,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.fromLTRB(Sizes.dimen_8.w, Sizes.dimen_4.w, Sizes.dimen_8.w, 0),
                    child: Text(
                      'Max Prize Pool',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Text(
                    '1000',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Spacer(),
              Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.fromLTRB(Sizes.dimen_8.w, Sizes.dimen_4.w, Sizes.dimen_8.w, 0),
                    child: Text(
                      'Spots',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Text(
                    '5',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Spacer(),
              Padding(
                padding:  EdgeInsets.only(right: Sizes.dimen_18.w),
                child: Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.fromLTRB(Sizes.dimen_8.w, Sizes.dimen_4.w, Sizes.dimen_8.w, 0),
                      child: Text(
                        'Entry',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Text(
                      '200',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: Sizes.dimen_20.w,
          ),
          Padding(
            padding:  EdgeInsets.all(Sizes.dimen_18.w),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Sizes.dimen_20.w),
                  border: Border.all(color: Colors.black)
                  ),
              width: double.infinity,
              child: Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.fromLTRB(Sizes.dimen_8.w, Sizes.dimen_6.w,Sizes.dimen_8.w, 0),
                    child: Row(
                      children: [
                        Text('Rank'),
                        Spacer(),
                        Text('% of Prize Pool'),
                        Spacer(),
                        Text('Winnings')
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Padding(
                    padding:  EdgeInsets.fromLTRB(Sizes.dimen_8.w, 0, Sizes.dimen_8.w, 0),
                    child: Row(
                      children: [
                        Text('#1'),
                        Spacer(),
                        Text('50%'),
                        Spacer(),
                        Text('500')
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Padding(
                    padding:  EdgeInsets.fromLTRB(Sizes.dimen_8.w, 0, Sizes.dimen_8.w, 0),
                    child: Row(
                      children: [
                        Text('#2'),
                        Spacer(),
                        Text('30%'),
                        Spacer(),
                        Text('300')
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Padding(
                    padding:  EdgeInsets.fromLTRB(Sizes.dimen_8.w, 0, Sizes.dimen_8.w, Sizes.dimen_4.w),
                    child: Row(
                      children: [
                        Text('#3'),
                        Spacer(),
                        Text('20%'),
                        Spacer(),
                        Text('200')
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Divider(
            thickness: Sizes.dimen_4.w,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:  EdgeInsets.fromLTRB(Sizes.dimen_8.w, 0, Sizes.dimen_8.w, 0),
              child: Container(
                width: double.infinity,
                child: FlatButton(
                  child: Text('Create Contest', style: TextStyle(fontSize: Sizes.dimen_24.w)),
                  onPressed: () {},
                  color: Colors.green,
                  textColor: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
