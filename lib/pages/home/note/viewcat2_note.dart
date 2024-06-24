import 'package:flutter/material.dart';
import 'package:simpleengineering/model/note_model.dart';
import 'package:simpleengineering/model/user_models.dart';
import 'package:simpleengineering/pages/home/cat2.dart';
import 'package:simpleengineering/pages/home/etap/etap.dart';
import 'package:simpleengineering/pages/home/etap/viewcat2_stagenote.dart';
import 'package:simpleengineering/pages/home/home.dart';


class CatViewNoteScreen extends StatefulWidget {
  final User user;
  final Note note;


  CatViewNoteScreen({Key? key, required this.note, required this.user}) : super(key: key);

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
    Note noteetap = widget.note;
    String profilePictureUrl = widget.note.note_picturetodo ?? '';

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return Cat();
              },
            ));
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
        ),
        
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                    },
                    child: const Text(
                      'Описание',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CatEtapNoteScreen(noteId: noteId, note: noteetap,),
                        ),
                      );
                    },
                    child: const Text(
                      'Этапы',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                color: Colors.black,
                height: 2.0,
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 229, 229, 229),
                  borderRadius: BorderRadius.circular(30),
                  image: profilePictureUrl.isNotEmpty
                      ? DecorationImage(
                          image: NetworkImage(profilePictureUrl),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: profilePictureUrl.isEmpty
                    ? const Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.grey,
                        size: 50,
                      )
                    : null,
              ),
            ),
            SizedBox(height: 25),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${widget.note.titletodo}",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15),
                Text(
                  "${widget.note.notetodo}",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Icon(Icons.calendar_month_outlined, size: 30),
                    SizedBox(width: 10),
                    Text(
                      "${widget.note.dataendtodo}",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                
              ],
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
