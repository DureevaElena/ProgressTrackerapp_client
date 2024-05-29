import 'package:flutter/material.dart';
import 'package:progresstrackerapp/Constants/api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:progresstrackerapp/Models/todo.dart';
import 'package:progresstrackerapp/Widgets/todo_container.dart';



class CreateGoalScreen extends StatefulWidget{
  CreateGoalScreen({Key? key}) : super(key: key);
  
  @override
  _CreateGoalScreen createState() => _CreateGoalScreen();
}

class _CreateGoalScreen extends State<CreateGoalScreen> {
  //TextEditingController titleController = TextEditingController();
  //TextEditingController descriptionController = TextEditingController();


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
      }
    catch(e){
      print('Error is $e');

    }
  }
  void _postData({String title = "", String desc = ""}) async{
    try{
      http.Response response = await http.post(
        Uri.parse(api),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, dynamic>{
          "title": title, 
          "desc": desc, 
          "isDone": false
        }),
      );
      if(response.statusCode == 201){
        setState(() {
          myTodos = [];
        });
        fetchData();
        
      } else{
        print("Something went wrong");
      }



    }
    catch(e){
      print('Error is $e');
    }
  }
  String title = "";
  String desc = "";

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        leading: IconButton(
          onPressed: (){
            Navigator.pushNamed(context, '/IndividualHomeScreenAuthorizedUser');
        }, icon: const Icon(
          Icons.arrow_back,
          color: Colors.black ,
          size: 30,
          ),
        ),
        title: const Text('Создать цель', 
        style: TextStyle(
          fontFamily: 'Montserrat', 
          fontSize: 35)
        ),
        actions: [
          IconButton(
            onPressed: () => _postData(
              title: title,
              desc: desc
            ), 
            icon: const Icon(
              Icons.check,
              color: Colors.black,
              size: 35,
            ),
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
      body: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            
            Align( 
                alignment: Alignment.center,
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255,229,229,229),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),

            SizedBox(height: 25,),
           
            // Align(
            //   alignment: Alignment.bottomCenter,
            //   child: TextButton(
            //     onPressed: () {
            //         // Действие при нажатии кнопки "Добавить фото"
            //     },
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: const Color.fromARGB(255, 25, 25, 230),
            //       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            //     ),
            //   child: const Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Text(
            //       'Добавить фото',
            //       style: TextStyle(
            //         fontFamily: 'Montserrat',
            //         color: Colors.white,
            //         fontSize: 20,
            //       ),
            //       ),
            //       SizedBox(width: 8),
            //       Icon(
            //         Icons.camera_alt_outlined,
            //         color: Colors.white,
            //           size: 20,
            //       ),
            //       ],
            //     ),
            //   ),
            // ),

            SizedBox(height: 50,),


            
            const Padding(padding: EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.centerLeft,
                child: Text('Название',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),  
                ),
              ),
            ),

              Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      //controller: titleController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide: BorderSide(color: Colors.black,width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide: BorderSide(color: Color.fromARGB(255, 160, 160, 160),width: 2.0),
                        ), 
                      ),
                      onSubmitted: (value) {
                        setState(() {
                          title = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 15,),

            const Padding(padding: EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.centerLeft,
                child: Text('Описание',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),  
                ),
              ),
            ),

             Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      //controller: descriptionController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide: BorderSide(color: Colors.black,width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide: BorderSide(color: Color.fromARGB(255, 160, 160, 160),width: 2.0),
                        ),
                      ),
                      onSubmitted: (value) {
                        setState(() {
                          desc = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 15,),

            // const Padding(padding: EdgeInsets.only(left: 20),
            // child: Align(
            //   alignment: Alignment.centerLeft,
            //     child: Text('Дата завершения',
            //       style: TextStyle(
            //         fontSize: 16,
            //         color: Colors.black,
            //       ),  
            //     ),
            //   ),
            // ),

            // const Row(
            //   children: [
            //     Expanded(
            //       child: Padding(
            //         padding: EdgeInsets.symmetric(horizontal: 10),
            //         child: TextField(
            //           decoration: InputDecoration(
            //             enabledBorder: OutlineInputBorder(
            //               borderRadius: BorderRadius.all(Radius.circular(15.0)),
            //               borderSide: BorderSide(color: Colors.black,width: 2.0),
            //             ),
            //             focusedBorder: OutlineInputBorder(
            //               borderRadius: BorderRadius.all(Radius.circular(15.0)),
            //               borderSide: BorderSide(color: Color.fromARGB(255, 160, 160, 160),width: 2.0),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ), 
      ),
      ),
    );
  }
  // Future<void> submitData() async {
  //   final title = titleController.text;
  //   final description = descriptionController.text;
  //   final body = {
  //     "title": title,
  //     "desc": description,
  //     "isDone": false
  //   };

  //   final response = await http.post(
  //     Uri.parse(api), 
  //     headers: {
  //       'Content-Type': 'application/json'
  //     }, 
  //     body: jsonEncode(body),);

  //   print('Status Code: ${response.statusCode}');
  //   print('Response Body: ${response.body}');
  //   print('Response Headers: ${response.headers}');

  //   // if(response.statusCode == 201){
  //   //   print('Create Success');
  //   // } else {
  //   //   print('Create Failed');
  //   //   print(response.body);

  //   // }

  // }




}