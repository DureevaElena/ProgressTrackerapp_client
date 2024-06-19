import 'package:flutter/material.dart';
import 'package:simpleengineering/api/note/note_api.dart';
import 'package:simpleengineering/model/note_model.dart';
import 'package:simpleengineering/model/user_models.dart';
import 'package:simpleengineering/pages/home/etap/etap.dart';

import 'package:simpleengineering/pages/home/home.dart';
import 'package:simpleengineering/pages/home/note/update_note_csreen.dart';


class ViewNoteScreen extends StatelessWidget {
  final Note note;
  final User user;

  const ViewNoteScreen({Key? key, required this.note, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return HomePage();
              },
            ));
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              String result = await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: Text("Вы действительно хотите удалить заметку?"),
                  actions: [
                    OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pop("confirm");
                      },
                      child: Text("Подтвердить"),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pop("cancel");
                      },
                      child: Text("Отмена"),
                    ),
                  ],
                ),
              );

              if (result == "confirm") {
                var success = await deleteNote(user, note.id); // Передаем токен пользователя для удаления заметки
                if (success) {
                  // Удаление успешно
                  Navigator.of(context).pop(true); // Возвращаем успешный результат удаления
                } else {
                  // В случае ошибки
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: Text("Что-то пошло не так при удалении заметки"),
                    ),
                  );
                }
              }
            },
            icon: const Icon(
              Icons.delete_rounded,
              color: Colors.black,
              size: 35,
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40.0),
          child: Column(
            // Оборачиваем Row в Column
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      // Действия для кнопки "Описание"
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
                          builder: (context) => EtapNoteScreen(noteId: note.id),
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
                  color: const Color.fromARGB(255, 229, 229, 229),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(height: 25),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${note.title}",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15),
                Text(
                  "${note.note}",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Icon(Icons.calendar_month_outlined, size: 30),
                    SizedBox(width: 10),
                    Text(
                      "${note.dataend}",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 50),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => UpdateNoteScreen(note: note),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 25, 25, 230),
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  child: const Text(
                    'Редактировать',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
