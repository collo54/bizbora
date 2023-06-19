import 'package:bizbora/layouts/discovery_desktop_layout.dart';
import 'package:bizbora/layouts/discovery_mobile_layout.dart';
import 'package:flutter/material.dart';

class DiscoveryScreen extends StatelessWidget {
  const DiscoveryScreen({Key? key}) : super(key: key);

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
    return const DiscoveryDesktopLayout();
  }
}

//Builds the mobile log in layout according to its constraints
class MobileHomePageScreen extends StatelessWidget {
  const MobileHomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DiscoveryMobileLayout();
  }
}
