import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class PHistory extends StatelessWidget {
  const PHistory({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
            color: HexColor('D8FFCE'),
            borderRadius: BorderRadius.circular(30)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'History',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            Row(
              children: [
                Spacer(),
                Column(
                  children: [
                    Image.asset(
                      'assets/images/coins.png',
                      height: 50,
                      width: 50,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      '300',
                      style: TextStyle(
                          fontSize: 14, color: Colors.black),
                    ),
                    Text(
                      'Coins',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Container(
                      height: 70,
                      width: 100,
                      child: Image.asset(
                        'assets/images/contest.png',
                      ),
                    ),
                    Text(
                      '25',
                      style: TextStyle(
                          fontSize: 14, color: Colors.black),
                    ),
                    Text(
                      'Contest',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Image.asset(
                      'assets/images/trophy.png',
                      height: 50,
                      width: 50,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      '20',
                      style: TextStyle(
                          fontSize: 14, color: Colors.black),
                    ),
                    Text(
                      'Wins',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
