import 'package:bizbora/constants/textstyle.dart';
import 'package:bizbora/widgets/cartegories_chip.dart';
import 'package:bizbora/widgets/image_card_mobile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';
import '../pages/addcart_page.dart';

class HomePageMobileLayout extends StatefulWidget {
  const HomePageMobileLayout({super.key});

  @override
  State<HomePageMobileLayout> createState() => _HomePageMobileLayoutState();
}

class _HomePageMobileLayoutState extends State<HomePageMobileLayout> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _buildButtons() {
    return Align(
      alignment: Alignment.center,
      child: MaterialButton(
        minWidth: 146,
        height: 40,
        color: kblack,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        onPressed: () {},
        child: Text(
          'Apply',
          style: GoogleFonts.inter(
            textStyle: const TextStyle(
              color: kwhite,
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButtonOutlined() {
    return Align(
      alignment: Alignment.center,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(204, 40),
          backgroundColor: kwhitegreyish,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(7),
            ),
          ),
          side: const BorderSide(width: 1, color: kblack03),
        ),
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pop();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 15.0),
          child: Text(
            'cancel',
            style: GoogleFonts.inter(
              textStyle: w400Size12Colorblack05,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final widthMobile = constraints.biggest.width;
        final heightTest = MediaQuery.of(context).size.height - 190;
        //   debugPrint(heightTest.toString());
        return Column(
          children: [
            SizedBox(
              width: widthMobile,
              height: 30,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 25,
                  right: 25,
                ),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CartegoriesChip(
                      button: () {},
                      cartegoryname: 'All',
                      backgroundcolor: kwhitedark,
                      textstyle: w600Size12Colorkgreychiptext,
                    ),
                    CartegoriesChip(
                      button: () {},
                      cartegoryname: 'Furniture',
                      backgroundcolor: kblackish,
                      textstyle: w600Size12Colorwhite,
                    ),
                    CartegoriesChip(
                      button: () {},
                      cartegoryname: 'Pastry',
                      backgroundcolor: kwhitedark,
                      textstyle: w600Size12Colorkgreychiptext,
                    ),
                    CartegoriesChip(
                      button: () {},
                      cartegoryname: 'Clothes',
                      backgroundcolor: kwhitedark,
                      textstyle: w600Size12Colorkgreychiptext,
                    ),
                    CartegoriesChip(
                      button: () {},
                      cartegoryname: 'Shoes',
                      backgroundcolor: kwhitedark,
                      textstyle: w600Size12Colorkgreychiptext,
                    ),
                    CartegoriesChip(
                      button: () {},
                      cartegoryname: 'Software',
                      backgroundcolor: kwhitedark,
                      textstyle: w600Size12Colorkgreychiptext,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: widthMobile,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: Row(
                  children: [
                    Text(
                      'Furniture',
                      style: GoogleFonts.inter(
                        textStyle: w400Size16Colorblack08,
                      ),
                    ),
                    const SizedBox(
                      width: 28,
                    ),
                    Container(
                      width: 26,
                      height: 26,
                      decoration: const BoxDecoration(
                        color: kgreyishbutton,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '15',
                          style: GoogleFonts.inter(
                            textStyle: w500Size12Colorblack06,
                          ),
                        ),
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(
                        width: 1,
                      ),
                    ),
                    Material(
                      color: kwhite,
                      elevation: 4,
                      child: InkWell(
                        onTap: () {},
                        child: SizedBox(
                          width: 30,
                          height: 30,
                          child: Center(
                            child: Image.asset(
                              'assets/images/magnifiying-glass.png',
                              width: 16,
                              height: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Material(
                      color: kwhite,
                      elevation: 4,
                      child: InkWell(
                        onTap: () {},
                        child: SizedBox(
                          width: 30,
                          height: 30,
                          child: Center(
                            child: Image.asset(
                              'assets/images/filter.png',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: heightTest,
              width: widthMobile,
              child: Padding(
                padding: const EdgeInsets.only(left: 27),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  children: [
                    ImageCardMobile(
                      button: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddCartPage(),
                          ),
                        );
                      },
                    ),
                    ImageCardMobile(
                      button: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddCartPage(),
                          ),
                        );
                      },
                    ),
                    ImageCardMobile(
                      button: () {},
                    ),
                    ImageCardMobile(
                      button: () {},
                    ),
                    ImageCardMobile(
                      button: () {},
                    ),
                    ImageCardMobile(
                      button: () {},
                    ),
                    ImageCardMobile(
                      button: () {},
                    ),
                    ImageCardMobile(
                      button: () {},
                    ),
                    ImageCardMobile(
                      button: () {},
                    ),
                    ImageCardMobile(
                      button: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
