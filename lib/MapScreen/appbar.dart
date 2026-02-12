import 'package:flutter/material.dart';

class WaveAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WaveAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(140);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: preferredSize.height,
      child: Stack(
        children: [
          // الخلفية الزرقاء مع النص
          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              height: preferredSize.height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF0A2A43), Color(0xFF0F4C75)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              alignment: Alignment.center,
              child: const Text(
                "SkyGuard",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 30);

    path.quadraticBezierTo(
      size.width / 4,
      size.height,
      size.width / 2,
      size.height - 30,
    );

    path.quadraticBezierTo(
      3 * size.width / 4,
      size.height - 60,
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