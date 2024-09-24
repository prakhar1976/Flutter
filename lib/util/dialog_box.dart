import 'package:flutter/material.dart';
import 'package:functional_todo/util/my_button.dart';
class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  VoidCallback onRename;
 DialogBox({super.key, required this.controller, 
 required this.onSave, required this.onCancel,required this.onRename});

  @override
  Widget build(BuildContext context) {
    return 
    AlertDialog(
      backgroundColor: Colors.blue.shade400,
      content: Container(height: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        TextField(
          controller: controller,
          decoration: InputDecoration(
           
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            hintText: 'Add a new task',
            hintStyle: TextStyle(color: Colors.white)
          ),
        ),
        Row(
         
          children: [
             
            MyButton(text: "Save", onPressed: onSave),
            const SizedBox(width: 8,),
            MyButton(text: 'Cancel', onPressed: onCancel),
          const SizedBox(width: 8,),
            MyButton(text: 'Rename', onPressed: onRename),
             
            

    
          ],
        )
      ],),),
    );
  }
}