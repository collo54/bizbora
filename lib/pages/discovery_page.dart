import 'package:bizbora/constants/colors.dart';
import 'package:bizbora/constants/textstyle.dart';
import 'package:bizbora/screens/addcart_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DiscoveryPage extends StatelessWidget {
  const DiscoveryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MediaQuery.of(context).size.width > 1285
          ? _desktopAppBar(context)
          : _mobileAppBar(context),
      backgroundColor: kwhite,
      body: const ScrollConfiguration(
        behavior: ScrollBehavior(),
        child: SingleChildScrollView(
          child: AddCartScreen(),
        ),
      ),
    );
  }

  Widget _buildButtonCart() {
    return MaterialButton(
      minWidth: 282,
      height: 54,
      color: kblack08,
      onPressed: () {},
      child: Text(
        'Add to cart',
        style: GoogleFonts.inter(textStyle: w600Size16Colorwhite),
      ),
    );
  }

  AppBar _desktopAppBar(BuildContext context) {
    return AppBar(
      centerTitle: false,
      surfaceTintColor: Colors.transparent,
      toolbarHeight: 90,
      backgroundColor: kwhite,
      leadingWidth: 200,
      leading: Padding(
        padding: const EdgeInsets.only(left: 50, bottom: 48),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Biz',
              style: GoogleFonts.inter(
                textStyle: const TextStyle(
                  color: korange,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Text(
              'Bora',
              style: GoogleFonts.inter(
                textStyle: const TextStyle(
                  color: kblack08,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(bottom: 48, left: 40),
        child: Container(
          height: 30,
          width: 250,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
            shape: BoxShape.rectangle,
            color: kwhitedark,
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 19, right: 25),
                  child: Image.asset(
                    'assets/images/magnifiying-glass.png',
                    width: 14,
                    height: 14,
                  ),
                ),
                Text(
                  'search',
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      color: kblack05,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Expanded(
                  child: SizedBox(
                    width: 1,
                    height: 1,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(bottom: 48),
          child: GestureDetector(
            onTap: () {
              debugPrint('icon for cart');
            },
            child: Image.asset(
              'assets/images/bag.png',
              width: 16,
              height: 16,
            ),
          ),
        ),
        const SizedBox(
          width: 21,
          height: 0,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 48),
          child: GestureDetector(
            onTap: () {
              debugPrint('icon for notification');
            },
            child: Image.asset(
              'assets/images/notification.png',
              width: 16,
              height: 16,
            ),
          ),
        ),
        const SizedBox(
          width: 25,
          height: 0,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 48),
          child: GestureDetector(
            onTap: () {
              debugPrint('icon for avator');
            },
            child: CircleAvatar(
              minRadius: 16,
              maxRadius: 16,
              backgroundColor: klightblue,
              child: Text(
                'C',
                style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                    color: kwhite,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 50,
          height: 0,
        ),
      ],
      flexibleSpace: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Container(
          height: 33,
          width: MediaQuery.of(context).size.width,
          color: kwhitedark,
        ),
      ),
    );
  }

  AppBar _mobileAppBar(BuildContext context) {
    return AppBar(
      centerTitle: false,
      surfaceTintColor: Colors.transparent,
      toolbarHeight: 70,
      backgroundColor: kwhite,
      leadingWidth: 150,
      leading: Padding(
        padding: const EdgeInsets.only(
          left: 25,
          bottom: 20,
          top: 10,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Biz',
              style: GoogleFonts.inter(
                textStyle: const TextStyle(
                  color: korange,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Text(
              'Bora',
              style: GoogleFonts.inter(
                textStyle: const TextStyle(
                  color: kblack08,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: 20,
            right: 25,
            top: 9,
          ),
          child: Material(
            color: kwhite,
            child: InkWell(
              onTap: () {
                debugPrint('icon for menu');
              },
              child: SizedBox(
                width: 40,
                height: 40,
                child: Image.asset(
                  'assets/images/hamburger.png',
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ),
        ),
      ],
      flexibleSpace: const Padding(
        padding: EdgeInsets.only(top: 49),
        child: Divider(
          height: 1,
          color: kwhite,
        ),
      ),
    );
  }
}
