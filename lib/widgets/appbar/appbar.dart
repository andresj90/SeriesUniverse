import 'package:flutter/material.dart';

class ApplicationBar {
  
   final String appTitle; 
   final bool isCenter; 

   //create class 
   ApplicationBar({
     this.appTitle, 
     this.isCenter,
   }); 

   Widget buildAppBar() {
    return AppBar(
      title: Text(appTitle),
      centerTitle: isCenter,
      backgroundColor: Colors.brown[300],
    ); 
   }
}