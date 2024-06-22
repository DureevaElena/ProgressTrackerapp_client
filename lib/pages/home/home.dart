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
  try {
    // Создаем копию текущей заметки с cat = 2
    Note? copiedNote = await createCopyNewNote(user, note.titletodo, note.notetodo, 2, note.dataendtodo, note.statustodo);

    // Проверяем, успешно ли создана копия
    if (copiedNote != null) {
      // Оставляем текущую заметку без изменений, кроме категории
      note.cattodo = 1;
      await updateNote(user, note);

      // После обновления текущей заметки, выводим сообщение и обновляем состояние
      setState(() {
        notes[notes.indexOf(note)] = note; // Обновляем текущую заметку в списке
      });

      // Отправляем копию заметки с cat = 2 на экран Cat()
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Cat(),
        ),
      );

      // Показываем диалоговое окно с сообщением
      showDialog(
        context: context,
        builder: (context) => AlertDialog(content: Text("Category set to 2 and Note Saved")),
      );
    } else {
      // Если копия не была успешно создана, показываем сообщение об ошибке
      showDialog(
        context: context,
        builder: (context) => AlertDialog(content: Text("Failed to create copy of the note")),
      );
    }
  } catch (e) {
    print('Failed to update and save note: $e');
    showDialog(
      context: context,
      builder: (context) => AlertDialog(content: Text("note успешно добавлена в Общие")),
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
          child: notes.isEmpty
              ? Center(
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
                                    Text("Название: "+note.titletodo),
                                    Text("Имя: " + note.authortodo.nickname),
                                    Text("ID цели: ${note.id}"),
                                    if (note.notetodo != null) // Проверяем, не является ли note.note null
                                      Text(
                                        note.notetodo.length > 20
                                            ? note.notetodo.substring(0, 20) + "..."
                                            : note.notetodo,
                                      ),
                                    Text("Статус (ТПЗ): ${note.statustodo}"),
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
}}