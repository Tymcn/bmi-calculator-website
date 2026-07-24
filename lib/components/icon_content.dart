import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';

class IconContent extends StatelessWidget {
  const IconContent({super.key, this.icons, this.label});

  final dynamic icons;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(
          icons,
          size: 80.0,
        ),
        const SizedBox(height: 15.0),
        Text(
          label ?? '',
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
