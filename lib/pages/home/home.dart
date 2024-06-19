import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpleengineering/api/auth/auth_api.dart';
import 'package:simpleengineering/api/note/note_api.dart';
import 'package:simpleengineering/model/note_model.dart';
import 'package:simpleengineering/model/user_cubit.dart';
import 'package:simpleengineering/model/user_models.dart';
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

  @override
  void initState() {
    user = context.read<UserCubit>().state;
    super.initState();
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
    int cat = 1;
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
              // Navigator.pushNamed(context, '/PersonalInformationUserScreen');
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
      body: FutureBuilder<List<Note>>(
        future: getNotes(user, cat),
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
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 8, horizontal: 20)),
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
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 8, horizontal: 20)),
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
                child: ListView(
                  children: [
                    ...notes.map((note) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ViewNoteScreen(note: note),
                            ),
                          );
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
                              // Квадратное место для фото
                              Padding(
                                padding: const EdgeInsets.all(10.0), // Отступы вокруг фото
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Container(
                                    color: Colors.grey, // Замените на изображение
                                    child: Center(child: Text('Фото')),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0), // Отступы вокруг текста
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(note.title),
                                      Text(note.author.nickname),
                                      Text("${note.id}"),
                                      Text(
                                        note.note.length > 20
                                            ? note.note.substring(0, 20) + "..."
                                            : note.note,
                                      ),
                                      Text("$cat"),
                                    ],
                                  ),
                                ),
                              ),
                              // Кнопка в правом верхнем углу контейнера
                              Positioned(
                                top: 10,
                                right: 10,
                                child: IconButton(
                                  onPressed: () async {
                                    await updateCatAndSaveNote(note);
                                  },
                                  icon: Icon(
                                    Icons.language, 
                                    color: Colors.black,
                                  ),
                                ),
                              ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //AppMetrica.reportEvent('Создание новой цели');
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

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   late User user;
  
//    @override
//   void initState() {
//     user = context.read<UserCubit>().state;
//     super.initState();
//   }

//   Future<void> updateCatAndSaveNote(Note note) async {
//     note.cat = 2;
//     var a = await updateNote(user, note);
//     if (a != null) {
//       setState(() {});
      
//       showDialog(
//         context: context,
//         builder: (context) => AlertDialog(content: Text("Category set to 2 and Note Saved")),
//       );
//     } else {
//       showDialog(
//         context: context,
//         builder: (context) => AlertDialog(content: Text("Note not saved")),
//       );
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     User user = context.read<UserCubit>().state;
//     int cat = 1;
//     return Scaffold(
//       backgroundColor: Color(0xFFB7E5FB),
//       appBar: AppBar(
//         title: Text(S
//             "Home of ${user.nickname}, ${user.id}"),
//         backgroundColor: Color.fromARGB(255, 212, 28, 28),
//         actions: [
//           OutlinedButton(
//               onPressed: () async {
//                 await logOut(user.token!);
//                 Navigator.of(context).pushAndRemoveUntil(
//                     MaterialPageRoute(builder: (context) => SignInPage()),
//                     (route) => false);
//               },
//               child: Text(
//                 "Logout",
//                 style: TextStyle(color: Colors.white),
//               ))
//         ],
//       ),
//       body: FutureBuilder<List<Note>>(
//         future: getNotes(user, cat),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           List<Note> notes = snapshot.data!;
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
                
//                 child: OutlinedButton(
//                   onPressed: () {
//                     Navigator.of(context).push(
//                       MaterialPageRoute(
//                         builder: (context) => Cat(),
//                       ),
//                     );
//                   },
//                   child: Text(
//                     "Общие",
//                     style: TextStyle(color: Colors.black),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: GridView.count(
//                   crossAxisCount: 2,
//                   children: [
//                     ...notes.map((note) {
//                       return GestureDetector(
//                         onTap: () {
//                           Navigator.of(context).push(
//                             MaterialPageRoute(
//                               builder: (context) => ViewNoteScreen(note: note),
//                             ),
//                           );
//                         },
//                         child: Container(
//                           margin: EdgeInsets.all(8),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           child: Column(
//                             children: [
//                               Text(note.title),
//                               Text(note.author.nickname),
//                               Text("${note.id}"),
//                               Text(
//                                 note.note.length > 20
//                                     ? note.note.substring(0, 20) + "..."
//                                     : note.note,
//                               ),
//                               Text("$cat"),

                              

//                               //ДОБАВИТЬ В "ОБЩИЕ"
//                               OutlinedButton(
//                                 onPressed: () async {
//                                   await updateCatAndSaveNote(note);
//                                 },
//                                 child: Text(
//                                   "Set Cat to 2",
//                                   style: TextStyle(color: Colors.black),
//                                 ),
//                               ),

//                               //УДАЛИТЬ
//                               // Row(
//                               //   mainAxisAlignment: MainAxisAlignment.spaceBetween, // Выравнивание по краям
//                               //   children: [
//                               //     IconButton(
//                               //       icon: Icon(Icons.delete, color: Colors.red),
//                               //       onPressed: () async {
//                               //         String result = await showDialog(
//                               //           context: context,
//                               //           builder: (context) => AlertDialog(
//                               //             content: Text("Do you want to delete note?"),
//                               //             actions: [
//                               //               OutlinedButton(
//                               //                 onPressed: () {
//                               //                   Navigator.of(context).pop("confirm");
//                               //                 },
//                               //                 child: Text("Confirm"),
//                               //               ),
//                               //               OutlinedButton(
//                               //                 onPressed: () {
//                               //                   Navigator.of(context).pop("cancel");
//                               //                 },
//                               //                 child: Text("Cancel"),
//                               //               ),
//                               //             ],
//                               //           ),
//                               //         );

//                               //         if (result == "confirm") {
//                               //           var success = await deleteNote(user, note.id);
//                               //           if (success) {
//                               //             showDialog(
//                               //               context: context,
//                               //               builder: (context) => AlertDialog(
//                               //                 content: Text("Note Successfully Deleted"),
//                               //               ),
//                               //             );
//                               //             setState(() {
//                               //               notes.removeWhere((item) => item.id == note.id);
//                               //             });
//                               //           } else {
//                               //             showDialog(
//                               //               context: context,
//                               //               builder: (context) => AlertDialog(
//                               //                 content: Text("Something went wrong"),
//                               //               ),
//                               //             );
//                               //           } 
//                               //         }
//                               //       },
//                               //     ),

//                               //     //РЕДАКТИРОВАТЬ
//                               //     IconButton(
//                               //       icon: Icon(Icons.edit, color: Colors.blue),
//                               //       onPressed: () async {
//                               //         Navigator.of(context).push(
//                               //           MaterialPageRoute(
//                               //             builder: (context) => UpdateNoteScreen(note: note),
//                               //           ),
//                               //         );
//                               //       },
//                               //     ),
//                               //   ],
//                               // ),
//                             ],
//                           ),
//                         ),
//                       );
//                     }).toList(),
//                     InkWell(
//                       onTap: () {
//                         Navigator.of(context).push(
//                           MaterialPageRoute(
//                             builder: (context) => CreateNoteScreen(),
//                           ),
//                         );
//                       },
//                       child: Container(
//                         margin: EdgeInsets.all(8),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: Icon(Icons.add),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }