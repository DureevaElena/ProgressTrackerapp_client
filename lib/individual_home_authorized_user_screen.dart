import 'package:flutter/material.dart';
import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:progresstrackerapp/Constants/api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:progresstrackerapp/Models/todo.dart';
import 'package:progresstrackerapp/Widgets/todo_container.dart';


class IndividualHomeScreenAuthorizedUser extends StatefulWidget{
  IndividualHomeScreenAuthorizedUser({Key? key}) : super(key: key);
  
  @override
  _IndividualHomeScreenAuthorizedUser createState() => _IndividualHomeScreenAuthorizedUser();
}

class _IndividualHomeScreenAuthorizedUser extends State<IndividualHomeScreenAuthorizedUser> {
  List<Todo> myTodos = [];
  bool isLoading = true;
  void fetchData() async{
    try{
      http.Response response = await http.get(Uri.parse(api));
      var data = json.decode(response.body);
      data.forEach((todo){
        Todo t = Todo(
          id: todo['id'], 
          title: todo['title'], 
          desc: todo['desc'], 
          isDone: todo['isDone'], 
          date: todo['date']
        );
        myTodos.add(t);

      });
      print(myTodos.length);
      setState(() {
        isLoading = false;
        
      });
      
      // if (myTodos.length > 1) {
      //   final Todo secondTodo = myTodos[0];
      //   print('ID: ${secondTodo.id}, Title: ${secondTodo.title}, Desc: ${secondTodo.desc}, IsDone: ${secondTodo.isDone}, Date: ${secondTodo.date}');
      // } else {
      //   print('The myTodos list does not contain enough elements.');
      // }

      // myTodos.forEach((todo) {
      //   print('ID: ${todo.id}, Title: ${todo.title}, Desc: ${todo.desc}, IsDone: ${todo.isDone}, Date: ${todo.date}');
      // });

      
      }
    catch(e){
      print('Error is $e');

    }
  }
  

  void delete_todo(String id) async{
    try{
      http.Response response = await http.delete(Uri.parse(api + "/" + id));
      print(response.statusCode);
      setState(() {
        myTodos = [];
      });
      fetchData();
    }
    catch(e){
      print(e);
      
    }

  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        leading: Padding(padding: EdgeInsets.all(15), 
        child: Image.asset('assets/logo.png'),
        ), 
        leadingWidth: 90,
        title: const Text('ProgressTracker', 
        style: TextStyle(
          fontFamily: 'Montserrat', 
          fontSize: 30,
          color: Colors.black),
        ),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, '/PersonalInformationUserScreen');
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
      body: Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              TextButton(
                onPressed: () {
                  //Navigator.pushNamed(context, '/IndividualHomeScreenAuthorizedUser');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 14, 122, 218),
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
                ),
                
                child: const Text(
                  'Индивидуальные',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  
                ),
              ),


             
              SizedBox(width: 10),


              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/CommunityHomeScreenAuthorizedUser');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 194,217,238),
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
                ),
                child: const Text(
                  'Общие',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),

          Expanded(
            child: isLoading
              ? CircularProgressIndicator()
              : ListView(
                  children: myTodos.map((e) {
                    return TodoContainer(
                      id: e.id,
                      onPress: () => delete_todo(e.id.toString()),
                      title: e.title, 
                      desc: e.desc, 
                      isDone: e.isDone);
                  }).toList(),
                ),
          ),




          // GestureDetector(
          //     onTap: () {
          //       Navigator.pushNamed(context, '/ViewingCreatedGoalScreen');
          //     },
          //     child: Container(
          //       color: const Color.fromARGB(255,249,249,249),
          //       height: 150, 
          //       width: MediaQuery.of(context).size.width, 
          //       child: Stack(
          //         children: [
          //           Row(
          //             children: [
          //               SizedBox(width: 20),
          //               Container(
          //                 margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          //                 decoration: BoxDecoration(
          //                   color: const Color.fromARGB(255, 229,229,229),
          //                   borderRadius: BorderRadius.circular(30), 
          //                 ),
          //                 width: 100, 
          //               ),
          //               Expanded(
          //                 child: Container(
          //                   color: const Color.fromARGB(255,249,249,249),
          //                   child: Padding(
          //                     padding: const EdgeInsets.all(8.0),
          //                     child: Column(
          //                       crossAxisAlignment: CrossAxisAlignment.start,
          //                       children: [
          //                         SizedBox(height: 10),
          //                         const Text(
          //                           'Принципы ООП',
          //                           style: TextStyle(
          //                             fontSize: 22,
          //                             color: Colors.black,
          //                           ),
          //                         ),
          //                         const Text(
          //                           'Осталось 6 дней',
          //                           style: TextStyle(
          //                             fontSize: 18,
          //                             color: Colors.black,
          //                           ),
          //                         ),
          //                         SizedBox(height: 20),
          //                         const Align(
          //                           alignment: Alignment.centerRight,
          //                           child: Text(
          //                             '30%',
          //                             style: TextStyle(
          //                               fontSize: 15,
          //                               color: Colors.black,
          //                             ),
          //                           ),
          //                         ),
          //                         SizedBox(height: 8),
          //                         Stack(
          //                           children: [
          //                             Container(
          //                               height: 5,
          //                               width: double.infinity,
          //                               color: Colors.black,
          //                             ),
          //                             FractionallySizedBox(
          //                               alignment: Alignment.centerLeft,
          //                               widthFactor: 0.3, // сколько % будет заполнено
          //                               child: Container(
          //                                 height: 5,
          //                                 color: const Color.fromARGB(255, 81, 227, 86),
          //                               ),
          //                             ),
          //                           ],
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //           Positioned(
          //             top: 0,
          //             right: 0,
          //             child: Padding(
          //               padding: const EdgeInsets.all(8.0),
          //               child: IconButton(
          //                 onPressed: () {
          //                   AppMetrica.reportEvent('Переход цели во вкладку "Общее"');
          //                   // Действие при нажатии на иконку для отправки контейнера (цели) на вкладку "Общие"
          //                 },
          //                 icon: Icon(Icons.file_upload, color: const Color.fromARGB(255, 25, 25, 230), size: 32),
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AppMetrica.reportEvent('Создание новой цели');
          Navigator.pushNamed(context, '/CreateGoalScreen');
        },
        backgroundColor: const Color.fromARGB(255, 25, 25, 230),
        child: Icon(Icons.add, color: Colors.white),
        shape: CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat
    );
  }
}