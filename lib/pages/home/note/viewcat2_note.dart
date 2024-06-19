import 'package:flutter/material.dart';
import 'package:simpleengineering/model/note_model.dart';
import 'package:simpleengineering/pages/home/etap/etap.dart';
import 'package:simpleengineering/pages/home/home.dart';

class CatViewNoteScreen extends StatelessWidget {
  final Note note;

  const CatViewNoteScreen({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EtapNoteScreen(noteId: note.id),
                      ),
                    );
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