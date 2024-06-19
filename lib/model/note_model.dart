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
      json["note"],
      json["cat"],
      json["dataend"],
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
 
  StageNote(
    this.id,
    this.authorstage,
    this.titlestage,
    this.notestage,
    this.idnote,

  );
  factory StageNote.fromJson(Map json) {
    return StageNote(
      json["id"],
      Author.fromJson(json["authorstage"]),
      json["titlestage"],
      json["notestage"],
      json["idnote"],
  
      
      
      
    );
  }

  Map<String, String> toJson() {
    return {
      "id": "$id",
      "authorstage": "${authorstage.id}",
      "titlestage": titlestage,
      "notestage": notestage,
      "idnote":"$idnote",

      
      
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