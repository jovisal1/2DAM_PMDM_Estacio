import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class YesNoSelector extends StatelessWidget {
  final bool yesNo;
  const YesNoSelector({super.key, required this.yesNo});

  String getTextContainer() {
    if (yesNo) {
      return "Sí";
    }
    return "No";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (yesNo) {
          context.push("/yes_no/yes");
        } else {
          context.push("/yes_no/no");
        }
      },
      child: Container(
          color: yesNo ? Colors.blue : Colors.red,
          width: 300,
          height: 100,
          child: Center(
              child: Text(
            getTextContainer(),
            textDirection: TextDirection.ltr,
            style: const TextStyle(
                fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
          ))),
    );
  }
}
