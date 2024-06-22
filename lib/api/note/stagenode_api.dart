import 'dart:convert';
import 'package:simpleengineering/constants.dart';
import 'package:simpleengineering/model/note_model.dart';
import 'package:simpleengineering/model/user_models.dart';
import 'package:http/http.dart' as http;
const noteEndpoint = "$baseUrl/note/";


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


createStageNote(User user, String titlestage, String notestage, int idnote, int done) async {
  var uri = Uri.parse(noteEndpoint + "createStageNote/");
  Map data = {"authorstagetodo": "${user.id}", 
  "titlestagetodo": titlestage, 
  "notestagetodo": notestage,
  "idnotetodo" : "$idnote",
  "donetodo" : "$done",
  
  };
  var res = await http.post(uri, body: data, headers: {
    'Authorization': ' Token ${user.token}',
  });
  print(res.body);
  var json = jsonDecode(res.body);
  print(json);

  if (res.statusCode == 200 || res.statusCode == 201) {
    return true;
  } else {
    return false;
  }
}


Future<bool> updateStageNote(User user, StageNote stageNote) async {
  var uri = Uri.parse(noteEndpoint + "deleteUpdateStageNote/${stageNote.id}/");

  var res = await http.put(uri, body: stageNote.toJson(), headers: {
    'Authorization': ' Token ${user.token}',
  });
  print(res.body);
  print(json);
  if (res.statusCode == 200) {
    //var json = jsonDecode(res.body);

    return true;
  }
  return false;
}

Future<bool> deleteStageNote(User user, int noteID) async {
  var uri = Uri.parse(noteEndpoint + "deleteUpdateStageNote/${noteID}/");

  var res = await http.delete(uri, headers: {
    'Authorization': ' Token ${user.token}',
  });
  //print(res.body);
  //print(json);
  if (res.statusCode == 200 || res.statusCode == 204) {
    // var json = jsonDecode(res.body);

    return true;
  }
  return false;
}