/// Written by Juan Pablo Gutiérrez
///
/// 12 05 2024

import 'package:OpenXilogGo/constants.dart';
import 'package:OpenXilogGo/widgets/back_icon.dart';
import 'package:flutter/material.dart';

class BackBar extends StatelessWidget {
  final String serialNumber;
  const BackBar({super.key, required this.serialNumber});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const BackIcon(),
        Text(serialNumber, style: smallerDefaultStyle,),
      ],
    );
  }
}
