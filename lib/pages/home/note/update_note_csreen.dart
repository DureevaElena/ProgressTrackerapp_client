import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpleengineering/api/note/note_api.dart';
import 'package:simpleengineering/model/note_model.dart';
import 'package:simpleengineering/model/user_cubit.dart';
import 'package:simpleengineering/model/user_models.dart';
import 'package:simpleengineering/pages/home/home.dart';



class UpdateNoteScreen extends StatefulWidget {
  final Note note;
  const UpdateNoteScreen({super.key, required this.note});

  @override
  State<UpdateNoteScreen> createState() => _UpdateNoteScreenState();
}

class _UpdateNoteScreenState extends State<UpdateNoteScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  //TextEditingController catController = TextEditingController();
  late User user;
  late final Note note;
  @override
  void initState() {
    user = context.read<UserCubit>().state;
    note = widget.note;
    noteController.text = note.note;
    titleController.text = note.title;
    //catController.text = note.cat.toString();
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    noteController.dispose();
    //catController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> updateCatAndSaveNote() async {
    note.cat = 2;
    var a = await updateNote(user, note);
    if (a != null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(content: Text("Category set to 2 and Note Saved")),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(content: Text("Note not saved")),
      );
    }
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Note"),
        backgroundColor: Color.fromARGB(255, 212, 28, 28),
        actions: [
          OutlinedButton(
            onPressed: () async {
              if (titleController.text.isNotEmpty &&
                  noteController.text.isNotEmpty) {
                note.note = noteController.text;
                note.title = titleController.text;
                //note.cat = int.tryParse(catController.text) ?? note.cat;
                var a = await updateNote(user, note);
                if (a != null) {
                  setState(() {});
                  showDialog(
                    context: context,
                    builder: (context) =>
                        AlertDialog(content: Text("Note Saved")),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) =>
                        AlertDialog(content: Text("Note not saved")),
                  );
                }
              }
            },
            child: Text(
              "Save",
              style: TextStyle(color: Colors.white),
            ),
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => HomePage()),
                  (route) => false);
            },
            child: Text(
              "Exit",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: Column(children: [
        Text("Title"),
        TextField(
          maxLines: 1,
          controller: titleController,
          decoration: InputDecoration(border: OutlineInputBorder()),
        ),
        Text("Note"),
        TextField(
          controller: noteController,
          maxLines: 50,
          minLines: 10,
          decoration: InputDecoration(border: OutlineInputBorder()),
        ),
        
      ]),
    );
  }
}