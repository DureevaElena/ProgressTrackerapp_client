import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpleengineering/api/auth/auth_api.dart';
import 'package:simpleengineering/api/note/note_api.dart';
import 'package:simpleengineering/api/note/stagenode_api.dart';
import 'package:simpleengineering/model/note_model.dart';
import 'package:simpleengineering/model/user_cubit.dart';
import 'package:simpleengineering/model/user_models.dart';
import 'package:simpleengineering/pages/change_password.dart';
import 'package:simpleengineering/pages/forget_pass.dart';
import 'package:simpleengineering/pages/home/account/current_note.dart';
import 'package:simpleengineering/pages/home/account/overdate_note.dart';
import 'package:simpleengineering/pages/home/account/personal.dart';
import 'package:simpleengineering/pages/home/cat2.dart';
import 'package:simpleengineering/pages/home/note/create_note_screen.dart';
import 'package:simpleengineering/pages/home/note/update_note_csreen.dart';
import 'package:simpleengineering/pages/home/note/view_note.dart';
import 'package:simpleengineering/pages/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late User user;
  List<Note> notes = [];

  int totalNotes = 0;
  int totalDone1 = 0;
  int totalDone2 = 0;
  int totalDone3 = 0;

  @override
  void initState() {
    user = context.read<UserCubit>().state;
    super.initState();
    loadNotes();
  }

  void calculateTotals() {
    totalNotes = notes.length;
    totalDone1 = notes.where((note) => note.statustodo == 1).length;
    totalDone2 = notes.where((note) => note.statustodo == 2).length;
    totalDone3 = notes.where((note) => note.statustodo == 3).length;
  }

  Future<void> loadNotes() async {
    try {
      List<Note> loadedNotes = await getNotes(user, 1);
      setState(() {
        notes = loadedNotes;
        calculateTotals();
      });
    } catch (error) {
      print('Failed to load notes: $error');
    }
  }
Future<void> updateCatAndSaveNote(Note note) async {
  try {

    note.cattodo = 2;
    await updateNote(user, note);

    setState(() {
      notes[notes.indexOf(note)] = note; 
    });

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Cat(),
      ),
    );
    showDialog(
      context: context,
      builder: (context) => AlertDialog(content: Text("Category set to 2 and Note Saved")),
    );
  } catch (e) {
    print('Failed to update and save note: $e');
    showDialog(
      context: context,
      builder: (context) => AlertDialog(content: Text("Failed to update note")),
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
      body: Column(
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
                  child: const Text(
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
                  child: const Text(
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

          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Wrap(
          //     children: [
          //       ElevatedButton(
          //         onPressed: () {},
            
          //         style: ButtonStyle(
          //           backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 46, 213, 199)),
          //           padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          //             EdgeInsets.symmetric(vertical: 8, horizontal: 20)),
          //           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          //             RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(15),
          //             ),
          //           ),
          //         ),
          //         child: Text('Текущие: $totalDone1', style: const TextStyle(
          //             fontFamily: 'Montserrat',
          //             color: Colors.black,
          //             fontSize: 15,
          //           ),),
          //       ),
          //       SizedBox(width: 10),
          //       ElevatedButton(
          //         onPressed: () {},
          //         style: ButtonStyle(
          //           backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 156, 218, 145)),
          //           padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          //             EdgeInsets.symmetric(vertical: 8, horizontal: 20)),
          //           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          //             RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(15),
          //             ),
          //           ),
          //         ),
          //         child: Text('Просроченные: $totalDone2', style: const TextStyle(
          //             fontFamily: 'Montserrat',
          //             color: Colors.black,
          //             fontSize: 15,
          //           ),),
          //       ),
          //       SizedBox(width: 10),
          //       ElevatedButton(
          //         onPressed: () {},
          //         style: ButtonStyle(
          //           backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 191, 149, 195)),
          //           padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          //             EdgeInsets.symmetric(vertical: 8, horizontal: 20)),
          //           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          //             RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(15),
          //             ),
          //           ),
          //         ),
          //         child: Text('Завершенные: $totalDone3', style: const TextStyle(
          //             fontFamily: 'Montserrat',
          //             color: Colors.black,
          //             fontSize: 15,
          //           ),),
          //       ),
          //     ],
          //   ),
          // ),


          Expanded(
            child: notes.isEmpty
                ? const Center(
                    child: Text(
                      'Нет созданных заметок',
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                : ListView.builder(
                    itemCount: notes.length,
                    itemBuilder: (context, index) {
                      final note = notes[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ViewNoteScreen(note: note, user: user),
                            ),
                          ).then((result) {
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
                            color: note.statustodo == 1 
                              ? Color.fromARGB(255, 46, 213, 199)
                              : note.statustodo == 2 
                                ? Color.fromARGB(255, 156, 218, 145)
                                : note.statustodo == 3 
                                  ? Color.fromARGB(255, 191, 149, 195)
                                  : Color.fromARGB(0, 10, 3, 3),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          height: 130,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        note.titletodo,
                                        style: TextStyle(
                                          fontSize: 30,
                                        ),
                                      ),
                                      Text(
                                        note.authortodo.nickname,
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 8), 
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
