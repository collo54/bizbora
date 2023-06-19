import 'package:bizbora/constants/textstyle.dart';
import 'package:bizbora/widgets/image_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';
import '../pages/addcart_page.dart';

class HomePageDesktopLayout extends StatefulWidget {
  const HomePageDesktopLayout({super.key});

  @override
  State<HomePageDesktopLayout> createState() => _HomePageDesktopLayoutState();
}

class _HomePageDesktopLayoutState extends State<HomePageDesktopLayout> {
  double _price = 40000;
  double _rating = 4.5;

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
    return SizedBox(
      height: MediaQuery.of(context).size.height - 50,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(left: 40),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 40,
                  left: 40,
                  bottom: 30,
                ),
                child: Container(
                  width: 230,
                  height: 600,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    shape: BoxShape.rectangle,
                    color: kwhite,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          'Cartegories',
                          style: GoogleFonts.inter(
                            textStyle: w600Size16Colorblack08,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 15, left: 29, right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Furniture',
                              style: GoogleFonts.inter(
                                textStyle: w500Size13Colorblack06,
                              ),
                            ),
                            Text(
                              '15',
                              style: GoogleFonts.inter(
                                textStyle: w500Size13Colorblack06,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 15, left: 29, right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'pastry',
                              style: GoogleFonts.inter(
                                textStyle: w500Size13Colorblack06,
                              ),
                            ),
                            Text(
                              '0',
                              style: GoogleFonts.inter(
                                textStyle: w500Size13Colorblack06,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 15, left: 29, right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Clothes',
                              style: GoogleFonts.inter(
                                textStyle: w500Size13Colorblack06,
                              ),
                            ),
                            Text(
                              '0',
                              style: GoogleFonts.inter(
                                textStyle: w500Size13Colorblack06,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 15, left: 29, right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Spices',
                              style: GoogleFonts.inter(
                                textStyle: w500Size13Colorblack06,
                              ),
                            ),
                            Text(
                              '0',
                              style: GoogleFonts.inter(
                                textStyle: w500Size13Colorblack06,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          width: 230,
                          height: 1,
                          color: kgrey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 5),
                        child: Text(
                          'Price',
                          style: GoogleFonts.inter(
                            textStyle: w600Size16Colorblack08,
                          ),
                        ),
                      ),
                      Slider(
                        divisions: 8,
                        min: 0,
                        max: 200000,
                        value: _price,
                        activeColor: kblackgrey,
                        onChanged: (value) {
                          setState(() {
                            _price = value;
                          });
                        },
                        onChangeStart: (value) {},
                        onChangeEnd: (value) {},
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 0,
                          left: 25,
                          right: 25,
                          bottom: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'kes ${_price.toStringAsFixed(0)}',
                              style: GoogleFonts.inter(
                                textStyle: w600Size12Colorblack08,
                              ),
                            ),
                            Text(
                              'kes 200000',
                              style: GoogleFonts.inter(
                                textStyle: w600Size12Colorblack08,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Container(
                          width: 230,
                          height: 1,
                          color: kgrey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10, top: 20),
                        child: Text(
                          'Rating',
                          style: GoogleFonts.inter(
                            textStyle: w600Size16Colorblack08,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          RatingBar.builder(
                            initialRating: _rating,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 20,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (ratingvalue) {
                              debugPrint(ratingvalue.toString());
                              setState(() {
                                _rating = ratingvalue;
                              });
                            },
                          ),
                          Text(
                            '${_rating.toString()} / 5.0',
                            style: GoogleFonts.inter(
                              textStyle: w600Size13Colorblack08,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20, top: 42),
                        child: _buildButtons(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(top: 40, right: 50, left: 120),
                child: GridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 0,
                  children: [
                    ImageCard(
                      button: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddCartPage(),
                          ),
                        );
                      },
                    ),
                    ImageCard(
                      button: () {},
                    ),
                    ImageCard(
                      button: () {},
                    ),
                    ImageCard(
                      button: () {},
                    ),
                    ImageCard(
                      button: () {},
                    ),
                    ImageCard(
                      button: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
