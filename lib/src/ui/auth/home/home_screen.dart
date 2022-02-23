import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/base/extensions/context_extension.dart';
import 'package:flutter_boilerplate/src/base/extensions/scaffold_extension.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/image_constant.dart';
import 'package:flutter_boilerplate/src/widgets/metamask.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:provider/provider.dart';

import '../../../base/utils/constants/color_constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MetaMaskProvider()..init(),
      builder: (context, child) {
        return Column(
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
            Center(
              child: Consumer<MetaMaskProvider>(
                builder: (context, provider, child) {
                  late final String text;
                  if (provider.isConnected && provider.isInOperatingChain) {
                    text = 'Connected';
                  } else if (provider.isConnected &&
                      !provider.isInOperatingChain) {
                    text =
                        'Wrong chain. Please connect to ${MetaMaskProvider.operatingChain}';
                  } else if (provider.isEnabled) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Click the button to Connect Wallet'),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () =>
                              context.read<MetaMaskProvider>().connect(),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            padding: const EdgeInsets.all(0),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.network(
                                buttonImage,
                                width: 300,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else {
                    text = 'Please use a Web3 supported browser.';
                  }
                  return ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [Colors.purple, Colors.blue, Colors.red],
                    ).createShader(bounds),
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  );
                },
              ),
            ),
            Positioned.fill(
              child: IgnorePointer(
                child: Image.network(
                  elsebutton,
                  fit: BoxFit.cover,
                  opacity: const AlwaysStoppedAnimation(0.025),
                ),
              ),
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
        ).authContainerScaffold(context: context);
      },
    );
  }
}
