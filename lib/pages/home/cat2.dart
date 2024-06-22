import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpleengineering/api/auth/auth_api.dart';
import 'package:simpleengineering/api/note/note_api.dart';
import 'package:simpleengineering/model/note_model.dart';
import 'package:simpleengineering/model/user_cubit.dart';
import 'package:simpleengineering/model/user_models.dart';
import 'package:simpleengineering/pages/home/account/personal.dart';
import 'package:simpleengineering/pages/home/note/viewcat2_note.dart';
import 'package:simpleengineering/pages/home/home.dart';

class Cat extends StatefulWidget {
  const Cat({super.key});

  @override
  State<Cat> createState() => _CatState();
}

class _CatState extends State<Cat> {
  late User user;

  @override
  void initState() {
    super.initState();
    user = context.read<UserCubit>().state;
  }

  @override
  Widget build(BuildContext context) {
    int cat = 2;
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
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return PersonalPage(user: user);
                },
              ));
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
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 194, 217, 238)),
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
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 14, 122, 218)),
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
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Note>>(
              future: getNotesCommunity(user),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Ошибка загрузки заметок'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('Заметки отсутствуют'));
                }
                List<Note> notes = snapshot.data!;
                return GridView.count(
                  crossAxisCount: 2,
                  children: notes.map((note) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => CatViewNoteScreen(
                              note: note,
                              user: user,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 188, 18, 18),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            Text(note.titletodo),
                            Text(note.authortodo.nickname),
                            Text(
                              note.notetodo.length > 20
                                  ? note.notetodo.substring(0, 20) + "..."
                                  : note.notetodo,
                            ),
                            Text("$cat"),
                            IconButton(
                              onPressed: () async {
                                
                                try {
                                  Note? copiedNote = await createCopyNewNote(
                                    user,
                                    note.titletodo,
                                    note.notetodo,
                                    1,
                                    note.dataendtodo,
                                    note.statustodo,
                                  );

                                  if (copiedNote != null) {
                                    setState(() {
                                      notes.add(copiedNote);
                                    });

                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        content: Text(
                                            "Категория установлена как 1 и заметка сохранена"),
                                      ),
                                    );
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        content: Text(
                                            "note успешно добавлена в Индивидуальные"),
                                      ),
                                    );
                                  }
                                } catch (e) {
                                  print(
                                      'note успешно добавлена в Индивидуальные $e');
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      content: Text(
                                          "note успешно добавлена в Индивидуальные"),
                                    ),
                                  );
                                }
                              },
                              icon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.favorite_border,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
