import 'package:flutter/material.dart';

class UpdatePersonalPage extends StatefulWidget {
  const UpdatePersonalPage({Key? key}) : super(key: key);

  @override
  State<UpdatePersonalPage> createState() => _UpdatePersonalState();
}

class _UpdatePersonalState extends State<UpdatePersonalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            
            Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 229,229,229),
                shape: BoxShape.circle,
              ),
            ),

            
            
          ],
        ), 
      ),
    );
  }
}
      
      
