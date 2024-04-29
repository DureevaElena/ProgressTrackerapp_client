import 'package:flutter/material.dart';

class CreateGoalScreen extends StatelessWidget {
  const CreateGoalScreen({Key? key}) : super(key: key);

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
        title: const Text('Создать цель', 
        style: TextStyle(
          fontFamily: 'Montserrat', 
          fontSize: 35)
        ),
        actions: [
          IconButton(
            onPressed: (){
              //Navigator.pushNamed(context, '/IndividualHomeScreenAuthorizedUser');

            }, 
            icon: const Icon(
              Icons.check,
              color: Colors.black,
              size: 35,
            ),
          ),
        ],
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
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),

            SizedBox(height: 25,),
           
            Align(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                onPressed: () {
                    // Действие при нажатии кнопки
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
                  'Добавить фото',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  ),
                  SizedBox(width: 8),
                  Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.white,
                      size: 20,
                  ),
                  ],
                ),
              ),
            ),

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

            const Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide: BorderSide(color: Colors.black,width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide: BorderSide(color: Colors.pink,width: 2.0),
                        ),
                      ),
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

            const Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide: BorderSide(color: Colors.black,width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide: BorderSide(color: Colors.pink,width: 2.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 15,),

            const Padding(padding: EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.centerLeft,
                child: Text('Дата завершения',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),  
                ),
              ),
            ),

            const Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide: BorderSide(color: Colors.black,width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide: BorderSide(color: Colors.pink,width: 2.0),
                        ),
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
    );
  }
}