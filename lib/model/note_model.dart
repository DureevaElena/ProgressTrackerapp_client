class Note {
  int id;
  Author author;
  String title;
  String note;
  int cat;
  String dataend;
  int status;

  Note(
    this.id,
    this.author,
    this.title,
    this.note,
    this.cat,
    this.dataend,
    this.status,
  );

  factory Note.fromJson(Map json) {
    return Note(
      json["id"],
      Author.fromJson(json["author"]),
      json["title"],
      json["note"] ?? "",
      json["cat"],
      json["dataend"] ?? "",
      json["status"], 
    );
  }

  Map<String, String> toJson() {
    return {
      "id": "$id",
      "author": "${author.id}",
      "title": title,
      "note": note,
      "cat": "$cat",
      "dataend": dataend,
      "status": "$status"
      
      
    };
  } 


}


class StageNote {
  int id;
  Author authorstage;
  String titlestage;
  String notestage;
  int idnote;
  int done;
 
  StageNote(
    this.id,
    this.authorstage,
    this.titlestage,
    this.notestage,
    this.idnote,
    this.done,

  );
  factory StageNote.fromJson(Map json) {
    return StageNote(
      json["id"],
      Author.fromJson(json["authorstage"]),
      json["titlestage"],
      json["notestage"],
      json["idnote"],
      json["done"],
    );
  }

  Map<String, String> toJson() {
    return {
      "id": "$id",
      "authorstage": "${authorstage.id}",
      "titlestage": titlestage,
      "notestage": notestage,
      "idnote":"$idnote",
      "done":"$done" 
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