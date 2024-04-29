import 'package:flutter/material.dart';


//Просроченные цели

class ExpiredGoalsScreen extends StatelessWidget {
  const ExpiredGoalsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
        }, icon: const Icon(
          Icons.arrow_back,
          color: Colors.black ,
          size: 30,
          ),
        ),
        title: const Text('Просроченные цели',
        style: TextStyle(
          fontFamily: 'Montserrat', 
          fontSize: 30)),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Цель ${index + 1}',
              style: const TextStyle(
                fontSize: 28,
                color: Colors.black,
              ),
            ),
            trailing: const Icon(
              Icons.flag_circle,
              size: 30,
              color: Colors.black,
            ),
          );
        },
        separatorBuilder: (context, index) {
          // Добавляем разделитель после каждого элемента списка, кроме последнего
          return const Divider(
            color: Colors.black,
            height: 5,
          );
        },
        itemCount: 5,
         // Количество элементов в списке
      ),
    );
  }
}