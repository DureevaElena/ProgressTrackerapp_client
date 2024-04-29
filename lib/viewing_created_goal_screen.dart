import 'package:flutter/material.dart';

class ViewingCreatedGoalScreen extends StatelessWidget {
  const ViewingCreatedGoalScreen({Key? key}) : super(key: key);

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
        ],bottom: PreferredSize(
            preferredSize: Size.fromHeight(40.0), 
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    //Navigator.pushNamed(context, '/ViewingCreatedGoalScreen');
                  },
                  child: const Text(
                      'Описание',
                      style: TextStyle(
                        color: Colors.black, // Цвет текста кнопки
                        fontSize: 16, // Размер шрифта кнопки
                      ),
                    ),
                  ),
                TextButton(
                  onPressed: () {
                    // Переход на Этапы
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
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),

            SizedBox(height: 25,),

            const Padding(padding: EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.center,
                child: Text('Принципы ООП',
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            
            SizedBox(height: 15,),

            const Padding(padding: EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.centerLeft,
                child: Text('Это цель принципы ООП, это цель принципы ООП, это цель принципы ООП',
                  style: TextStyle(
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

            //ДОБАВИТЬ СТАТУС ЦЕЛИ
           
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/EditGoalScreen');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
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