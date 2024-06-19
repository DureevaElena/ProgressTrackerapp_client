import 'dart:convert';

import 'package:simpleengineering/constants.dart';
import 'package:simpleengineering/model/note_model.dart';
import 'package:simpleengineering/model/user_models.dart';
import 'package:http/http.dart' as http;

const noteEndpoint = "$baseUrl/note/";


// createNote(User user, String title, String note, int cat) async {
//   var uri = Uri.parse(noteEndpoint + "createNote/");
//   Map data = {"author": "${user.id}", 
//   "title": title, 
//   "note": note,
//   "cat" : "$cat"
  
//   };
//   var res = await http.post(uri, body: data, headers: {
//     'Authorization': ' Token ${user.token}',
//   });
//   // print(res.body);
//   // var json = jsonDecode(res.body);
//   // print(json);

//   if (res.statusCode == 200 || res.statusCode == 201) {
//     return true;
//   } else {
//     return false;
//   }
// }

Future<List<StageNote>> getStageNotes(User user, int idnote) async {
  List<StageNote> notes = [];
  var uri = Uri.parse(noteEndpoint + "getListOfStageNotes/$idnote");
  print(idnote);
  var res = await http.get(uri, headers: {
    'Authorization': 'Token ${user.token}',
  });

  if (res.statusCode == 200) {
    var jsons = jsonDecode(res.body);
    for (var json in jsons) {
      notes.add(StageNote.fromJson(json));
    }
  }
  return notes;
}

// Future<List<Note>> getNotesCommunity(User user) async {
//   List<Note> notes = [];
//   var uri = Uri.parse(noteEndpoint + "getListOfNotesCommunity/");
//   var res = await http.get(uri, headers: {
//     'Authorization': 'Token ${user.token}',
//   });

//   if (res.statusCode == 200) {
//     var jsons = jsonDecode(res.body);
//     for (var json in jsons) {
//       notes.add(Note.fromJson(json));
//     }
//   }
//   return notes;
// }

// Future<Note?> getNote(User user, int noteId) async {
//   var uri = Uri.parse(noteEndpoint + "deleteUpdateNote/$noteId/");

//   var res = await http.get(uri, headers: {
//     'Authorization': ' Token ${user.token}',
//   });
//   // print(res.body);
//   // print(json);
//   if (res.statusCode == 200) {
//     var json = jsonDecode(res.body);

//     return Note.fromJson(json);
//   }
//   return null;
// }

// Future<bool> updateNote(User user, Note note) async {
//   var uri = Uri.parse(noteEndpoint + "deleteUpdateNote/${note.id}/");

//   var res = await http.put(uri, body: note.toJson(), headers: {
//     'Authorization': ' Token ${user.token}',
//   });
//   // print(res.body);
//   // print(json);
//   if (res.statusCode == 200) {
//     // var json = jsonDecode(res.body);

//     return true;
//   }
//   return false;
// }

// Future<bool> deleteNote(User user, int noteID) async {
//   var uri = Uri.parse(noteEndpoint + "deleteUpdateNote/${noteID}/");

//   var res = await http.delete(uri, headers: {
//     'Authorization': ' Token ${user.token}',
//   });
//   // print(res.body);
//   // print(json);
//   if (res.statusCode == 200 || res.statusCode == 204) {
//     // var json = jsonDecode(res.body);

//     return true;
//   }
//   return false;
// }