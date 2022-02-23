import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/base/dependencyinjection/locator.dart';
import 'package:flutter_boilerplate/src/base/extensions/context_extension.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/color_constant.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/navigation_route_constants.dart';
import 'package:flutter_boilerplate/src/base/utils/navigation_utils.dart';
import 'package:flutter_boilerplate/src/widgets/primary_button.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import '../../../base/extensions/scaffold_extension.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipPath(
            clipBehavior: Clip.antiAlias,
            clipper: WaveClipperTwo(flip: true),
            child: Container(
              color: primaryColor,
              height: context.getHeight(0.3),
              width: context.getWidth(1),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0),
                child: FlutterLogo(
                  size: 90,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 100 + context.getTopSafeArea(),
          ),
          _getLoginButton(),
          SizedBox(
            height: 100 + context.getTopSafeArea(),
          ),
          ClipPath(
            clipper: WaveClipperTwo(reverse: true),
            child: Container(
              color: primaryColor,
              height: 150 + context.getBottomSafeAre(0.2),
              width: context.getWidth(1),
            ),
          ),
        ],
      ),
    ).authContainerScaffold(context: context);
  }

  Widget _getLoginButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38.0),
      child: PrimaryButton(
        onButtonClick: () {
          locator<NavigationUtils>().push(routeHome);
        },
        buttonText: "Connect Wallet",
        buttonColor: primaryColor,
      ),
    );
  }
}
