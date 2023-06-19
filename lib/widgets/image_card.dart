import 'package:bizbora/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/textstyle.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    Key? key,
    required this.button,
  }) : super(key: key);
  final VoidCallback button;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: InkWell(
            onTap: button,
            child: Image.asset(
              'assets/images/Screenshot2-1.png',
              height: 230,
              width: 190,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 130),
          child: Container(
            height: 100,
            width: 190,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  kblack,
                  kgrey00,
                ],
              ),
              shape: BoxShape.rectangle,
              color: kwhite,
            ),
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Muringa console table',
                    style: GoogleFonts.inter(
                      textStyle: w500Size12Colorwhite,
                    ),
                  ),
                  Text(
                    'kes 85000',
                    style: GoogleFonts.inter(
                      textStyle: w500Size12Colorwhite,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 207,
          left: 78,
          child: ClipOval(
            child: Material(
              color: kmaroon, // Button color
              child: InkWell(
                onTap: () {},
                child: const SizedBox(
                  width: 40,
                  height: 40,
                  child: Icon(
                    Icons.add,
                    color: kwhite,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
