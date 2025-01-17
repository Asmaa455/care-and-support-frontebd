import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final ImageProvider? profileImage;
  final VoidCallback onEdit;

  ProfileImage({this.profileImage, required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 65,
          backgroundImage: profileImage ?? AssetImage('image/PI.jpeg'),
        ),
        Positioned(
          bottom: 0,
          left: 80,
          child: IconButton(onPressed: onEdit, icon: Icon(Icons.add_a_photo)),
        ),
      ],
    );
  }
}
