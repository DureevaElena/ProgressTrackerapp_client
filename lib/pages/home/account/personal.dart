import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpleengineering/api/auth/auth_api.dart';
import 'package:simpleengineering/api/note/note_api.dart';
import 'package:simpleengineering/model/note_model.dart';
import 'package:simpleengineering/model/user_cubit.dart';
import 'package:simpleengineering/model/user_models.dart';
import 'package:simpleengineering/pages/home/account/current_note.dart';
import 'package:simpleengineering/pages/home/account/end_note.dart';
import 'package:simpleengineering/pages/home/account/overdate_note.dart';
import 'package:simpleengineering/pages/home/account/update_personal.dart';
import 'package:simpleengineering/pages/home/home.dart';
import 'package:simpleengineering/pages/login_page.dart';

class PersonalPage extends StatefulWidget {
  final User user;

  const PersonalPage({Key? key, required this.user}) : super(key: key);

  @override
  State<PersonalPage> createState() => _PersonalState();
}

class _PersonalState extends State<PersonalPage> {
  late User user;
  List<Note> notes = [];

  

  @override
  Widget build(BuildContext context) {
    user = context.read<UserCubit>().state;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
        }, icon: const Icon(
          Icons.arrow_back,
          color: Colors.black ,
          size: 30,
          ),
        ),
        title: const Text('ProgressTracker', 
        style: TextStyle(
          fontFamily: 'Montserrat', 
          fontSize: 35)
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(2.0),
          child: Container(
            color: Colors.black,
            height: 2.0,
          ),
        ),
      ),
      body:SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            
            Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 229,229,229),
                shape: BoxShape.circle,
              ),
            ),

            SizedBox(height: 15,),
           
            Align(alignment: Alignment.bottomCenter,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => UpdatePersonalPage(),
                            ),
                          );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 25, 25, 230),
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                ),
                child: const Text(
                  'Редактировать профиль',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),

            SizedBox(height: 50,),
            Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text(
        'Имя',
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
    ),
    SizedBox(height: 8), // Пространство между текстами

    Text(
      "${widget.user.nickname}",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),

    SizedBox(height: 15),

    Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text(
        'Дата рождения',
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
    ),
    SizedBox(height: 8),

    Text(
      "${widget.user.birthDate}",
      style: TextStyle(fontSize: 20),
    ),

    SizedBox(height: 15),

    Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text(
        'Почта',
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
    ),

    SizedBox(height: 8),

    Text(
      "${widget.user.email}",
      style: TextStyle(fontSize: 20),
    ),
  ],
),





          

            SizedBox(height: 10,),

            Row(
              children: [
                Align(alignment: Alignment.bottomLeft,
                  child: TextButton(
                      onPressed: () {
                      Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => CurrentNotePage(),
                            ),
                          );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 25, 25, 230),
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                    ),
                    child: const Text(
                      'Текущие цели',
                     style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                
              ],
            ),

            SizedBox(height: 10,),
            Row(
              children: [
                Align(alignment: Alignment.bottomLeft,
                  child: TextButton(
                      onPressed: () {
                      Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => OverdateNotePage(),
                            ),
                          );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 25, 25, 230),
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                    ),
                    child: const Text(
                      'Просроченные цели',
                     style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                
              ],
            ),

            SizedBox(height: 10,),

            Row(
              children: [
                Align(alignment: Alignment.bottomLeft,
                  child: TextButton(
                      onPressed: () {
                      Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => EndNotePage(),
                            ),
                          );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 25, 25, 230),
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                    ),
                    child: const Text(
                      'Завершенные цели',
                     style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                
              ],
            ),

            

            SizedBox(height: 30,),

            Align(
              alignment: Alignment.bottomLeft,
              child: IconButton(
                 onPressed: () async {
                  await logOut(user.token!);
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => SignInPage()),
                    (route) => false);               
                },
                icon: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.exit_to_app,
                      color: Colors.black,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Выйти',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),  
          ],
        ), 
      ),
      ),
    );
  }
}
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
