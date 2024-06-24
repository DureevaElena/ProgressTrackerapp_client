import 'dart:convert';

import 'package:simpleengineering/constants.dart';
import 'package:simpleengineering/model/note_model.dart';
import 'package:simpleengineering/model/user_models.dart';
import 'package:http/http.dart' as http;

const noteEndpoint = "$baseUrl/note/";


Future<Note?> createCopyNewNote(User user, String title, String note, int cat,String dataend, int status) async {
  var uri = Uri.parse(noteEndpoint + "createNote/");
  Map data = {
    "authortodo": "${user.id}",
    "titletodo": title,
    "notetodo": note,
    "cattodo": "$cat",   
    "dataendtodo": dataend,
  "statustodo": "$status"
  };
  var res = await http.post(uri, body: data, headers: {
    'Authorization': 'Token ${user.token}',
  });

  if (res.statusCode == 200 || res.statusCode == 201) {
    var json = jsonDecode(res.body);
    return Note.fromJson(json);
  } else {
    return null;
  }
}



createNote(User user, String title, String note, int cat, String dataend, int status) async {
  var uri = Uri.parse(noteEndpoint + "createNote/");
  Map data = {"authortodo": "${user.id}", 
  "titletodo": title, 
  "notetodo": note,
  "cattodo" : "$cat",
  "dataendtodo": dataend,
  "statustodo": "$status"
  
  };
  var res = await http.post(uri, body: data, headers: {
    'Authorization': ' Token ${user.token}',
  });

  if (res.statusCode == 200 || res.statusCode == 201) {
    return true;
  } else {
    return false;
  }
}

Future<List<Note>> getNotes(User user, int cat) async {
  List<Note> notes = [];
  var uri = Uri.parse(noteEndpoint + "getListOfNotes/$cat");
  print(cat);
  var res = await http.get(uri, headers: {
    'Authorization': 'Token ${user.token}',
  });

  if (res.statusCode == 200) {
    var jsons = jsonDecode(res.body);
    for (var json in jsons) {
      notes.add(Note.fromJson(json));
    }
  }
  return notes;
}

Future<List<Note>> getStatusNotesTeky(User user) async {
  List<Note> notes = [];
  var uri = Uri.parse(noteEndpoint + "getListOfStatusNotesTeky/");
  var res = await http.get(uri, headers: {
    'Authorization': 'Token ${user.token}',
  });

  if (res.statusCode == 200) {
    var jsons = jsonDecode(res.body);
    for (var json in jsons) {
      notes.add(Note.fromJson(json));
    }
  }
  return notes;
}



Future<List<Note>> getStatusNotesOD(User user) async {
  List<Note> notes = [];
  var uri = Uri.parse(noteEndpoint + "getListOfStatusNotesOverdate/");
  var res = await http.get(uri, headers: {
    'Authorization': 'Token ${user.token}',
  });

  if (res.statusCode == 200) {
    var jsons = jsonDecode(res.body);
    for (var json in jsons) {
      notes.add(Note.fromJson(json));
    }
  }
  return notes;
}



Future<List<Note>> getStatusNotesEnd(User user) async {
  List<Note> notes = [];
  var uri = Uri.parse(noteEndpoint + "getListOfStatusNotesEnd/");
  var res = await http.get(uri, headers: {
    'Authorization': 'Token ${user.token}',
  });

  if (res.statusCode == 200) {
    var jsons = jsonDecode(res.body);
    for (var json in jsons) {
      notes.add(Note.fromJson(json));
    }
  }
  return notes;
}

Future<List<Note>> getNotesCommunity(User user) async {
  List<Note> notes = [];
  var uri = Uri.parse(noteEndpoint + "getListOfNotesCommunity/");
  var res = await http.get(uri, headers: {
    'Authorization': 'Token ${user.token}',
  });

  if (res.statusCode == 200) {
    var jsons = jsonDecode(res.body);
    for (var json in jsons) {
      notes.add(Note.fromJson(json));
    }
  }
  return notes;
}

Future<Note?> getNote(User user, int noteId) async {
  var uri = Uri.parse(noteEndpoint + "deleteUpdateNote/$noteId/");

  var res = await http.get(uri, headers: {
    'Authorization': ' Token ${user.token}',
  });

  if (res.statusCode == 200) {
    var json = jsonDecode(res.body);

    return Note.fromJson(json);
  }
  return null;
}

Future<bool> updateNote(User user, Note note) async {
  var uri = Uri.parse(noteEndpoint + "deleteUpdateNote/${note.id}/");

  var res = await http.put(uri, body: note.toJson(), headers: {
    'Authorization': ' Token ${user.token}',
  });
  print(res.body);
  print(json);
  if (res.statusCode == 200) {
    return true;
  }
  return false;
}

Future<bool> deleteNote(User user, int noteID) async {
  var uri = Uri.parse(noteEndpoint + "deleteUpdateNote/${noteID}/");

  var res = await http.delete(uri, headers: {
    'Authorization': ' Token ${user.token}',
  });
  if (res.statusCode == 200 || res.statusCode == 204) {
    return true;
  }
  return false;
}