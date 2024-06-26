import 'package:flutter/material.dart';

class ChangePasswordFormScreen extends StatelessWidget {
  const ChangePasswordFormScreen({Key? key}) : super(key: key);

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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            SizedBox(height: 30,),
            const Text('Смена пароля',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                ),
            ),
            SizedBox(height: 50,),
            const Padding(padding: EdgeInsets.only(left: 10),
            child: Align(
              alignment: Alignment.centerLeft,
                child: Text('Новый пароль',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),  
                ),
              ),
            ),

            const TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  borderSide: BorderSide(color: Colors.black,width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  borderSide: BorderSide(color: Color.fromARGB(255, 160, 160, 160),width: 2.0),
                ),
              ),
            ),
            SizedBox(height: 15,),

            const Padding(padding: EdgeInsets.only(left: 10),
            child: Align(
              alignment: Alignment.centerLeft,
                child: Text('Повторите пароль',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),  
                ),
              ),
            ),

            const TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  borderSide: BorderSide(color: Colors.black,width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  borderSide: BorderSide(color: Color.fromARGB(255, 160, 160, 160),width: 2.0),
                ),
              ),
            ),
            SizedBox(height: 15,),

            
            Align(alignment: Alignment.bottomLeft,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/IndividualHomeScreenAuthorizedUser');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 25, 25, 230),
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                ),
                child: const Text(
                  'Сохранить',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontSize: 20,
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