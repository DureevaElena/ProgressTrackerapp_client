import 'package:flutter/material.dart';

class TodoContainer extends StatelessWidget {
  final int id;
  final String title;
  final String desc;
  final bool isDone;

  const TodoContainer({
    Key? key,
    required this.id,
    required this.title,
    required this.desc,
    required this.isDone,

    }) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/ViewingCreatedGoalScreen',
          arguments: id, 
        );
      },
      child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height:  120,
        decoration: const BoxDecoration(
          color: Colors.pink,
          borderRadius:  BorderRadius.all(
            Radius.circular(10)
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: null, 
                    icon: Icon(Icons.file_upload, color: const Color.fromARGB(255, 25, 25, 230), size: 32), 
                    label: Text("Загрузка"))
                ],
              ),
              SizedBox(height: 6,),
              //ДОБАВИТЬ ПРОКРУТКУ ОПИСАНИЯ
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  desc,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),

              ), 
            ],
          ), 
        ), 
      ),
    ),
    );     
  }
}