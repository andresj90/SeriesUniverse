
import 'package:flutter/material.dart';
import 'package:todo_series/screens/series_detail/index.dart';

class AppCard {
   
   final String cardImage; 
   final String mainTitle;  
   final BuildContext contextsite; 
   final String route; 
   var listEpisodes = [];
   final String cast; 
   final String genre; 
   final AnimatedIconData icon; 

   AppCard({
     this.cardImage,
     this.mainTitle,
     this.contextsite,
     this.route,
     this.listEpisodes,
     this.cast,
     this.genre,
     this.icon
   }); 
  
  

   Widget buildCard() {
     return Card (
       elevation: 5,
       child: InkWell(
         onTap: () => {
             Navigator.of(this.contextsite).push(_createRoute(this))
          
          //  Navigator.push(this.contextsite, 
          //  MaterialPageRoute(
          //   builder: (context) => SerieDetail(this),
          //  )      
          // )
         }, 
         child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
         children: <Widget>[
           Expanded(
             child: Image.asset(this.cardImage),
           ), 
          //  Text(this.mainTitle)
         ],
       )     ,
       ) 
       );
   }

    
 
}

  Route _createRoute(AppCard appcard) {
     return PageRouteBuilder(
       pageBuilder: (context, animation, secondaryAnimation) => SerieDetail(appcard),
       transitionsBuilder: (context, animation, secondaryAnimation, child){
          
         var begin = Offset(0.0, 1.0); 
         var end = Offset.zero; 
         
         var curve = Curves.easeInCirc; 
         
         var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve)); 
        //  var offsetAnimation = animation.drive(tween); 
         
         
         return SlideTransition(
           position: animation.drive(tween),
           child: child,
         );  

       }  
       );
   } 
