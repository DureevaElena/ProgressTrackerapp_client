import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:simpleengineering/api/note/note_api.dart';
import 'package:simpleengineering/constants.dart';
import 'package:simpleengineering/model/note_model.dart';
import 'package:simpleengineering/model/user_cubit.dart';
import 'package:simpleengineering/model/user_models.dart';
import 'package:simpleengineering/pages/home/home.dart';
import 'package:http/http.dart' as http;

class UpdateNoteScreen extends StatefulWidget {
  final Note note;
  final int noteID;

  const UpdateNoteScreen({Key? key, required this.note, required this.noteID}) : super(key: key);

  @override
  State<UpdateNoteScreen> createState() => _UpdateNoteScreenState();
}

class _UpdateNoteScreenState extends State<UpdateNoteScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController dataendController = TextEditingController();
  int selectedStatus = 1;
  late User user;
  late Note note;

  DateTime? selectedDate;
 
  File? _image;
  final picker = ImagePicker();

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
      dataendController.text = DateFormat('yyyy-MM-dd').format(selectedDate!);
      selectedStatus = picked.isAfter(DateTime.now()) ? 1 : 2;
    });
  }
  }

  @override
  void initState() {
    user = context.read<UserCubit>().state;
    note = widget.note;
    titleController.text = note.titletodo;
    noteController.text = note.notetodo;
    dataendController.text = "${note.dataendtodo}";
    selectedStatus = note.statustodo;
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    noteController.dispose();
    dataendController.dispose();
    super.dispose();
  }

  Future<void> updateNoteAndSave() async {
    note.titletodo = titleController.text;
    note.notetodo = noteController.text;
    note.dataendtodo = dataendController.text;

    var success = await updateNote(user, note);
    if (success) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text("Цель успешно обновлена"),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text("Ошибка при обновлении"),
        ),
      );
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _uploadImage() async {
    if (_image == null) return;

    final uri = Uri.parse('$baseUrl/note/note/${widget.note.id}/update/');
    var request = http.MultipartRequest('PUT', uri);
    request.headers['Authorization'] = 'Token ${user.token}';
    request.files.add(await http.MultipartFile.fromPath('note_picturetodo', _image!.path));

    var response = await request.send();
    if (response.statusCode == 200) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text("Фото успешно загружено"),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text("Ошибка при загрузке фото"),
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        toolbarHeight: 100,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => HomePage()),
                (route) => false,
              );
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
        ),
        title: const Text(
          'Редактировать',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 35,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => updateNoteAndSave(),
            icon: const Icon(
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
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 150,
        width: 150,
        color: Colors.grey,
        child: _image == null
            ? const Center(
                child: Text(
                  'Нажми чтобы добавить фото',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              )
            : Image.file(_image!, fit: BoxFit.cover),
      ),
    ),
  ),
),
            SizedBox(height: 25),
            ElevatedButton.icon(
              onPressed: _uploadImage,
              icon: Icon(Icons.upload, color: Colors.white,
                      size: 30, 
                    ),
              label: const Text('Загрузить фото', style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 18,
                      ),),
                    style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 25, 25, 230),
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),


            ),),

            SizedBox(height: 50,),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(padding: EdgeInsets.only(left: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Название',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    ),
                    TextFormField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide: BorderSide(color: Colors.black,width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide: BorderSide(color: Color.fromARGB(255, 160, 160, 160),width: 2.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),

                    
                    const Padding(padding: EdgeInsets.only(left: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Описание',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    ),
                    TextFormField(
                      controller: noteController,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide: BorderSide(color: Colors.black,width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide: BorderSide(color: Color.fromARGB(255, 160, 160, 160),width: 2.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),


                    const Padding(padding: EdgeInsets.only(left: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Дата завершения',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    ),
                    TextFormField(
                      readOnly: true,
                      controller: dataendController,
                      onTap: () => _selectDate(context),
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide: BorderSide(color: Colors.black,width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide: BorderSide(color: Color.fromARGB(255, 160, 160, 160),width: 2.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),                    
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}

      
