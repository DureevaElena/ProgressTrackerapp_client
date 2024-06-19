import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpleengineering/api/auth/auth_api.dart';
import 'package:simpleengineering/api/note/note_api.dart';
import 'package:simpleengineering/model/note_model.dart';
import 'package:simpleengineering/model/user_cubit.dart';
import 'package:simpleengineering/model/user_models.dart';
import 'package:simpleengineering/pages/home/note/create_note_screen.dart';
import 'package:simpleengineering/pages/home/home.dart';
import 'package:simpleengineering/pages/home/note/update_note_csreen.dart';
import 'package:simpleengineering/pages/home/note/viewcat2_note.dart';
import 'package:simpleengineering/pages/login_page.dart';
import 'package:simpleengineering/there.dart';


class Cat extends StatefulWidget {
  const Cat({super.key});

  @override
  State<Cat> createState() => _CatState();
}

class _CatState extends State<Cat> {
  late User user;
  
   @override
  void initState() {
    user = context.read<UserCubit>().state;
    super.initState();
  }

  

  // Future<void> addNoteToUser(Note note) async {
  // var newNote = await createNote(user, note.title, note.note, 1);
  // if (newNote != null) {
  //   setState(() {});
  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(content: Text("Заметка добавлена в ваш список")),
  //   );
  // } else {
  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(content: Text("Не удалось добавить заметку")),
  //   );
  // }
  // }


  @override
  Widget build(BuildContext context) {
    User user = context.read<UserCubit>().state;
    int cat = 2;
    return Scaffold(
      backgroundColor: Color(0xFFB7E5FB),
      appBar: AppBar(
        title: Text(
            "Home of ${user.first_name} ${user.last_name} ${user.nickname}"),
        backgroundColor: Color.fromARGB(255, 212, 28, 28),
        actions: [
          OutlinedButton(
              onPressed: () async {
                await logOut(user.token!);
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => SignInPage()),
                    (route) => false);
              },
              child: Text(
                "Logout",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: FutureBuilder<List<Note>>(
        future: getNotesCommunity(user),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          List<Note> notes = snapshot.data!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                  child: Text(
                    "Индивидуальные",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: [
                    ...notes.map((note) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => CatViewNoteScreen(note: note),
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              Text(note.title),
                              Text(note.author.nickname),
                              Text(
                                note.note.length > 20
                                    ? note.note.substring(0, 20) + "..."
                                    : note.note,
                              ),
                              Text("$cat"),
                              // OutlinedButton(
                              //   onPressed: () async {
                              //     await addNoteToUser(note);
                              //   },
                              //   child: Text(
                              //     "Set Cat to 1",
                              //     style: TextStyle(color: Colors.black),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}