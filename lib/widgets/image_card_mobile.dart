import 'package:bizbora/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/textstyle.dart';

class ImageCardMobile extends StatelessWidget {
  const ImageCardMobile({
    Key? key,
    required this.button,
  }) : super(key: key);
  final VoidCallback button;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        fit: StackFit.loose,
        clipBehavior: Clip.none,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: InkWell(
              onTap: button,
              child: Image.asset(
                'assets/images/Screenshot2-1.png',
                height: 148,
                width: 141,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 81),
            child: Container(
              height: 67,
              width: 141,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
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
                      height: 15,
                    ),
                    Text(
                      'Muringa console table',
                      style: GoogleFonts.inter(
                        textStyle: w500Size11Colorwhite,
                      ),
                    ),
                    Text(
                      'kes 85000',
                      style: GoogleFonts.inter(
                        textStyle: w500Size11Colorwhite,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 130, left: 58),
            child: ClipOval(
              child: Material(
                color: kmaroon, // Button color
                child: InkWell(
                  onTap: () {},
                  child: const SizedBox(
                    width: 35,
                    height: 35,
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
      ),
    );
  }
}
