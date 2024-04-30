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
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(2.0), // Высота линии
          child: Container(
            color: Colors.black, // Цвет линии
            height: 2.0, // Высота линии
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
              ElevatedButton(
                onPressed: () {
                  // Действие при нажатии на кнопку "Индивидуальные" (ничего не должно быть, т.к находимся на вкладке "Индивидуальные")
                },
                child: Text('Индивидуальные'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/CommunityHomeScreenAuthorizedUser');
                },
                child: Text('Общие'),
              ),
            ],
          ),
          SizedBox(height: 20),
          GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/ViewingCreatedGoalScreen');
              },
              child: Container(
                color: Colors.grey,
                height: 150, 
                width: MediaQuery.of(context).size.width, 
                child: Stack(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 20),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(30), 
                          ),
                          width: 100, 
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.grey,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10),
                                  const Text(
                                    'Принципы ООП',
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Text(
                                    'Осталось 6 дней',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  const Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      '30%',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Stack(
                                    children: [
                                      Container(
                                        height: 5,
                                        width: double.infinity,
                                        color: Colors.black,
                                      ),
                                      FractionallySizedBox(
                                        alignment: Alignment.centerLeft,
                                        widthFactor: 0.3, // сколько % закрашено
                                        child: Container(
                                          height: 5,
                                          color: Colors.green,
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
                            // Действие при нажатии на иконку для отправки контейнера (цели) на вкладку "Общие"
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