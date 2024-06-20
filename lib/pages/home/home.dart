import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpleengineering/api/auth/auth_api.dart';
import 'package:simpleengineering/api/note/note_api.dart';
import 'package:simpleengineering/model/note_model.dart';
import 'package:simpleengineering/model/user_cubit.dart';
import 'package:simpleengineering/model/user_models.dart';
import 'package:simpleengineering/pages/home/account/personal.dart';
import 'package:simpleengineering/pages/home/cat2.dart';
import 'package:simpleengineering/pages/home/note/create_note_screen.dart';
import 'package:simpleengineering/pages/home/note/update_note_csreen.dart';
import 'package:simpleengineering/pages/home/note/view_note.dart';
import 'package:simpleengineering/pages/login_page.dart';
import 'package:simpleengineering/there.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      List<Note> loadedNotes = await getNotes(user, 1); 
      setState(() {
        notes = loadedNotes;
      });
    } catch (error) {
      print('Failed to load notes: $error');
    }
  }

  Future<void> updateCatAndSaveNote(Note note) async {
    note.cat = 2;
    var a = await updateNote(user, note);
    if (a != null) {
      setState(() {});
      showDialog(
        context: context,
        builder: (context) => AlertDialog(content: Text("Category set to 2 and Note Saved")),
      );
      setState(() {});
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(content: Text("Note not saved")),
      );
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
            icon: Icon(Icons.account_box_outlined),
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
              'Нет созданных целей',
              style: TextStyle(fontSize: 20),
            ),
          )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Cat(),
                            ),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 14, 122, 218)),
                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                              EdgeInsets.symmetric(vertical: 8, horizontal: 20)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        child: Text(
                          "Индивидуальные",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(width: 10), // Пространство между кнопками
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Cat(),
                            ),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 194, 217, 238)),
                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                              EdgeInsets.symmetric(vertical: 8, horizontal: 20)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        child: Text(
                          "Общие",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
                            color: Color.fromARGB(255, 136, 108, 108),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Container(
                                    color: Colors.grey,
                                    child: Center(child: Text('Фото')),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(note.title),
                                      Text(note.author.nickname),
                                      Text("${note.id}"),
                                      if (note.note != null) // Проверяем, не является ли note.note null
                                        Text(
                                          note.note.length > 20
                                              ? note.note.substring(0, 20) + "..."
                                              : note.note,
                                        ),
                                      Text("${note.status}"),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 8), // Пространство между текстом и кнопкой
                              IconButton(
                                onPressed: () async {
                                  await updateCatAndSaveNote(note);
                                },
                                icon: Icon(
                                  Icons.language,
                                  color: Colors.black,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CreateNoteScreen(),
            ),
          );
        },
        backgroundColor: const Color.fromARGB(255, 25, 25, 230),
        child: Icon(Icons.add, color: Colors.white),
        shape: CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}