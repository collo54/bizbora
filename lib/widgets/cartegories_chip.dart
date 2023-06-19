import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartegoriesChip extends StatelessWidget {
  const CartegoriesChip({
    Key? key,
    required this.cartegoryname,
    required this.backgroundcolor,
    required this.textstyle,
    required this.button,
  }) : super(key: key);
  final String cartegoryname;
  final Color backgroundcolor;
  final TextStyle textstyle;
  final VoidCallback button;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 15,
      ),
      child: InkWell(
        onTap: button,
        child: Chip(
          backgroundColor: backgroundcolor,
          side: BorderSide.none,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
          label: Text(
            cartegoryname,
            style: GoogleFonts.inter(textStyle: textstyle),
          ),
        ),
      ),
    );
  }
}
