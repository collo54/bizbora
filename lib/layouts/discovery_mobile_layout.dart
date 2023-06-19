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

class DiscoveryMobileLayout extends StatefulWidget {
  const DiscoveryMobileLayout({super.key});

  @override
  State<DiscoveryMobileLayout> createState() => _DiscoveryMobileLayoutState();
}

class _DiscoveryMobileLayoutState extends State<DiscoveryMobileLayout> {
  Uuid uuid = const Uuid();

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
    return LayoutBuilder(
      builder: (context, constraints) {
        final widthMobile = constraints.biggest.width;
        const paddingSmall = 25.0;
        const paddingLarge = 34.0;
        const widthCutOff = 360.0;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: widthMobile < widthCutOff ? paddingSmall : paddingLarge,
              ),
              child: Text(
                'Muringa console table',
                style: GoogleFonts.inter(
                  textStyle: w600Size20Colorblack,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: widthMobile,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: widthMobile < widthCutOff
                          ? paddingSmall
                          : paddingLarge,
                    ),
                    child: Text(
                      'kes 85000',
                      style: GoogleFonts.inter(
                        textStyle: w500Size16Colorblack,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: widthMobile < widthCutOff ? 10 : 20,
                  ),
                  RatingBar.builder(
                    initialRating: 4,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 12,
                    ignoreGestures: true,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 5.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (ratingvalue) {
                      debugPrint(ratingvalue.toString());
                      setState(() {});
                    },
                  ),
                  SizedBox(
                    width: widthMobile < widthCutOff ? 5 : 10,
                  ),
                  Text(
                    '4.0 / 5.0',
                    style: GoogleFonts.inter(
                      textStyle: w600Size12Colorblack,
                    ),
                  ),
                  Text(
                    ' (17)',
                    style: GoogleFonts.inter(
                      textStyle: w600Size12Colorgreytext,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal:
                    widthMobile < widthCutOff ? paddingSmall : paddingLarge,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/Screenshot2-1.png',
                  height: 233,
                  width: 292,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: widthMobile,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal:
                      widthMobile < widthCutOff ? paddingSmall : paddingLarge,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: kblack08,
                        ),
                      ),
                      child: Image.asset(
                        'assets/images/Screenshot2-1.png',
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Image.asset(
                      'assets/images/Screenshot2-2.png',
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/Screenshot2-3.png',
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/Screenshot2-4.png',
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal:
                    widthMobile < widthCutOff ? paddingSmall : paddingLarge,
              ),
              child: Text(
                'White Stain Console Table, a perfect addition to elevate your home decor. Crafted with meticulous attention to detail, this elegant piece boasts a sleek white finish that effortlessly complements any interior style. Its compact design makes it ideal for narrow spaces, while the spacious tabletop provides ample room for displaying your favorite decor items or storing everyday essentials. The sturdy construction ensures durability, while the stain-resistant surface allows for easy maintenance.',
                style: GoogleFonts.inter(
                  textStyle: w600Size12Colorblack08Spacing20,
                ),
              ),
            ),
            const SizedBox(
              height: 105,
            ),
          ],
        );
      },
    );
  }
}
