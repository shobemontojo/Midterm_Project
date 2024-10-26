import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:midterm_project/core/constants.dart';
import 'package:midterm_project/pages/new_or_edit_note_page.dart';
import 'package:midterm_project/widgets/note_fab.dart';
import 'package:midterm_project/widgets/note_grid.dart';
import 'package:midterm_project/widgets/note_icon_button.dart';
import 'package:midterm_project/widgets/note_icon_button_outlined.dart';
import 'package:midterm_project/widgets/note_list.dart';
import 'package:midterm_project/widgets/search_field.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<String> dropdownOptions = ['Date modified', 'Date created'];

  late String dropdownValue = dropdownOptions.first;

  bool isDescending = true;
  bool isGrid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Memorery',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        actions: [
          NoteIconButtonOutlined(
            icon: FontAwesomeIcons.rightFromBracket,
            onPressed: () {},
          ),
        ], //icon button
      ), //AppBar
      floatingActionButton: NoteFab(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewOrEditNotePage(
                isNewNote: true,
              ),
            ),
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SearchField(), //serachfield na file
            Row(
              children: [
                NoteIconButton(
                    icon: isDescending
                        ? FontAwesomeIcons.arrowDown //either up or down
                        : FontAwesomeIcons.arrowUp,
                    onPressed: () {
                      setState(() {
                        //movement sa arrow button
                        isDescending =
                            !isDescending; //pag naka up ang arrow mahimong down and vice versa
                      });
                    }),

                SizedBox(width: 16),
                DropdownButton(
                    value: dropdownValue,
                    underline: SizedBox.shrink(),
                    borderRadius: BorderRadius.circular(16),
                    items: dropdownOptions
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    }),
                Spacer(), //THREE BARS BUTTON
                NoteIconButton(
                  icon: isGrid
                      ? FontAwesomeIcons.tableCellsLarge
                      : FontAwesomeIcons.bars,
                  size: 18,
                  onPressed: () {
                    setState(() {
                      isGrid = !isGrid;
                    });
                  },
                ),
              ],
            ),
            Expanded(
              child: isGrid ? NotesGrid() : NotesList(),
            ),
          ],
        ),
      ),
    );
  }
}
