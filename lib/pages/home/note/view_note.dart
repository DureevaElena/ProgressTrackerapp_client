import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simpleengineering/model/note_model.dart';
import 'package:simpleengineering/pages/home/etap/etap.dart';
import 'package:simpleengineering/pages/home/home.dart';

class ViewNoteScreen extends StatelessWidget {
  final Note note;

  const ViewNoteScreen({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return HomePage();
              },
            ));
          }, 
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black ,
            size: 30,
          ),
        ),
        
        actions: [
          IconButton(
            onPressed: (){
              //Navigator.pushNamed(context, '/IndividualHomeScreenAuthorizedUser');
              //удалить

            }, 
            icon: const Icon(
              Icons.delete_rounded,
              color: Colors.black,
              size: 35,
            ),
          ),
        ],
        
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40.0),
          child: Column( // Оборачиваем Row в Column
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      //Navigator.pushNamed(context, '/ViewingCreatedGoalScreen');
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
                      Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EtapNoteScreen(noteId: note.id),
                      ),
                    );
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
body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            
            Align( 
                alignment: Alignment.center,
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255,229,229,229),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),

            SizedBox(height: 25,),

            Padding(
  padding: EdgeInsets.only(left: 20),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "${note.title}",
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 15),
      Text(
        "${note.note}",
        style: TextStyle(fontSize: 20),
      ),
      SizedBox(height: 15),
      Row(
        children: [
          Icon(Icons.calendar_month_outlined, size: 30),
          SizedBox(width: 5),
          Text(
            "${note.dataend}",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    ],
  ),
),

            SizedBox(height: 50,),
           
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  onPressed: () {
                    //Navigator.pushNamed(context, '/EditGoalScreen');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 25, 25, 230),
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Редактировать',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
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
      
      
      
//       Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Title: ${note.title}",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8),
//             Text(
//               "Author: ${note.author.nickname}",
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 8),
//             Text(
//               "Description: ${note.note}",
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 8),
//             Text(
//               "ID: ${note.id}",
//               style: TextStyle(fontSize: 16),
//             ),

            

//             OutlinedButton(
//                   onPressed: () {
//                     Navigator.of(context).push(
//                       MaterialPageRoute(
//                         builder: (context) => EtapNoteScreen(noteId: note.id),
//                       ),
//                     );
//                   },
//                   child: Text(
//                     "ЭТАПЫ",
//                     style: TextStyle(color: Colors.black),
//                   ),
//                 ),
//             OutlinedButton(
//             onPressed: () {
//               Navigator.of(context).pushAndRemoveUntil(
//                   MaterialPageRoute(builder: (context) => HomePage()),
//                   (route) => false);
//             },
//             child: Text(
//               "Exit",
//               style: TextStyle(color: const Color.fromARGB(255, 230, 10, 10)),
//             ),
//           )
//           ],
//         ),
//       ),
      
//     );
//   }
// }