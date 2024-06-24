
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:simpleengineering/api/note/note_api.dart';
import 'package:simpleengineering/api/note/stagenode_api.dart';
import 'package:simpleengineering/model/note_model.dart';
import 'package:simpleengineering/model/user_cubit.dart';
import 'package:simpleengineering/model/user_models.dart';
import 'package:simpleengineering/pages/home/etap/etap.dart';
import 'package:simpleengineering/pages/home/home.dart';

class UpdateStageNoteScreen extends StatefulWidget {
  final int noteId;
  final Note note;
  final StageNote stageNote;

  const UpdateStageNoteScreen({Key? key, required this.noteId, required this.note, required this.stageNote}) : super(key: key);

  @override
  State<UpdateStageNoteScreen> createState() => _UpdateStageNoteScreenState();
}

class _UpdateStageNoteScreenState extends State<UpdateStageNoteScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  late User user;
  late StageNote stageNote;

  @override
  void initState() {
    user = context.read<UserCubit>().state;
    stageNote = widget.stageNote;
    titleController.text = stageNote.titlestagetodo;
    noteController.text = stageNote.notestagetodo;
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    noteController.dispose();
    super.dispose();
  }

  Future<void> updateStageNoteAndSave() async {
    stageNote.titlestagetodo = titleController.text;
    stageNote.notestagetodo = noteController.text;
    
    var success = await updateStageNote(user, stageNote);
    if (success) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text("Этап успешно обновлен"),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text("Ошибка при обновлении"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    int idnote = widget.noteId;
    Note notenote = widget.note;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => EtapNoteScreen(noteId: idnote, note: notenote),
              ),
              (route) => false,
            );
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
        ),
        title: const Text(
          'Редактировать',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 35,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => updateStageNoteAndSave(),
            icon: const Icon(
              Icons.check,
              color: Colors.black,
              size: 35,
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(2.0),
          child: Container(
            color: Colors.black,
            height: 2.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Название',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: titleController,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            borderSide: BorderSide(color: Colors.black, width: 2.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            borderSide: BorderSide(color: Color.fromARGB(255, 160, 160, 160), width: 2.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Описание',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: noteController,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            borderSide: BorderSide(color: Colors.black, width: 2.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            borderSide: BorderSide(color: Color.fromARGB(255, 160, 160, 160), width: 2.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}