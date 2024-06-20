import 'package:flutter/material.dart';
import 'package:simpleengineering/model/note_model.dart';
import 'package:simpleengineering/pages/home/etap/etap.dart';
import 'package:simpleengineering/pages/home/etap/viewcat2_stagenote.dart';
import 'package:simpleengineering/pages/home/home.dart';


class CatViewNoteScreen extends StatefulWidget {
  final Note note;


  CatViewNoteScreen({Key? key, required this.note}) : super(key: key);

  @override
  _CatViewNoteScreenState createState() => _CatViewNoteScreenState();
}

class _CatViewNoteScreenState extends State<CatViewNoteScreen> {
  late int noteId; 

  

  @override
  void initState() {
    super.initState();
    noteId = widget.note.id;
  }


  @override
  Widget build(BuildContext context) {
    Note note = widget.note;

  
    return Scaffold(
      appBar: AppBar(
        title: Text("View Note"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Title: ${note.title}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Author: ${note.author.nickname}",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              "Description: ${note.note}",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              "ID: ${note.id}",
              style: TextStyle(fontSize: 16),
            ),

            

            OutlinedButton(
                  onPressed: () {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => CatEtapNoteScreen(note: note,),
                    //   ),
                    // );
                  },
                  child: Text(
                    "ЭТАПЫ",
                    style: TextStyle(color: Colors.black),
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
              style: TextStyle(color: const Color.fromARGB(255, 230, 10, 10)),
            ),
          )
          ],
        ),
      ),
      
    );
  }
}