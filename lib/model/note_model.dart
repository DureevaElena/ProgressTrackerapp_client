class Note {
  int id;
  Author authortodo;
  String titletodo;
  String notetodo;
  String note_picturetodo;
  int cattodo;
  String dataendtodo;
  int statustodo;

  Note(
    this.id,
    this.authortodo,
    this.titletodo,
    this.notetodo,
    this.cattodo,
    this.dataendtodo,
    this.statustodo,
    this.note_picturetodo
  );

  factory Note.fromJson(Map json) {
    return Note(
      json["id"],
      Author.fromJson(json["authortodo"]),
      json["titletodo"],
      json["notetodo"] ?? "",
      json["cattodo"],
      json["dataendtodo"] ?? "",
      json["statustodo"], 
      json["note_picturetodo"] ?? "",
    );
  }

  Map<String, String> toJson() {
    return {
      "id": "$id",
      "authortodo": "${authortodo.id}",
      "titletodo": titletodo,
      "notetodo": notetodo,
      "cattodo": "$cattodo",
      "dataendtodo": dataendtodo,
      "statustodo": "$statustodo",
      "note_picturetodo":note_picturetodo
      
      
    };
  } 
}


class StageNote {
  int id;
  int authorstagetodo;
  String titlestagetodo;
  String notestagetodo;
  int idnotetodo;
  int donetodo;
 
  StageNote(
    this.id,
    this.authorstagetodo,
    this.titlestagetodo,
    this.notestagetodo,
    this.idnotetodo,
    this.donetodo,

  );
  factory StageNote.fromJson(Map json) {
    return StageNote(
      json["id"],
      json["authorstagetodo"],
      json["titlestagetodo"],
      json["notestagetodo"],
      json["idnotetodo"],
      json["donetodo"],
    );
  }

  Map<String, String> toJson() {
    return {
      "id": "$id",
      "authorstagetodo": "$authorstagetodo",
      "titlestagetodo": titlestagetodo,
      "notestagetodo": notestagetodo,
      "idnotetodo":"$idnotetodo",
      "donetodo":"$donetodo" 
    };
  } 
}

class Author {
  int id;
  String nickname;
  String? profile_picture;
  String email;

  Author(
    this.id,
    this.nickname,
    this.profile_picture,
    this.email,
  );

  factory Author.fromJson(Map json) {
    return Author(
      json["id"],
      json["nickname"],
      json["profile_picture"],
      json["email"],
    );
  }
}




class Password {
  String encoded_pk;
  String token;

 
  Password(

    this.encoded_pk,
    this.token,


  );
  factory Password.fromJson(Map json) {
    return Password(
      json["encoded_pk"],
      json["token"],
    );
  }

  Map<String, String> toJson() {
    return {
      "titlestage": encoded_pk,
      "token": token,
    };
  } 
}