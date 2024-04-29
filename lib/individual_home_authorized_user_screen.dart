import 'package:flutter/material.dart';

class IndividualHomeScreenAuthorizedUser extends StatelessWidget {
  const IndividualHomeScreenAuthorizedUser({Key? key}) : super(key: key);

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
        
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Действие при нажатии на кнопку "Индивидуальные"
                  },
                  child: Text('Индивидуальные'),
                ),
                SizedBox(width: 10), // Промежуток между кнопками
                ElevatedButton(
                  onPressed: () {
                    // Действие при нажатии на кнопку "Общие"
                  },
                  child: Text('Общие'),
                ),
              ],
            ),
            SizedBox(height: 20), // Отступ после кнопок
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width, // Ширина экрана
              color: Colors.grey, // Цвет прямоугольника
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/CreateGoalScreen');
        },
        backgroundColor: Colors.red,
        child: Icon(Icons.add, color: Colors.white),
        shape: CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat
    );
  }
}