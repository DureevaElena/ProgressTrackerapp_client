import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpleengineering/api/note/note_api.dart';
import 'package:simpleengineering/model/note_model.dart';
import 'package:simpleengineering/model/user_cubit.dart';
import 'package:simpleengineering/model/user_models.dart';
import 'package:simpleengineering/pages/home/home.dart';

class CreateStageNoteScreen extends StatefulWidget {
  final int idnote;
  const CreateStageNoteScreen({super.key, required this.idnote});

  @override
  State<CreateStageNoteScreen> createState() => _CreateStageNoteScreenState();
}

class _CreateStageNoteScreenState extends State<CreateStageNoteScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  //int selectedCat = 1;
  late User user;
  @override
  void initState() {
    user = context.read<UserCubit>().state;
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create StageNote"),
        backgroundColor: Color.fromARGB(255, 212, 28, 28),
        actions: [
          OutlinedButton(
              onPressed: () async {
                if (titleController.text.isNotEmpty &&
                    noteController.text.isNotEmpty) {
                      
                  var a = await createStageNote(
                    user,
                    titleController.text,
                    noteController.text,
                    widget.idnote,
                                        
                  );
                  
                }
                
              },
              
              child: Text(
                "Create",
                style: TextStyle(color: const Color.fromARGB(255, 188, 19, 19)),
              )
              
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