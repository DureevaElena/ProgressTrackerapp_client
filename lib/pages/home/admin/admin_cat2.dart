import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpleengineering/api/auth/auth_api.dart';
import 'package:simpleengineering/api/note/note_api.dart';
import 'package:simpleengineering/model/note_model.dart';
import 'package:simpleengineering/model/user_cubit.dart';
import 'package:simpleengineering/model/user_models.dart';
import 'package:simpleengineering/pages/home/account/personal.dart';
import 'package:simpleengineering/pages/home/admin/admin_users.dart';
import 'package:simpleengineering/pages/home/admin/adminhome.dart';
import 'package:simpleengineering/pages/home/note/viewcat2_note.dart';
import 'package:simpleengineering/pages/home/home.dart';

class AdminCat extends StatefulWidget {
  const AdminCat({super.key});

  @override
  State<AdminCat> createState() => _AdminCatState();
}

class _AdminCatState extends State<AdminCat> {
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
                  return AdminPage();
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
                        builder: (context) => UsersPage(user: user,),
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
                    "Пользователи",
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
              String? result = await showDialog(
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
                var success = await deleteNote(user, note.id); 
                if (success) {
                  Navigator.of(context).pop(true); 
                } else {
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
