import 'package:bizbora/api/api.dart';
import 'package:bizbora/api/api_service.dart';
import 'package:bizbora/constants/textstyle.dart';
import 'package:bizbora/models/address_model.dart';
import 'package:bizbora/models/create_customer_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

import '../constants/colors.dart';
import '../pages/homepage.dart';

class DiscoveryDesktopLayout extends StatefulWidget {
  const DiscoveryDesktopLayout({super.key});

  @override
  State<DiscoveryDesktopLayout> createState() => _DiscoveryDesktopLayoutState();
}

class _DiscoveryDesktopLayoutState extends State<DiscoveryDesktopLayout> {
  var uuid = Uuid();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> sendAPItest() async {
    try {
      String accesstoken =
          'EAAAEEO5ixB03FavhJ4Nz3k4oVukmqt1xstfqC8z4_knjxlnGapRoVzDX_zs6lbW';

      final api = API();
      final apitest = APIService(api);

      final AddressModel addressModel = AddressModel(
        addressLine1: '00300',
        addressLine2: 'nakuru kenya',
        locality: 'nakuru locality',
        subLocality: 'nakuru sublocality',
        subLocality2: 'nakuru sublocality 2',
        administrativeDistrict1: 'nakuru county',
        postalCode: '0100',
        country: 'KE',
      );

      final CreateCustomerRequestModel requestModel =
          CreateCustomerRequestModel(
        idempotencyKey: uuid.v1(),
        givenName: 'collins martin',
        familyName: 'menelik',
        companyName: 'new haven',
        nickName: 'marmen',
        emailAddress: 'memnelik@gmail.com',
        phoneNumber: '+254 766356976',
        referenceId: 'my id',
        note: 'flutter customer test',
        birthday: '2000-07-09',
        address: addressModel,
      );

      final response = await apitest.createandgetCustomerData(
        accessToken: accesstoken,
        customerRequestModel: requestModel,
      );
      showNoPermissionBluetoothDialog(response.toString());
    } catch (e) {
      showNoPermissionBluetoothDialog(e.toString());
    }
  }

  Future<void> showNoPermissionBluetoothDialog(String e) async =>
      showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Error '),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(e),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Acknowledge'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );

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
      height: MediaQuery.of(context).size.height + 50,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 5,
            fit: FlexFit.tight,
            child: Container(
              color: kwhite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 45,
                    ),
                    child: MaterialButton(
                      onPressed: () async {
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      },
                      child: RotatedBox(
                        quarterTurns: 2,
                        child: Image.asset("assets/images/right-arrow1.png"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 45, left: 67),
                    child: Text(
                      'Muringa console table',
                      style: GoogleFonts.inter(
                        textStyle: w600Size24Colorblack,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 67),
                    child: Row(
                      children: [
                        Text(
                          'kes 85000',
                          style: GoogleFonts.inter(
                            textStyle: w600Size20Colorblack,
                          ),
                        ),
                        const Expanded(
                          child: SizedBox(
                            width: 1,
                          ),
                        ),
                        RatingBar.builder(
                          initialRating: 4,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 20,
                          ignoreGestures: true,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (ratingvalue) {
                            debugPrint(ratingvalue.toString());
                            setState(() {});
                          },
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          '4.0 / 5.0',
                          style: GoogleFonts.inter(
                            textStyle: w600Size16Colorblack,
                          ),
                        ),
                        Text(
                          ' (17)',
                          style: GoogleFonts.inter(
                            textStyle: w600Size16Colorgreytext,
                          ),
                        ),
                        const SizedBox(
                          width: 80,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 35, left: 67),
                    child: Text(
                      'White Stain Console Table, a perfect addition to elevate your home decor. Crafted with meticulous attention to detail, this elegant piece boasts a sleek white finish that effortlessly complements any interior style. Its compact design makes it ideal for narrow spaces, while the spacious tabletop provides ample room for displaying your favorite decor items or storing everyday essentials. The sturdy construction ensures durability, while the stain-resistant surface allows for easy maintenance.',
                      style: GoogleFonts.inter(
                        textStyle: w600Size16Colorblack08Spacing20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50, left: 140),
                    child: Row(
                      children: [
                        Container(
                          height: 45,
                          width: 150,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: kblack03,
                            ),
                            shape: BoxShape.rectangle,
                            color: kwhite,
                          ),
                          child: Row(
                            children: [
                              Material(
                                color: kwhite, // Button color
                                child: InkWell(
                                  onTap: () {},
                                  child: SizedBox(
                                    width: 50,
                                    height: 45,
                                    child: Center(
                                      child: Text(
                                        '-',
                                        style: GoogleFonts.inter(
                                          textStyle: w600Size24Colorblack,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 50,
                                height: 45,
                                child: Center(
                                  child: Text(
                                    '1',
                                    style: GoogleFonts.inter(
                                      textStyle: w600Size20Colorblack,
                                    ),
                                  ),
                                ),
                              ),
                              Material(
                                color: kwhite, // Button color
                                child: InkWell(
                                  onTap: () {},
                                  child: SizedBox(
                                    width: 45,
                                    height: 45,
                                    child: Center(
                                      child: Text(
                                        '+',
                                        style: GoogleFonts.inter(
                                          textStyle: w600Size20Colorblack,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Material(
                            color: kblack08, // Button color
                            child: InkWell(
                              onTap: () async {
                                await sendAPItest();
                              },
                              child: SizedBox(
                                width: 150,
                                height: 45,
                                child: Center(
                                  child: Text(
                                    'Add to cart',
                                    style: GoogleFonts.inter(
                                      textStyle: w500Size16Colorwhite,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Made by',
                        style: GoogleFonts.inter(
                          textStyle: w600Size16Colorblack08Spacing20,
                        ),
                      ),
                      Text(
                        ' Jerry Nangulu ',
                        style: GoogleFonts.inter(
                          textStyle: w600Size16Colorblue08Spacing20,
                        ),
                      ),
                      SizedBox(width: 130)
                    ],
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 4,
            fit: FlexFit.tight,
            child: Container(
              color: kwhite,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, right: 60),
                    child: Row(
                      children: [
                        const Expanded(
                          child: SizedBox(
                            width: 1,
                          ),
                        ),
                        Text(
                          '01',
                          style: GoogleFonts.inter(
                            textStyle: w700Size20Colorblack,
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          '/ 04',
                          style: GoogleFonts.inter(
                            textStyle: w600Size16Colorgreytext,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, right: 10),
                    child: Row(
                      children: [
                        const Expanded(
                          child: SizedBox(
                            width: 1,
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {},
                          child: RotatedBox(
                            quarterTurns: 2,
                            child: Image.asset("assets/images/next1.png"),
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {},
                          child: Image.asset("assets/images/next1.png"),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 50),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/images/Screenshot2-1.png",
                        height: 340,
                        width: 270,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          "assets/images/Screenshot2-1.png",
                          height: 100,
                          width: 100,
                        ),
                        Image.asset(
                          "assets/images/Screenshot2-2.png",
                          height: 100,
                          width: 100,
                        ),
                        Image.asset(
                          "assets/images/Screenshot2-3.png",
                          height: 100,
                          width: 100,
                        ),
                        Image.asset(
                          "assets/images/Screenshot2-4.png",
                          height: 100,
                          width: 100,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
