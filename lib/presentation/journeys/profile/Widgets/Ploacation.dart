import 'package:coddr/common/constants/size_constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:coddr/common/extensions/size_extensions.dart';

class Plocation extends StatelessWidget {
  final String city, state, country;

  const Plocation({
    Key key,
    @required this.city,
    @required this.state,
    @required this.country,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(Sizes.dimen_12.w),
        child: Container(
          height: Sizes.dimen_140.w,
          decoration: BoxDecoration(
              color: HexColor('E1D9FE'),
              borderRadius: BorderRadius.circular(30)),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Icon(
                  FontAwesomeIcons.mapMarkerAlt,
                  size: 50,
                ),
              ),
              //Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        'City',
                        style: TextStyle(
                            fontSize: 16,
                            color: HexColor('861F3E'),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 52,
                      ),
                      Text(city)
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'State',
                        style: TextStyle(
                            fontSize: 16,
                            color: HexColor('861F3E'),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 42,
                      ),
                      Text(state)
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Country',
                        style: TextStyle(
                            fontSize: 16,
                            color: HexColor('861F3E'),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(country)
                    ],
                  ),
                ],
              ),
              Spacer()
            ],
          ),
        ));
  }
}
