import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UserNameRating extends StatefulWidget {
  const UserNameRating({super.key});

  @override
  State<UserNameRating> createState() => _UserNameRatingState();
}

class _UserNameRatingState extends State<UserNameRating> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: size.height * .15,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xffff5b00)),
          padding: EdgeInsets.only(
              right: size.width * .2,
              left: size.width * .2,
              top: size.width * .05,
              bottom: size.width * .05),
          child: Text(
            'Ronel Cruz C.',
            style: TextStyle(fontSize: 35, color: Colors.white),
          ),
        )
      ],
    );
  }
}
