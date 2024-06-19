import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:simpleengineering/api/note/note_api.dart';
import 'package:simpleengineering/model/note_model.dart';
import 'package:simpleengineering/model/user_cubit.dart';
import 'package:simpleengineering/model/user_models.dart';
import 'package:simpleengineering/pages/home/home.dart';

class UpdateNoteScreen extends StatefulWidget {
  final Note note;

  const UpdateNoteScreen({Key? key, required this.note}) : super(key: key);

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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dataendController.text = DateFormat('yyyy-MM-dd').format(selectedDate!);
      });
    }
  }

  @override
  void initState() {
    user = context.read<UserCubit>().state;
    note = widget.note;
    titleController.text = note.title;
    noteController.text = note.note;
    dataendController.text = "${note.dataend}";
    selectedStatus = note.status;
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
    note.title = titleController.text;
    note.note = noteController.text;
    note.dataend = dataendController.text;
    note.status = selectedStatus;

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
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255,229,229,229),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),

            SizedBox(height: 25,),
           
            Align(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                onPressed: () {
                    // Действие при нажатии кнопки "Добавить фото"
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 25, 25, 230),
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                  'Добавить фото',
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


                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Статус',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    DropdownButtonFormField<int>(
              value: selectedStatus,
              onChanged: (value) {
                setState(() {
                  selectedStatus = value!;
                });
              },
              items: const [
                DropdownMenuItem<int>(
                  value: 1,
                  child: Text('Текущие'),
                ),
                DropdownMenuItem<int>(
                  value: 2,
                  child: Text('Просроченные'),
                ),
                DropdownMenuItem<int>(
                  value: 3,
                  child: Text('Завершенные'),
                ),
              ],
                      decoration: const InputDecoration(
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
              
            ),
          ],
        ),
      ),
      ),
    );
  }
}

      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
