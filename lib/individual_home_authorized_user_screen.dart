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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Действие при нажатии на кнопку "Индивидуальные"
                },
                child: Text('Индивидуальные'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  // Действие при нажатии на кнопку "Общие"
                },
                child: Text('Общие'),
              ),
            ],
          ),
          SizedBox(height: 20), // Отступ после кнопок
          GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/ViewingCreatedGoalScreen');
              },
              child: Container(
                color: Colors.grey, // Серый цвет
                height: 150, // Высота контейнера
                width: MediaQuery.of(context).size.width, // Ширина контейнера равная ширине экрана
                child: Stack(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 20), // Отступ слева
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10), // Отступ сверху и снизу, справа и слева
                          decoration: BoxDecoration(
                            color: Colors.red, // Красный цвет
                            borderRadius: BorderRadius.circular(30), // Закругленные края радиусом 30
                          ),
                          width: 100, // Ширина красного квадрата
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.grey, // Серый цвет
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Принципы ООП',
                                    style: TextStyle(
                                      fontSize: 25, // Размер текста 12
                                      color: Colors.white, // Белый цвет текста
                                    ),
                                  ),
                                  const Text(
                                    'Осталось 6 дней',
                                    style: TextStyle(
                                      fontSize: 20, // Размер текста 6
                                      color: Colors.white, // Белый цвет текста
                                    ),
                                  ),
                                  SizedBox(height: 15), // Отступ между текстом "Осталось 6 дней" и надписью "30%"
                                  const Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      '30%',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5), // Отступ между текстом "Осталось 6 дней" и линией
                                  Stack(
                                    children: [
                                      Container(
                                        height: 5,
                                        width: double.infinity,
                                        color: Colors.black, // Серый цвет
                                      ),
                                      FractionallySizedBox(
                                        alignment: Alignment.centerLeft,
                                        widthFactor: 0.3, // 30% ширины
                                        child: Container(
                                          height: 5,
                                          color: Colors.green, // Зеленый цвет
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          onPressed: () {
                            // Действие при нажатии на иконку поиска
                          },
                          icon: Icon(Icons.search, color: Colors.white, size: 32),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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