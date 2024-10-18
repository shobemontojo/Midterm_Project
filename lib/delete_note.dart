import 'package:flutter/material.dart';
import 'package:midterm_project/login_page.dart';

class DeleteNote extends StatefulWidget {
  const DeleteNote({super.key});

  @override
  State<DeleteNote> createState() => _DeleteNoteState();
}

class _DeleteNoteState extends State<DeleteNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: const Text('go to login')),
      ),
    );
  }
}
