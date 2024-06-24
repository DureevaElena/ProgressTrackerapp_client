class User {
  int? id;
  String? token;
  String? username;
  String? email, profile_picture, first_name, last_name, nickname, birthDate, name_profile_picture;
  bool? is_superuser;

  User({
    this.email,
    this.first_name,
    this.last_name,
    this.id,
    this.username,
    this.nickname,
    this.birthDate,
    this.is_superuser,
    this.profile_picture,
    this.name_profile_picture
    
  });

  factory User.fromJson(Map<String, dynamic> json) {
    print(json);
    return User(
      email: json["email"],
      first_name: json["first_name"],
      id: json["pk"],
      last_name: json["last_name"],
      username: json["username"],
      nickname: json["nickname"],
      birthDate: json["birth_date"], 
      is_superuser: json["is_superuser"],
      profile_picture: json["profile_picture"],
      name_profile_picture: json["name_profile_picture"]
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "pk": id,
      "username": username,
      "email": email,
      "first_name": first_name,
      "last_name": last_name,
      "nickname": nickname,
      "birth_date": birthDate,
      //"is_superuser": is_superuser,
      "profile_picture": profile_picture,
      "name_profile_picture": name_profile_picture
    };
  }




}