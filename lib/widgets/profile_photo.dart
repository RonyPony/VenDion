import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UserPhoto extends StatefulWidget {
  final double? size;
  const UserPhoto({super.key, required this.size});

  @override
  State<UserPhoto> createState() => _UserPhotoState();
}

class _UserPhotoState extends State<UserPhoto> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Color(0xffff5b00),

          radius: widget.size,
          child: Text(
            'RC',
            style: TextStyle(fontSize: 40, color: Colors.white),
          ), //Text
        ),
        // CircleAvatar(
        //   backgroundImage: SvgPicture.asset('assets\notification-active.svg'),
        //   backgroundColor: Colors.red,

        // )
      ],
    );
  }
}
