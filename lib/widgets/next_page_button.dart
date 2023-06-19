import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextPageButton extends StatelessWidget {
  const NextPageButton(
      {Key? key,
      required this.button,
      required this.page,
      required this.color,
      required this.style})
      : super(key: key);
  final VoidCallback button;
  final String page;
  final Color color;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Material(
        color: color, //button color
        borderRadius: const BorderRadius.all(
          Radius.circular(7),
        ),
        child: InkWell(
          onTap: button,
          child: SizedBox(
            width: 34,
            height: 32,
            child: Center(
              child: Text(
                page,
                style: GoogleFonts.inter(
                  textStyle: style,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
