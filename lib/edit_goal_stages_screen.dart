import 'package:flutter/material.dart';

class EditGoalStagesScreen extends StatelessWidget {
  const EditGoalStagesScreen({Key? key}) : super(key: key);

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
        title: const Text('Редактировать этап', 
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
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(2.0), // Высота линии
          child: Container(
            color: Colors.black, // Цвет линии
            height: 2.0, // Высота линии
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(left: 20),
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

            Padding(padding: EdgeInsets.only(left: 20),
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

            Padding(padding: EdgeInsets.only(left: 20),
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

            Row(
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