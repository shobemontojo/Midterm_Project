import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:midterm_project/core/constants.dart';

class NoteFab extends StatelessWidget {
  const NoteFab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.large(
      onPressed: () {},
      backgroundColor: primary,
      foregroundColor: white,
      child: FaIcon(FontAwesomeIcons.plus),
    );
  }
}
