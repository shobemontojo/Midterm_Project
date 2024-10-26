import 'package:flutter/material.dart';
import 'package:midterm_project/widgets/note_card.dart';

class NotesList extends StatefulWidget {
  const NotesList({super.key});

  @override
  State<NotesList> createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 15,
      itemBuilder: (context, index) {
        return NoteCard(
          isInGrid: false,
        );
      },
      separatorBuilder: (context, index) => SizedBox(
        height: 8,
      ),
    );
  }
}
