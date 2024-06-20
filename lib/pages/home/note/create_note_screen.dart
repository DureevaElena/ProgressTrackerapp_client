
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:simpleengineering/api/note/note_api.dart';
import 'package:simpleengineering/model/user_cubit.dart';
import 'package:simpleengineering/model/user_models.dart';
import 'package:simpleengineering/pages/home/home.dart';

class CreateNoteScreen extends StatefulWidget {
  const CreateNoteScreen({super.key});

  @override
  State<CreateNoteScreen> createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends State<CreateNoteScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController dataendController = TextEditingController();
  
  int selectedCat = 1;
  int selectedStatus = 1;

  late User user;
  DateTime? selectedDate;
  DateTime currentDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    user = context.read<UserCubit>().state;
    // Установка начальной даты завершения и статуса
    selectedDate = currentDate;
    dataendController.text = DateFormat('yyyy-MM-dd').format(selectedDate!);
    updateStatus();
  }

  void updateStatus() {
    if (currentDate.isBefore(selectedDate!)) {
      setState(() {
        selectedStatus = 1; 
      });
    } else {
      setState(() {
        selectedStatus = 2; 
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: selectedDate ?? DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime(2100), // Примерная граница в будущем
  );
  if (picked != null && picked != selectedDate && picked.isAfter(DateTime.now())) {
    setState(() {
      selectedDate = picked;
      dataendController.text = DateFormat('yyyy-MM-dd').format(selectedDate!);
      updateStatus(); // Обновляем статус при изменении даты
    });
  }
}
  
  @override
  void dispose() {
    titleController.dispose();
    noteController.dispose();
    dataendController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return HomePage();
              },
            ));
          }, 
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black ,
            size: 30,
          ),
        ),
        title: const Text('Создать цель', 
        style: TextStyle(
          fontFamily: 'Montserrat', 
          fontSize: 35)
        ),
        
        actions: [
          IconButton(
            onPressed: () async {
              
                var a = await createNote(
                  user,
                  titleController.text,
                  noteController.text,
                  selectedCat,
                  dataendController.text,
                  selectedStatus


                );
                if (a) {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => HomePage()),
                    (route) => false,
                  );
                }
              
            },
            icon: Icon(
              Icons.check,
              color: Colors.black,
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
