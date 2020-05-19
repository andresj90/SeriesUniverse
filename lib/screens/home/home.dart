import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:todo_series/widgets/card/card.dart';
import '../../widgets/appbar/index.dart';
import '../../services/series_data.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ApplicationBar myBar = ApplicationBar(
      appTitle: "Series Universe",
      isCenter: true,
  ); 
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      backgroundColor: Colors.brown[500],
      appBar: myBar.buildAppBar(),
      body: Column(
        children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  
                },
                controller: null,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.all(Radius.circular(25.0)), 
                       borderSide: BorderSide(color: Colors.white)
                    ),
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(
                      Icons.search, 
                      color: Colors.white,
                      ),
                    labelStyle: TextStyle(
                      color: Colors.white
                    )        
                ),
              ),
            ),
           Flexible(
             child: 
               OrientationBuilder(
                 builder: (context, orientation){
                      if (orientation == Orientation.portrait) {
                        return buildCards(SeriesData.seriesDataList, SeriesData.seriesLength, context, 2);
                      } else {
                        return buildCards(SeriesData.seriesDataList, SeriesData.seriesLength, context, 3);
                      }
                }
        
                )  
          )
        ],
      )
    );
  }
}



Widget buildCards(List cards, int totalcards, BuildContext mycontext, int columns) {
  return GridView.count(
    crossAxisCount: columns,
    children: List.generate(totalcards, (index){
      
      print(cards[index]["icon"]);
      AppCard mycard = new AppCard(cardImage: cards[index]["cover"], mainTitle: cards[index]["serieTitle"], contextsite : mycontext  , route : cards[index]["route"], 
      listEpisodes: cards[index]["episodes"], cast: cards[index]["cast"], genre: cards[index]["genre"], icon: cards[index]["icon"]);
      return mycard.buildCard();
        // return Text('hello');
    })
    );
}  

