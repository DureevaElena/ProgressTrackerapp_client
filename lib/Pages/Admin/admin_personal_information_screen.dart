import 'package:flutter/material.dart';

class AdminPersonalInformationScreen extends StatelessWidget {
  const AdminPersonalInformationScreen({Key? key}) : super(key: key);

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
                child: Text('Admin',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),  
                ),
              ),
            ),
            
            

            SizedBox(height: 400,),

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