import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpleengineering/api/note/stagenode_api.dart';
import 'package:simpleengineering/model/note_model.dart';
import 'package:simpleengineering/model/user_cubit.dart';
import 'package:simpleengineering/model/user_models.dart';
import 'package:simpleengineering/pages/home/cat2.dart';
import 'package:simpleengineering/pages/home/etap/create_stagenote.dart';
import 'package:simpleengineering/pages/home/home.dart';
import 'package:simpleengineering/pages/home/note/view_note.dart';

class EtapNoteScreen extends StatefulWidget {
  final int noteId;

  const EtapNoteScreen({super.key, required this.noteId});

  @override
  State<EtapNoteScreen> createState() => _EtapNoteScreenState();
}

class _EtapNoteScreenState extends State<EtapNoteScreen> {
  late User user;
  
   @override
  void initState() {
    user = context.read<UserCubit>().state;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    User user = context.read<UserCubit>().state;
    //int catstage = 41;
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Etap Note"),
      ),
      body: FutureBuilder<List<StageNote>>(
        future: getStageNotes(user, widget.noteId),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          List<StageNote> notestages = snapshot.data!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                
                child: OutlinedButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => HomePage()),
                  (route) => false);
            },
            child: Text(
              "Exit",
              style: TextStyle(color: const Color.fromARGB(255, 230, 10, 10)),
            ),
          )
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: [
                    ...notestages.map((notestage) {
                      return GestureDetector(
                        // onTap: () {
                        //   Navigator.of(context).push(
                        //     MaterialPageRoute(
                        //       builder: (context) => ViewNoteScreen(note: note),
                        //     ),
                        //   );
                        // },
                        child: Container(
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              Text(notestage.titlestage),
                              Text(notestage.authorstage.nickname),
                              Text("${notestage.idnote}"),
                              Text(
                                notestage.notestage.length > 20
                                    ? notestage.notestage.substring(0, 20) + "..."
                                    : notestage.notestage,
                              ),
                              

                              

                              //ДОБАВИТЬ В "ОБЩИЕ"
                              // OutlinedButton(
                              //   onPressed: () async {
                              //     await updateCatAndSaveNote(note);
                              //   },
                              //   child: Text(
                              //     "Set Cat to 2",
                              //     style: TextStyle(color: Colors.black),
                              //   ),
                              // ),

                              // //УДАЛИТЬ
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceBetween, // Выравнивание по краям
                              //   children: [
                              //     IconButton(
                              //       icon: Icon(Icons.delete, color: Colors.red),
                              //       onPressed: () async {
                              //         String result = await showDialog(
                              //           context: context,
                              //           builder: (context) => AlertDialog(
                              //             content: Text("Do you want to delete note?"),
                              //             actions: [
                              //               OutlinedButton(
                              //                 onPressed: () {
                              //                   Navigator.of(context).pop("confirm");
                              //                 },
                              //                 child: Text("Confirm"),
                              //               ),
                              //               OutlinedButton(
                              //                 onPressed: () {
                              //                   Navigator.of(context).pop("cancel");
                              //                 },
                              //                 child: Text("Cancel"),
                              //               ),
                              //             ],
                              //           ),
                              //         );

                              //         if (result == "confirm") {
                              //           var success = await deleteNote(user, note.id);
                              //           if (success) {
                              //             showDialog(
                              //               context: context,
                              //               builder: (context) => AlertDialog(
                              //                 content: Text("Note Successfully Deleted"),
                              //               ),
                              //             );
                              //             setState(() {
                              //               notes.removeWhere((item) => item.id == note.id);
                              //             });
                              //           } else {
                              //             showDialog(
                              //               context: context,
                              //               builder: (context) => AlertDialog(
                              //                 content: Text("Something went wrong"),
                              //               ),
                              //             );
                              //           } 
                              //         }
                              //       },
                              //     ),

                              //     //РЕДАКТИРОВАТЬ
                              //     IconButton(
                              //       icon: Icon(Icons.edit, color: Colors.blue),
                              //       onPressed: () async {
                              //         Navigator.of(context).push(
                              //           MaterialPageRoute(
                              //             builder: (context) => UpdateNoteScreen(note: note),
                              //           ),
                              //         );
                              //       },
                              //     ),
                              //   ],
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