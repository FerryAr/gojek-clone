import 'package:flutter/material.dart';
import 'package:gojek/common/my_colors.dart';
import 'package:gojek/common/my_style.dart';

class Subtitle extends StatelessWidget {
  final String? iconPath;
  final String? iconText;
  final String subtitle;
  final String caption;
  final Widget? prefWidget;

  const Subtitle(
      {Key? key,
      this.iconPath,
      this.iconText,
      required this.subtitle,
      required this.caption,
      this.prefWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [],
          )
        ],
      ),
    );
  }
}
