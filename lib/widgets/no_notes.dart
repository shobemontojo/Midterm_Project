import 'package:flutter/material.dart';

class NoNotes extends StatelessWidget {
  const NoNotes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Image.asset(
            'assets/images/empty.png',
            width: MediaQuery.sizeOf(context).width * 0.90,
          ),
          SizedBox(height: 32),
          Text(
            'You have no notes yet!\nStart creating by clicking the + button below!',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
