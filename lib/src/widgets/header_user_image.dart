import 'package:flutter/material.dart';

class HeaderUserImage extends StatelessWidget {
  const HeaderUserImage({super.key, required this.imageUrl, required this.support});

  final String imageUrl;
  final bool support;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(10.0),
    child: Stack(
      children: [Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                imageUrl,
              ),
            ),
          ),
          width: 50,
        ),

        Positioned(
          left: 12,
          bottom: 0,
          child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                support ? 'assets/images/thumb-up.png' : 'assets/images/thumb-down.png',
              ),
            ),
          ),
          width: 26,
          height: 26,
        ),),

      ],
    ),
  );
}
