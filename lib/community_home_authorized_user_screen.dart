import 'package:flutter/material.dart';

class CommunityHomeScreenAuthorizedUser extends StatelessWidget {
  const CommunityHomeScreenAuthorizedUser({Key? key}) : super(key: key);

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
                  Navigator.pushNamed(context, '/IndividualHomeScreenAuthorizedUser');
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
          SizedBox(height: 20),
          GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/ViewCommunityGoalScreen');
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
                                    'Python за 6 месяцев',
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
                                  const Text(
                                    'hyeinomg',
                                    style: TextStyle(
                                      fontSize: 18, 
                                      color: Colors.white,
                                    ),
                                  ),
                                  //SizedBox(height: 1),
                                  const Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      '0%',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Stack(
                                    children: [
                                      Container(
                                        height: 5,
                                        width: double.infinity,
                                        color: Colors.black,
                                      ),
                                      FractionallySizedBox(
                                        alignment: Alignment.centerLeft,
                                        widthFactor: 0, // сколько процентов выполнено
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}