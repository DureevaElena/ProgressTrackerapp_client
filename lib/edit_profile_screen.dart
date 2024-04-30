import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

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
        title: const Text('Редактировать', 
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
                  'Изменить фото',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),

            SizedBox(height: 50,),


            
            const Padding(padding: EdgeInsets.only(left: 20),
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

            const Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "YouName",
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
                child: Text('Дата рождения',
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
                        hintText: "26.05.2006",
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
                child: Text('Почта',
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
                        hintText: "youname@gmail.com",
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