import 'package:flutter/material.dart';
import 'package:progresstrackerapp/Constants/api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:progresstrackerapp/Models/todo.dart';
import 'package:progresstrackerapp/Widgets/todo_container.dart';



class ViewingCreatedGoalScreen extends StatefulWidget{
  ViewingCreatedGoalScreen({Key? key}) : super(key: key);
  
  @override
  _ViewingCreatedGoalScreen createState() => _ViewingCreatedGoalScreen();
}

class _ViewingCreatedGoalScreen extends State<ViewingCreatedGoalScreen> {



  @override
  Widget build(BuildContext context) {
    //final String title = ModalRoute.of(context)!.settings.arguments as String;
    //print("id this = $title");

    final Map<String, String> args = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String title = args['title']!;
    final String desc = args['desc']!;
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
        
        actions: [
          IconButton(
            onPressed: (){
              //Navigator.pushNamed(context, '/IndividualHomeScreenAuthorizedUser');
              //удалить

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
          child: Column( // Оборачиваем Row в Column
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      //Navigator.pushNamed(context, '/ViewingCreatedGoalScreen');
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
                      Navigator.pushNamed(context, '/ViewGoalStagesScreen');
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

            Padding(padding: EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.center,
                child: Text('$title',
                  style: const TextStyle(
                    fontSize: 35,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            
            SizedBox(height: 15,),

            Padding(padding: EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.centerLeft,
                child: Text('$desc',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),  
                ),
              ),
            ),


            SizedBox(height: 15,),

            const Padding(
              padding: EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Icon(Icons.calendar_month_outlined, size: 30,),
                SizedBox(width: 5), // Добавим небольшой отступ между иконкой и текстом
                Align(
                  alignment: Alignment.centerLeft,
                    child: Text(
                      '13.02.2024',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 50,),
           
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/EditGoalScreen');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 25, 25, 230),
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Редактировать',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
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