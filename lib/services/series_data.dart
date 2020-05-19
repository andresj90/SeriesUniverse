import 'package:flutter/material.dart';

import '../data/serieList.dart' as data;

class SeriesData {
  
static List<dynamic> _series = [
  {
    "cover": 'assets/images/peakyblinders.jpeg', 
    "serieTitle": 'Peaky Blinders', 
     "route": "/seriedetail", 
     "episodes" : ["The Company", "The Duel", "Dangerous", 	"Blackbird", "Heathens",	"The Noose"],
     "cast": "Cillian Murphy, Helen McCrory, Tom Hardy, Adrien Brody", 
     "genre": "Crime, Drama",
     "icon" : AnimatedIcons.play_pause
  },

  {
    "cover": 'assets/images/strangerthings.jpg', 
    "serieTitle": 'Strangers Things', 
     "route": "/seriedetail", 
     "episodes" : ["The Vanishing of Will Byers", "The Weirdo on Maple Street", "Holly, Jolly", 	"The Body", "The Flea and the Acrobat",	"The Monster","The Bathtub", "The Upside Down"],
     "cast": "Millie Bobby Brown, Finn Wolfhard, Gaten Matarazzo, Caleb McLaughlin", 
     "genre": "science fiction, horror",
     "icon" : AnimatedIcons.play_pause
  },

  {
    "cover": 'assets/images/friends.jpg', 
    "serieTitle": 'Friends', 
    "route": "/seriedetail", 
    "episodes" : ["Pilot","The One with the Sonogram at the End"	, "The One with the Thumb", 		"The One with George Stephanopoulos"	, "The One with the East German Laundry Detergent",		"The One with the Butt", 	"The One with the Blackout", 	"The One Where Nana Dies Twice", 	"The One Where Underdog Gets Away"],
     "cast": "	Jennifer Aniston, Courteney Cox, Lisa Kudrow, Matt LeBlanc", 
     "genre": "sitcom",
     "icon" : AnimatedIcons.play_pause
  },

  {
    "cover": 'assets/images/thebigbangtheory.jpg', 
    "serieTitle": 'The Big Bang Theory', 
     "route": "/seriedetail", 
     "episodes" : ["Pilot", "The Big Bran Hypothesis"	, "The Fuzzy Boots Corollary", 	"The Luminous Fish Effect", "The Hamburger Postulate",	"The Middle-Earth Paradigm", "The Dumpling Paradox", 	"The Grasshopper Experiment", 	"The Cooper-Hofstadter Polarization"],
     "cast": "Jim Parsons, Kaley Cuoco, Simon Helberg,Kunal Nayyar", 
     "genre": "	Sitcom",
     "icon" : AnimatedIcons.play_pause
  },

  {
    "cover": 'assets/images/drakeandjosh.jpg', 
    "serieTitle": 'Drake and Josh', 
     "route": "/seriedetail", 
     "episodes" : ["Pilot", "Dune Buggy", "Believe Me, Brother", 	"Two Idiots and a Baby", "First Crush",	"Grammy"],
     "cast": "Drake Bell, Josh Peck,Miranda Cosgrove", 
     "genre": "Sitcom",
     "icon" : AnimatedIcons.play_pause
  },

  {
    "cover": 'assets/images/hannamontana.jpg', 
    "serieTitle": 'Hanna Montana', 
     "route": "/seriedetail", 
     "episodes" :  ["Lilly, Do You Want to Know a Secret?", "Miley Get Your Gum" , "She's a Supersneak", 	"I Can't Make You Love Hannah if You Don't", 	"It's My Party and I'll Lie if I Want To",	"Grandmas Don't Let Your Babies Grow Up to Play Favorites","It's a Mannequin's World", 	"Mascot Love", "Ooo, Ooo, Itchy Woman", "O Say, Can You Remember the Words?"],
     "cast": "Miley Cyrus, Emily Osment, Mitchel Musso, Jason Earles, Billy Ray Cyrus", 
     "genre": "Teen Sitcom",
     "icon" : AnimatedIcons.play_pause
  },

  {
    "cover": 'assets/images/casadepapel.png', 
    "serieTitle": 'La Casa de Papel', 
     "route": "/seriedetail", 
     "episodes" :  ["Lilly, Do You Want to Know a Secret?", "Miley Get Your Gum" , "She's a Supersneak", 	"I Can't Make You Love Hannah if You Don't", 	"It's My Party and I'll Lie if I Want To",	"Grandmas Don't Let Your Babies Grow Up to Play Favorites","It's a Mannequin's World", 	"Mascot Love", "Ooo, Ooo, Itchy Woman", "O Say, Can You Remember the Words?"],
     "cast": "Actor1, Actor2, Actor3", 
     "genre": "Suspense, Serie",
     "icon" : AnimatedIcons.play_pause
  },

  {
    "cover": 'assets/images/narutoshippuden.jpg', 
    "serieTitle": 'Naruto Shippuden', 
     "route": "/seriedetail", 
     "episodes" :  ["Lilly, Do You Want to Know a Secret?", "Miley Get Your Gum" , "She's a Supersneak", 	"I Can't Make You Love Hannah if You Don't", 	"It's My Party and I'll Lie if I Want To",	"Grandmas Don't Let Your Babies Grow Up to Play Favorites","It's a Mannequin's World", 	"Mascot Love", "Ooo, Ooo, Itchy Woman", "O Say, Can You Remember the Words?"],
     "cast": "Naruto Uzumaki, Sasuke Uchiha, Madara Uchiha, Obito Uchiha", 
     "genre": "Shonnen, Anime",
     "icon" : AnimatedIcons.play_pause
  },

  ]; 

  
  static get seriesDataList{
    return _series; 
  }  

  static get seriesLength{
    return _series.length; 
  }

}