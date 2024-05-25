import 'package:flutter/material.dart';


class AdminUsersScreen extends StatelessWidget {
  const AdminUsersScreen({Key? key}) : super(key: key);

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
            Navigator.pushNamed(context, '/AdminPersonalInformationScreen');
          }, 
          icon: Icon(Icons.account_box_outlined),
          color: Colors.black,
          iconSize: 40,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(2.0),
          child: Container(
            color: Colors.black,
            height: 2.0,
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
              TextButton(
                onPressed: () {
                  
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 14, 122, 218),
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
                ),
                
                child: const Text(
                  'Пользователи',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  
                ),
              ),

              SizedBox(width: 10),

              TextButton(
                onPressed: () {
                  //Navigator.pushNamed(context, '/CommunityHomeScreenAuthorizedUser');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 194,217,238),
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
                ),
                child: const Text(
                  'Общие',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),

            ],
          ),
          SizedBox(height: 20),

        ],
        ),
      ),
      
    );
  }
}