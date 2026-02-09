import 'package:flutter/material.dart';

import '../core/resources/reusable/assetsManager.dart';

class WaveAppBar extends StatelessWidget {
  const WaveAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: Stack(
          children: [
            ClipPath(
              clipper: WaveClipper(),
              child: Container(
                height: 160,
                color: const Color(0xFF007ba7),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
              child: Row(
                children: [
                  ClipOval(
                    child: Image.asset(
                      assetsManager.logo,
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'SkyGuard',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  // Elevated Notification Icon
                  Material(
                    color: Colors.transparent,
                    shape: CircleBorder(),
                    child: IconButton(
                      icon: Icon(
                        Icons.notifications,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {},
                      splashRadius: 25,
                    ),
                  ),
                  SizedBox(width: 10),
                  // Elevated Recycle Icon
                  Material(
                    color: Colors.transparent,

                    shape: CircleBorder(),
                    child: IconButton(
                      icon: Image.asset(
                        assetsManager.recycle,
                        color: Colors.white,
                        width: 30,
                        height: 30,
                      ),
                      onPressed: () {},
                      splashRadius: 25,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 30);

    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 30,
    );

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
