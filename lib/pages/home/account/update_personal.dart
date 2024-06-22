import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:simpleengineering/api/note/user_api.dart';
import 'package:simpleengineering/constants.dart';
import 'package:simpleengineering/model/user_cubit.dart';
import 'package:simpleengineering/model/user_models.dart';
import 'package:simpleengineering/pages/home/account/personal.dart';

class UpdatePersonalPage extends StatefulWidget {
  final User user;

  const UpdatePersonalPage({Key? key, required this.user}) : super(key: key);

  @override
  State<UpdatePersonalPage> createState() => _UpdatePersonalPageState();
}

class _UpdatePersonalPageState extends State<UpdatePersonalPage> {
  TextEditingController nicknameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController photoDateController = TextEditingController();

  late User user;
  File? _image;
  final ImagePicker _picker = ImagePicker();

  DateTime? selectedDate;


  @override
  void initState() {
    super.initState();
    user = widget.user;
    nicknameController.text = user.nickname ?? '';
    emailController.text = user.email ?? '';
    birthDateController.text = user.birthDate ?? '';
    //photoDateController.text = user.profile_picture ?? '';
    if (user.profile_picture != null) {
      _image = File("${user.profile_picture}"); 
    }    
  }

  @override
  void dispose() {
    nicknameController.dispose();
    emailController.dispose();
    birthDateController.dispose();
    //photoDateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now().add(Duration(days: 36500)),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        birthDateController.text = DateFormat('yyyy-MM-dd').format(selectedDate!);
      });
    }
  }

  Future<void> _pickImage() async {
  final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

  setState(() {
    if (pickedFile != null) {
      _image = File(pickedFile.path); // Обновляем выбранное изображение
    } else {
      print('No image selected.');
    }
  });
  }

  
  Future<void> _updateTextFields() async {
    user.nickname = nicknameController.text;
    user.email = emailController.text;
    user.birthDate = birthDateController.text;
    
   
  }

  

  Future<void> _updateProfile() async {
    await _updateTextFields(); // Обновляем текстовые поля
    bool profileUpdated = await updateUser(user);
    


    if (profileUpdated) {
      Navigator.of(context).pop();
      widget.user.nickname = nicknameController.text;
      widget.user.email = emailController.text;
      widget.user.birthDate = birthDateController.text;
      //widget.user.profile_picture = photoDateController.text;
      



      setState(() {}); // Обновляем состояние в PersonalPage

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text('Профиль успешно обновлен'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Закрываем AlertDialog
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text('Ошибка при обновлении профиля'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Закрываем AlertDialog
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }




  Future<void> _showConfirmationDialog(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Подтвердите изменение фотографии"),
        content: Text("Вы уверены, что хотите изменить фотографию профиля?"),
        actions: <Widget>[
          TextButton(
            child: Text("Отмена"),
            onPressed: () {
              Navigator.of(context).pop(); // Закрыть диалоговое окно
            },
          ),
          TextButton(
            child: Text("Подтвердить"),
            onPressed: () {
              Navigator.of(context).pop(); // Закрыть диалоговое окно
              _updatePHOTO(); // Вызвать функцию обновления профиля
            },
          ),
        ],
      );
    },
  );
}

Future<void> _updatePHOTO() async {
  if (_image != null) {
    bool imageUploaded = await _updateProfilePicture(_image!);
    if (imageUploaded) {
      setState(() {
        _image = null; 
      });
    }
  }
}

Future<bool> _updateProfilePicture(File imageFile) async {
  var uri = Uri.parse("$baseUrl/user/profile/update/");
  var request = http.MultipartRequest('PUT', uri)
    ..headers['Authorization'] = 'Token ${user.token}'
    ..files.add(await http.MultipartFile.fromPath('profile_picture', imageFile.path));

  var response = await request.send();
  var responseData = await response.stream.toBytes();
  var responseString = String.fromCharCodes(responseData);
  var jsonResponse = jsonDecode(responseString);

  if (response.statusCode == 200) {
    setState(() {
      user.profile_picture = jsonResponse['profile_picture'];
    });
    return true;
  } else {
    return false;
  }
}

@override
Widget build(BuildContext context) {
  print("ЭТО КОНТРОЛЛЕР:   ${photoDateController.text}");

  return Scaffold(
    appBar: AppBar(
      toolbarHeight: 100,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PersonalPage(user: widget.user),
            ),
          );
        },
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
          size: 30,
        ),
      ),
      title: Text(
        'Редактировать',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 35,
        ),
      ),
      actions: [
        IconButton(
          onPressed: _updateProfile,
          icon: Icon(
            Icons.check,
            color: Colors.black,
            size: 35,
          ),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(2.0),
        child: Container(
          color: Colors.black,
          height: 2.0,
        ),
      ),
    ),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: _pickImage,
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 229, 229, 229),
                    borderRadius: BorderRadius.circular(30),
                    image: _image != null
                        ? DecorationImage(
                            image: FileImage(_image!),
                            fit: BoxFit.cover,
                          )
                        : user.profile_picture != null
                            ? DecorationImage(
                                image: NetworkImage('$baseUrl${user.profile_picture}'),
                                fit: BoxFit.cover,
                              )
                            : null,
                  ),
                  child: _image == null && user.profile_picture == null
                      ? Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.grey,
                          size: 50,
                        )
                      : null,
                ),
              ),
            ),
            SizedBox(height: 25),
            Align(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                onPressed: _pickImage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 25, 25, 230),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Изменить фото',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10), // Добавлен отступ между кнопками
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () => _showConfirmationDialog(context), // Изменено на вызов функции без ()
                    icon: Icon(Icons.check),
                    label: Text('Подтвердить выбор фото'),
                  ),
                ],
              ),
            ),

              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Имя',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: nicknameController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide: BorderSide(color: Colors.black, width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide: BorderSide(color: Color.fromARGB(255, 160, 160, 160), width: 2.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Почта',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide: BorderSide(color: Colors.black, width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide: BorderSide(color: Color.fromARGB(255, 160, 160, 160), width: 2.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Дата рождения',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      readOnly: true,
                      controller: birthDateController,
                      onTap: () => _selectDate(context),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide: BorderSide(color: Colors.black, width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide: BorderSide(color: Color.fromARGB(255, 160, 160, 160), width: 2.0),
                        ),
                      ),
                    ),
                    

                    
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
