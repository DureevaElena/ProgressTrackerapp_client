import 'dart:convert';
import 'dart:io';
import 'package:simpleengineering/constants.dart';
import 'package:simpleengineering/model/user_models.dart';
import 'package:http/http.dart' as http;
const noteEndpoint = "$baseUrl/user/users/";



Future<List<User>> getUsers() async {
  final response = await http.get(Uri.parse('$baseUrl/user/users/'));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((user) => User.fromJson(user)).toList();
  } else {
    throw Exception('Failed to load users');
  }
}

Future<bool> deleteUser(User user, int userID) async {
  var uri = Uri.parse("$noteEndpoint${userID}/");

  var res = await http.delete(uri, headers: {
    'Authorization': ' Token ${user.token}',
  });
  // print(res.body);
  // print(json);
  if (res.statusCode == 200 || res.statusCode == 204) {
    // var json = jsonDecode(res.body);

    return true;
  }
  return false;
}



Future<bool> updateUser(User user) async {
  var uri = Uri.parse("$baseUrl/user/deleteUpdateUser/${user.id}/");
  print(user.id);
  var res = await http.put(
    uri,
    body: jsonEncode(user.toJson()),
    headers: {
      'Authorization': 'Token ${user.token}',
      'Content-Type': 'application/json',
    },
  );
  print(res.body);
  print(res.statusCode);
  if (res.statusCode == 200) {
    return true;
  }
  return false;
}



Future<bool> updateProfilePicture(User user, File imageFile) async {
  var uri = Uri.parse("$baseUrl/user/profile/update/");
  var request = http.MultipartRequest('PUT', uri)
    ..headers['Authorization'] = 'Token ${user.token}'
    ..files.add(await http.MultipartFile.fromPath('profile_picture', imageFile.path));

  var response = await request.send();
  

  print(response.statusCode);
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}
