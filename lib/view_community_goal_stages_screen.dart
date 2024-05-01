import 'package:flutter/material.dart';

class ViewCommunityGoalStagesScreen extends StatefulWidget {
  const ViewCommunityGoalStagesScreen({Key? key}) : super(key: key);

  @override
  _ViewGoalStagesScreenState createState() => _ViewGoalStagesScreenState();
}

class _ViewGoalStagesScreenState extends State<ViewCommunityGoalStagesScreen> {
  late List<bool> isCompletedList;

  @override
  void initState() {
    super.initState();
    // Инициализируем список состояний выполнения задач
    isCompletedList = List<bool>.generate(10, (index) => false);
  }

  void toggleCompletion(int index) {
    setState(() {
      // Инвертируем состояние выполнения задачи по индексу
      isCompletedList[index] = !isCompletedList[index];
    });
  }

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
            color: Colors.black,
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
                      Navigator.pushNamed(context, '/ViewCommunityGoalScreen');
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
                      //Navigator.pushNamed(context, '/ViewCommunityGoalStagesScreen');
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
      body: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            leading: IconButton(
              onPressed: () {
                toggleCompletion(index);
              },
              icon: Icon(
                isCompletedList[index] ? Icons.check_circle : Icons.circle,
                size: 30,
                color: isCompletedList[index] ? const Color.fromARGB(255, 35, 159, 39) : Colors.black,
              ),
            ),
            title: Text(
              'Этап ${index + 1}',
              style: const TextStyle(
                fontSize: 28,
                color: Colors.black,
              ),
            ),
            
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            color: Colors.black,
            height: 5,
          );
        },
        itemCount: 6,
      ),
    );
  }
}
