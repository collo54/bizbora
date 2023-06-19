import 'package:flutter/material.dart';

import '../layouts/addcart_desktop_layout.dart';
import '../layouts/addcart_mobile_layout.dart';

class AddCartScreen extends StatelessWidget {
  const AddCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      key: UniqueKey(),
      builder: (context, constraints) {
        if (constraints.maxWidth > 1285) {
          return const TabletHomePageScreen();
        } else {
          return const MobileHomePageScreen();
        }
      },
    );
  }
}

//Builds the tablet log in layout according to its constraints
class TabletHomePageScreen extends StatelessWidget {
  const TabletHomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AddCartDesktopLayout();
  }
}

//Builds the mobile log in layout according to its constraints
class MobileHomePageScreen extends StatelessWidget {
  const MobileHomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AddCartMobileLayout();
  }
}
