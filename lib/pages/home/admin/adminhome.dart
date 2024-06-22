import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpleengineering/api/auth/auth_api.dart';
import 'package:simpleengineering/api/note/note_api.dart';
import 'package:simpleengineering/model/note_model.dart';
import 'package:simpleengineering/model/user_cubit.dart';
import 'package:simpleengineering/model/user_models.dart';
import 'package:simpleengineering/pages/home/account/personal.dart';
import 'package:simpleengineering/pages/home/admin/admin_users.dart';
import 'package:simpleengineering/pages/home/cat2.dart';
import 'package:simpleengineering/pages/home/note/create_note_screen.dart';
import 'package:simpleengineering/pages/home/note/update_note_csreen.dart';
import 'package:simpleengineering/pages/home/note/view_note.dart';
import 'package:simpleengineering/pages/login_page.dart';
import 'package:simpleengineering/there.dart';
class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
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
                builder: (context) => UsersPage(user: user,),
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
                      "${user.nickname}",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                ],
            ),
          ),
      ),
    );
  }
}
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
