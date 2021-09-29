
import 'package:flutter/material.dart';
import 'package:gsi_wishes/presentation/core/resources/index.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: maAppColor,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }
}
