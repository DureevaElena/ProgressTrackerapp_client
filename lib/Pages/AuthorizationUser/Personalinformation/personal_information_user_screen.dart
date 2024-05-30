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
          fontSize: 35)
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(2.0),
          child: Container(
            color: Colors.black,
            height: 2.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            
            Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 229,229,229),
                shape: BoxShape.circle,
              ),
            ),

            SizedBox(height: 15,),
           
            Align(alignment: Alignment.bottomCenter,
              child: TextButton(
                onPressed: () {
                Navigator.pushNamed(context, '/EditProfileScreen');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 25, 25, 230),
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

            Row(
              children: [
                Align(alignment: Alignment.bottomLeft,
                  child: TextButton(
                      onPressed: () {
                      Navigator.pushNamed(context, '/CurrentGoalsScreen');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 25, 25, 230),
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
                const Expanded(child: 
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text('10',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                  ),
                )
              ],
            ),

            SizedBox(height: 10,),
            Row(
              children: [
                Align(alignment: Alignment.bottomLeft,
                  child: TextButton(
                      onPressed: () {
                      Navigator.pushNamed(context, '/ExpiredGoalsScreen');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 25, 25, 230),
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
                const Expanded(child: 
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text('5',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                  ),
                )
              ],
            ),

            SizedBox(height: 10,),

            Row(
              children: [
                Align(alignment: Alignment.bottomLeft,
                  child: TextButton(
                      onPressed: () {
                      Navigator.pushNamed(context, '/CompletedGoalsScreen');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 25, 25, 230),
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
                const Expanded(child: 
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text('8',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                  ),
                )
              ],
            ),

            

            SizedBox(height: 30,),

            Align(
              alignment: Alignment.bottomLeft,
              child: IconButton(
                onPressed: () {
                Navigator.pushNamed(context, '/HomeScreenUnauthorizedUser');
                },
                icon: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.exit_to_app,
                      color: Colors.black,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Выйти',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
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