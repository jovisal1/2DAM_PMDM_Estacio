import 'package:flutter/material.dart';

class YesNoImage extends StatelessWidget {
  final bool yesNo;
  const YesNoImage({super.key, required this.yesNo});

  String getImageAsset() {
    if (yesNo) {
      return "assets/images/yes.png";
    }
    return "assets/images/no.png";
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(getImageAsset(), height: 200, fit: BoxFit.fill);
  }
}
