// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:simpleengineering/api/note/note_api.dart';
// import 'package:simpleengineering/model/note_model.dart';
// import 'package:simpleengineering/model/user_cubit.dart';
// import 'package:simpleengineering/pages/home/home.dart';
// import 'package:simpleengineering/pages/home/note/viewcat2_note.dart';

// class CatEtapNoteScreen extends StatefulWidget {
//   final Note note;

//   const CatEtapNoteScreen({super.key, required this.note});

//   @override
//   State<CatEtapNoteScreen> createState() => _CatEtapNoteScreenState();
// }

// class _CatEtapNoteScreenState extends State<CatEtapNoteScreen> {
//   late int noteId;

//   @override
//   void initState() {
//     super.initState();
//     noteId = widget.note.id;
//   }

//   @override
//   Widget build(BuildContext context) {
//     Note noteforcreatstage = widget.note;

//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 100,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.of(context).push(MaterialPageRoute(
//               builder: (context) {
//                 return HomePage();
//               },
//             ));
//           },
//           icon: const Icon(
//             Icons.arrow_back,
//             color: Colors.black,
//             size: 30,
//           ),
//         ),
//         title: Text("Статус: ${noteforcreatstage.status}"),
//         bottom: PreferredSize(
//           preferredSize: const Size.fromHeight(40.0),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   TextButton(
//                     onPressed: () {
//                       Navigator.of(context).push(
//                         MaterialPageRoute(
//                           builder: (context) => CatViewNoteScreen(note: noteforcreatstage),
//                         ),
//                       );
//                     },
//                     child: const Text(
//                       'Описание',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {},
//                     child: const Text(
//                       'Этапы',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Container(
//                 color: Colors.black,
//                 height: 2.0,
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: noteforcreatstage.title.isEmpty
//           ? Center(
//               child: Text(
//                 'Нет созданных этапов',
//                 style: TextStyle(fontSize: 20),
//               ),
//             )
//           : Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: noteforcreatstage.title.length,
//                     itemBuilder: (context, index) {
//                       final notestage = noteforcreatstage.title[index];
//                       return ListTile(
//                         title: Text(notestage.titlestage),
//                         subtitle: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text("${notestage.id}"),
//                             Text(notestage.authorstage.nickname),
//                             Text("${notestage.idnote}"),
//                             Text(
//                               notestage.notestage.length > 20
//                                   ? notestage.notestage.substring(0, 20) + "..."
//                                   : notestage.notestage,
//                             ),
//                             Text("${notestage.done}"),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//     );
//   }
// }
