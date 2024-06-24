import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpleengineering/api/auth/auth_api.dart';
import 'package:simpleengineering/api/note/note_api.dart';
import 'package:simpleengineering/model/note_model.dart';
import 'package:simpleengineering/model/user_cubit.dart';
import 'package:simpleengineering/model/user_models.dart';
import 'package:simpleengineering/pages/home/account/personal.dart';
import 'package:simpleengineering/pages/home/cat2.dart';
import 'package:simpleengineering/pages/home/home.dart';
import 'package:simpleengineering/pages/home/note/create_note_screen.dart';
import 'package:simpleengineering/pages/home/note/update_note_csreen.dart';
import 'package:simpleengineering/pages/home/note/view_note.dart';
import 'package:simpleengineering/pages/login_page.dart';


class EndNotePage extends StatefulWidget {
  const EndNotePage({Key? key}) : super(key: key);

  @override
  State<EndNotePage> createState() => _EndNoteState();
}

class _EndNoteState extends State<EndNotePage> {
  late User user;
  List<Note> notes = [];

  @override
  void initState() {
    user = context.read<UserCubit>().state;
    super.initState();
    loadNotes();
  }

  Future<void> loadNotes() async {
    try {
      List<Note> loadedNotes = await getStatusNotesEnd(user,);
      setState(() {
        notes = loadedNotes;
      });
    } catch (error) {
      print('Failed to load notes: $error');
    }
  }


  @override
  Widget build(BuildContext context) {
    User user = context.read<UserCubit>().state;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        leading: Padding(
          padding: EdgeInsets.all(15),
          child: Image.asset('assets/logo.png'),
        ),
        leadingWidth: 90,
        title: const Text(
          'ProgressTracker',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 30,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PersonalPage(user: user,),
                            ),
                          );
            },
            icon: Icon(Icons.arrow_back_rounded),
            color: Colors.black,
            iconSize: 40,
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
      body: notes.isEmpty 
          ? Center(
              child: Text(
        'Нет созданных заметок',
        style: TextStyle(fontSize: 20),
      ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: notes.length,
                    itemBuilder: (context, index) {
                      final note = notes[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(
                            MaterialPageRoute(
                              builder: (context) => ViewNoteScreen(note: note, user: user),
                            ),
                          )
                              .then((result) {
                            if (result != null && result == true) {
                              setState(() {
                                notes.removeWhere((item) => item.id == note.id);
                              });
                            }
                          });
                        },
                        child: Container(
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 191, 149, 195),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        height: 120,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      note.titletodo,
                                      style: TextStyle(fontSize: 30),
                                    ),
                                    Text(
                                      note.authortodo.nickname,
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}