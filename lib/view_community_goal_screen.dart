import 'package:flutter/material.dart';

class ViewCommunityGoalScreen extends StatelessWidget {
  const ViewCommunityGoalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/CommunityHomeScreenAuthorizedUser');
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black ,
            size: 30,
          ),
        ),
        
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40.0),
          child: Column( // Оборачиваем Row в Column
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      //Navigator.pushNamed(context, '/EditGoalScreen');
                    },
                    child: const Text(
                      'Описание',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/ViewCommunityGoalStagesScreen');
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
              Container(
                color: Colors.black,
                height: 2.0,
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              const SizedBox(height: 25,),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Python за 6 месяцев',
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Занимаясь по 10 часов в день, на изучение всех этапов уйдёт около полугода – это цифры из собственного опыта, так что можно их брать в качестве начального ориентира, однако, возможно, у вас будут другие результаты.',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),  
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Icon(Icons.calendar_month_outlined, size: 30, color: Colors.black,),
                    SizedBox(width: 5),
                    Text(
                      '13.02.2024',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15,),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Icon(Icons.account_circle_outlined, size: 30, color: Colors.black,),
                    SizedBox(width: 5),
                    Text(
                      'hyeinomg',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15,),
              Align(
                alignment: Alignment.bottomLeft,
                child: IconButton(
                  onPressed: () {
                    //Navigator.pushNamed(context, '/HomeScreenUnauthorizedUser');
                  },
                  icon: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.favorite_border,
                        color: Colors.black,
                        size: 30,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Добавить к себе',
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
      ), 
    );
  }
}
