import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:simpleengineering/api/auth/auth_api.dart';
import 'package:simpleengineering/first_screen.dart';
import 'package:simpleengineering/model/user_cubit.dart';
import 'package:simpleengineering/model/user_models.dart';
import 'package:simpleengineering/pages/home/home.dart';
import 'package:simpleengineering/there.dart';
import 'package:simpleengineering/widgets/fields.dart';
import 'package:simpleengineering/widgets/texxt_button.dart';

import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nicknameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController comfirmPassword = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  
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
        birthDateController.text = DateFormat('yyyy-MM-dd').format(selectedDate!);
      });
    }
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
                    return HomeScreenUnauthorizedUser();
                  },
                ));
        }, icon: const Icon(
          Icons.arrow_back,
          color: Colors.black ,
          size: 30,
          ),
        ),
        title: const Text('ProgressTracker', 
        style: TextStyle(
          fontFamily: 'Montserrat', 
          fontSize: 35)
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(2.0),
          child: Container(
            color: Colors.black,
            height: 2.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(padding: EdgeInsets.only(left: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Имя',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),),
              ),),
              TextFormField(
                controller: nicknameController,
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
                child: Text('Дата рождения',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),),
              ),),
              TextFormField(
                readOnly: true,
                controller: birthDateController,
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

              const Padding(padding: EdgeInsets.only(left: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('e-mail',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),),
              ),),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
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
                child: Text('Пароль',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),),
              ),),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
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
                child: Text('Повторите пароль',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),),
              ),),
              TextFormField(
                controller: comfirmPassword,
                decoration: InputDecoration(
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
          

              Align(
                alignment: Alignment.bottomLeft,
                child: TextButton(
                  onPressed: () async {
                  var authRes = await registerUser(
                  emailController.text,
                  nicknameController.text,
                  birthDateController.text,
                  passwordController.value.text,
                  comfirmPassword.text,);

              if (authRes.runtimeType == String) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      child: Container(
                          alignment: Alignment.center,
                          height: 200,
                          width: 250,
                          decoration: BoxDecoration(),
                          child: Text(authRes)),
                    );
                  },
                );
              } else if (authRes.runtimeType == User) {
                User user = authRes;
                context.read<UserCubit>().emit(user);
                
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return SignInPage();
                  },
                ));
              }
    },
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 25, 25, 230)),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 10, horizontal: 40)),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
    child: const Text(
      'Зарегистрироваться',
      style: TextStyle(
        fontFamily: 'Montserrat',
        color: Colors.white,
        fontSize: 20,
      ),
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
          