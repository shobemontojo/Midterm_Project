import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:midterm_project/change_notifiers/new_note_controller.dart';
import 'package:midterm_project/core/constants.dart';
import 'package:midterm_project/widgets/note_icon_button.dart';
import 'package:midterm_project/widgets/note_icon_button_outlined.dart';
import 'package:provider/provider.dart';

class NewOrEditNotePage extends StatefulWidget {
  const NewOrEditNotePage({required this.isNewNote, super.key});

  final bool isNewNote;

  @override
  State<NewOrEditNotePage> createState() => _NewOrEditNotePageState();
}

class _NewOrEditNotePageState extends State<NewOrEditNotePage> {
  late final NewNoteController newNoteController;
  late final QuillController quillController;
  late final FocusNode focusNode;

  @override
  void initState() {
    super.initState();

    newNoteController = context.read<NewNoteController>();

    quillController = QuillController.basic();

    focusNode = FocusNode();

    if (widget.isNewNote) {
      focusNode.requestFocus();
      newNoteController.readOnly = false;
    } else {
      newNoteController.readOnly = true;
    }
  }

  @override
  void dispose() {
    quillController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: NoteIconButtonOutlined(
            icon: FontAwesomeIcons.chevronLeft,
            onPressed: () {},
          ),
        ),
        title: Text(
          widget.isNewNote ? 'New Note' : 'Edit Note',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        actions: [
          Selector<NewNoteController, bool>(
            selector: (context, newNoteController) =>
                newNoteController.readOnly,
            builder: (context, readOnly, child) => NoteIconButtonOutlined(
              icon: readOnly ? FontAwesomeIcons.pen : FontAwesomeIcons.bookOpen,
              onPressed: () {
                newNoteController.readOnly = !readOnly;

                if (readOnly) {
                  focusNode.unfocus();
                } else {
                  focusNode.requestFocus();
                }
              },
            ),
          ),
          NoteIconButtonOutlined(
            icon: FontAwesomeIcons.check,
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Selector<NewNoteController, bool>(
              selector: (context, controller) => controller.readOnly,
              builder: (context, readOnly, child) => TextField(
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  hintText: 'Title here',
                  hintStyle: TextStyle(
                    color: gray300,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            if (!widget.isNewNote) ...[
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      'Last Modified',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: gray500,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Text(
                      '07 March 2024, 03:40 PM',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      'Created',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: gray500,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Text(
                      '07 March 2024, 03:30 PM',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      Text(
                        ' Tags  ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: gray500,
                        ),
                      ),
                      NoteIconButton(
                        icon: FontAwesomeIcons.circlePlus,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => Center(
                              child: Material(
                                type: MaterialType.transparency,
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.75,
                                  padding: const EdgeInsets.all(24.0),
                                  decoration: BoxDecoration(
                                    color: white,
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0, 0),
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        'Add tag',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(
                                        height: 24,
                                      ),
                                      TextField(
                                        decoration: InputDecoration(
                                          hintText: 'Add tag (< 16 characters)',
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            borderSide:
                                                BorderSide(color: primary),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 24,
                                      ),
                                      DecoratedBox(
                                        decoration: BoxDecoration(),
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text('Add tag'),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: primary,
                                            foregroundColor: white,
                                            side: BorderSide(color: black),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            elevation: 0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Text(
                    'No tags added',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Divider(color: gray500, thickness: 2),
            ),
            Expanded(
              child: Selector<NewNoteController, bool>(
                selector: (_, controller) => controller.readOnly,
                builder: (_, readOnly, __) => Column(
                  children: [
                    Expanded(
                      child: QuillEditor.basic(
                        configurations: QuillEditorConfigurations(
                          // ignore: deprecated_member_use
                          controller: quillController,
                          placeholder: 'Note here...',
                          expands: true,
                          //readOnly: readOnly,
                        ),
                        focusNode: focusNode,
                      ),
                    ),
                    //if (!readOnly) NoteToolbar(controller: quillController),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
