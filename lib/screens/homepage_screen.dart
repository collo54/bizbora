import 'package:flutter/material.dart';

import '../layouts/homepage_desktop_layout.dart';
import '../layouts/homepage_mobile_layout.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

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
    return const HomePageDesktopLayout(); // const HomePageTabletLayout();
  }
}

//Builds the mobile log in layout according to its constraints
class MobileHomePageScreen extends StatelessWidget {
  const MobileHomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomePageMobileLayout();
  }
}
