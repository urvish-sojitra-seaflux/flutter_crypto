import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/base/dependencyinjection/locator.dart';
import 'package:flutter_boilerplate/src/base/extensions/context_extension.dart';
import 'package:flutter_boilerplate/src/base/extensions/scaffold_extension.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/color_constant.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/navigation_route_constants.dart';
import 'package:flutter_boilerplate/src/base/utils/navigation_utils.dart';
import 'package:flutter_boilerplate/src/widgets/primary_button.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipPath(
          clipBehavior: Clip.antiAlias,
          clipper: WaveClipperTwo(flip: true),
          child: Container(
            color: primaryColor,
            height: context.getHeight(0.2),
            width: context.getWidth(1),
          ),
        ),
        SizedBox(
          height: 80 + context.getTopSafeArea(),
        ),
        // _getLoginButton(),
        const SizedBox(
          height: 15,
        ),
        // _getAddUPI(),
        SizedBox(
          height: 100 + context.getTopSafeArea(),
        ),
        ClipPath(
          clipper: WaveClipperTwo(reverse: true),
          child: Container(
            color: primaryColor,
            height: 120 + context.getBottomSafeAre(0.2),
            width: context.getWidth(1),
          ),
        ),
      ],
    ).authContainerScaffold(context: context);
  }

  // Widget _getLoginButton() {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 38.0),
  //     child: PrimaryButton(
  //       onButtonClick: () {
  //         locator<NavigationUtils>().push(routeWallet);
  //       },
  //       buttonText: "Add Wallet",
  //       buttonColor: primaryColor,
  //     ),
  //   );
  // }

  // Widget _getAddUPI() {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 38.0),
  //     child: PrimaryButton(
  //       onButtonClick: () {
  //         locator<NavigationUtils>().push(routeWallet);
  //       },
  //       buttonText: "Add UPI",
  //       buttonColor: primaryColor,
  //     ),
  //   );
  // }
}
