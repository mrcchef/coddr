import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class PEditImage extends StatefulWidget {
  const PEditImage({Key key}) : super(key: key);

  @override
  _PEditImageState createState() => _PEditImageState();
}

class _PEditImageState extends State<PEditImage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: InkWell(
          child: Stack(
            children: [
              Container(
                child: CircleAvatar(
                  radius: 60.0,
                  backgroundImage:
                  AssetImage('assets/images/kshittiz2.jpg'),
                  backgroundColor: Colors.transparent,
                ),
                decoration: new BoxDecoration(
                  // border color
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 4.0,
                    color: HexColor('#6f6434'),
                  ),
                ),
              ),
              Positioned(
                height: 55,
                width: 120,
                left: 4,
                bottom: 6,
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(70),
                            bottomRight: Radius.circular(70))),
                    child: Center(
                        child: Text(
                          'Edit',
                          style: TextStyle(color: Colors.white),
                        ))),
              )
            ],
          ),
        ));
  }
}
