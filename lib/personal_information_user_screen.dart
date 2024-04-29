import 'package:flutter/material.dart';

class PersonalInformationUserScreen extends StatelessWidget {
  const PersonalInformationUserScreen({Key? key}) : super(key: key);

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
        title: const Text('ProgressTracker', 
        style: TextStyle(
          fontFamily: 'Montserrat', 
          fontSize: 35)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            
            Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
            ),

            SizedBox(height: 15,),
           
            Align(alignment: Alignment.bottomCenter,
              child: TextButton(
                onPressed: () {
                  //Navigator.pushNamed(context, '/IndividualHomeScreenAuthorizedUser');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                ),
                child: const Text(
                  'Редактировать профиль',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),

            SizedBox(height: 50,),
            const Padding(padding: EdgeInsets.only(left: 10),
            child: Align(
              alignment: Alignment.centerLeft,
                child: Text('Имя',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),  
                ),
              ),
            ),
            SizedBox(height: 5,),
            const Padding(padding: EdgeInsets.only(left: 10),
            child: Align(
              alignment: Alignment.centerLeft,
                child: Text('YouName',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),  
                ),
              ),
            ),
            SizedBox(height: 10,),
            const Padding(padding: EdgeInsets.only(left: 10),
            child: Align(
              alignment: Alignment.centerLeft,
                child: Text('Дата рождения',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),  
                ),
              ),
            ),
            SizedBox(height: 5,),
            const Padding(padding: EdgeInsets.only(left: 10),
            child: Align(
              alignment: Alignment.centerLeft,
                child: Text('26.05.2006',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),  
                ),
              ),
            ),

            SizedBox(height: 10,),
            const Padding(padding: EdgeInsets.only(left: 10),
            child: Align(
              alignment: Alignment.centerLeft,
                child: Text('Почта',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),  
                ),
              ),
            ),
            SizedBox(height: 5,),
            const Padding(padding: EdgeInsets.only(left: 10),
            child: Align(
              alignment: Alignment.centerLeft,
                child: Text('youname@gmail.com',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),  
                ),
              ),
            ),

            SizedBox(height: 10,),

            Align(alignment: Alignment.bottomLeft,
              child: TextButton(
                onPressed: () {
                  //Navigator.pushNamed(context, '/IndividualHomeScreenAuthorizedUser');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                ),
                child: const Text(
                  'Текущие цели',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Align(alignment: Alignment.bottomLeft,
              child: TextButton(
                onPressed: () {
                  //Navigator.pushNamed(context, '/IndividualHomeScreenAuthorizedUser');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                ),
                child: const Text(
                  'Просроченные цели',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Align(alignment: Alignment.bottomLeft,
              child: TextButton(
                onPressed: () {
                  //Navigator.pushNamed(context, '/IndividualHomeScreenAuthorizedUser');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                ),
                child: const Text(
                  'Завершенные цели',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),

            SizedBox(height: 30,),

            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/HomeScreenUnauthorizedUser');
              },
              
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.exit_to_app),
                  const SizedBox(width: 5,),
                  const Text(
                  'Выйти',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ],
                
              ),
            ),
            
              


            

            
          ],
        ), 
      ),
    );
  }
}