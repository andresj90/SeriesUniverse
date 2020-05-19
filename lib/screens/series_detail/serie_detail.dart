import 'package:flutter/material.dart';
import 'package:todo_series/screens/series_detail/index.dart';
import 'package:todo_series/widgets/card/card.dart';
import '../../widgets/appbar/index.dart';


class SerieDetail extends StatefulWidget {
   final AppCard cardInfo; 
   
   SerieDetail(
     this.cardInfo
   );


  @override
  _SerieDetailState createState() => _SerieDetailState();
}




class _SerieDetailState extends State<SerieDetail> with SingleTickerProviderStateMixin {
    
   bool isPlaying;  
   double iconHeight = 28; 


    
   ApplicationBar applicationBar = new ApplicationBar(
     appTitle: 'Series Universe',
     isCenter: true
   ); 
  
    
   _SerieDetailState();
    

    Animation animation;

    AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: applicationBar.buildAppBar(),
       body: 
       
       OrientationBuilder(

         builder: (context, orientation) {
           if (orientation == Orientation.portrait) {

           return  Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: <Widget>[
                       buildSerieDescription(widget.cardInfo, context, applicationBar),
                         Padding(
                           padding: EdgeInsets.all(25),
                           child: Text('Episodes'),
                         ),
                       buildEpisodesButton(4, this),
                    //  seriesDescription(this.cardInfo), 
                       Flexible(
                         child: serieEpisodes(widget.cardInfo, this, controller, isPlaying)
                      ),
                       Padding(
                         padding: EdgeInsets.fromLTRB(0, 5, 20, 25),
                         child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            FlatButton(
                              onPressed: (() => {
                               Navigator.pop(context)
                              }), 
                              child: Text('Go Back'),
                                textColor: Colors.white,
                                color: Colors.brown[200],
                            ) 
                               ],
                               ),
                      ) 
                    ],
                  );
             
           } else {

             return 
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                     children: <Widget>[
                       Container(
                                margin: EdgeInsets.fromLTRB(25, 0, 0, 0),
                                child: 
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        FlatButton(
                                            onPressed: (() => {
                                            Navigator.pop(context)
                                            }), 
                                            child: Text('Go Back'),
                                              textColor: Colors.white,
                                              color: Colors.brown[200],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 10),
                                          child: Text(
                                            "SHOWS"
                                          ),
                                        )
                                      ],
                                    ), 
                                    Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 10),
                                          child: Icon(Icons.settings),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 10),
                                          child: Icon(Icons.search),
                                        )
                                      ],
                                    )
                                  ],
                                )
                       ), 
                       Flexible(
                         child: buildLandscapeView(widget.cardInfo, this, controller, isPlaying)
                       ),
                        
                     ]       
              );
           }
         }
         
         )
    );

    
  
  }
  
}



Widget seriesDescription(var serie) {
    return Column(
      children: <Widget>[
         Text(
           'Title : ${serie.mainTitle}'
         ), 
         Text(
            'Genre : ${serie.genre}'
         ),
         Text(
            'Cast : ${serie.cast}'
         ),
      ],
    );
}

Widget serieEpisodes(var serie, _SerieDetailState stateful, AnimationController controller, var isPlaying) {
   


  return ListView.builder(
  padding: const EdgeInsets.all(8),
  itemCount: serie.listEpisodes.length,
  itemBuilder: (BuildContext context, int index) {
    return ListTile(
            leading: AnimatedIcon
            (
              icon: serie.icon,
              progress: controller
            ),
            subtitle: Text("Episode ${index+1}"),
            
            title: Text(serie.listEpisodes[index].toString()),
            onTap: (() => {
             
              stateful.setState(()=> {
              
              
                 if(controller.value == 0.000) {
                   controller.forward() 
                 } else {
                   controller.reverse()
                 }
               
                
                
              })
            }),
        
       
    );
  }
);
}




Widget buildEpisodesButton(int botons, _SerieDetailState state) {
  var mycolor = Colors.white;
  List<Widget> butons = List(); 
  for (var i = 0; i < botons; i++) {
      butons.add(
        GestureDetector(
                  child: AnimatedContainer(
                  margin: EdgeInsets.fromLTRB(5,0, 10,10),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.brown[200]),
                    color:  mycolor,

                  ),
                  child: Text((i+1).toString()),
                  duration: Duration(seconds: 1),
                  curve: Curves.fastOutSlowIn,
                ),
                 onTap: () {
                   state.setState(() {
                   mycolor = Colors.brown[200];
                   print(mycolor.toString());
                 });
      },
        )
      );        
                
  }
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: butons,
  );
}

Widget seriesDetailsInfo(var serie) {
  return Container(
    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
    child: Column(
      children: <Widget>[
        ListTile(
          title: Text('Title'),
          subtitle: Text(serie.mainTitle),
        ),
        ListTile(
          title: Text('Genre'),
          subtitle: Text(serie.genre),
        ),
        ListTile(
          title: Text('Cast'),
          subtitle: Text(serie.cast),
        ),
      ],
    ),
  );
}


Widget buildSerieDescription(var serie, BuildContext context, ApplicationBar applicationBar) {
  return 
   Padding(
     padding: const EdgeInsets.all(15.0),
     child: Row(
      mainAxisAlignment: MainAxisAlignment.start, 
      children: <Widget>[
        Expanded(
          flex: 1,
          child: buildAnimationTransition(serie, context, applicationBar), 
        ), 
        Expanded(
          child: 
        seriesDetailsInfo(serie)
          
          )
      ],
  ),
   );
}


//Landscape views

Widget buildLandscapeView(var serieObject, _SerieDetailState stateful, AnimationController controller, bool isPlaying) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        child: Row(
           children: <Widget>[
             Flexible(
                 child: Image.asset(
                 serieObject.cardImage
               ),
             ),
             Flexible(
               child: serieEpisodes(serieObject.listEpisodes, stateful,controller, isPlaying)
               )
           ],
        ),
      );
}

//build PHOTOHERO ANIMATION

Widget buildAnimationTransition(var serieObject,  BuildContext context, ApplicationBar applicationBar) {
  return PhotoHero(
    photo: serieObject.cardImage,
    width: double.infinity,
    onTap: () {
            Navigator.of(context).push(MaterialPageRoute<void>(
              builder: (BuildContext context) {
                return Scaffold(
                  appBar: applicationBar.buildAppBar(),
                  body: Container(
                     color: Colors.brown[300],
                      child: Column(
                       
                      children: <Widget>[
                        Expanded(
                          
                          child: Container(

                      // The blue background emphasizes that it's a new route.
                         
                          padding: const EdgeInsets.all(16.0),
                          alignment: Alignment.topCenter,
                          child: PhotoHero(
                              photo: serieObject.cardImage,
                              width: 500,
                              onTap: () {
                                Navigator.of(context).pop();
                            },
                                  ),
                                ),
                          ),
                          Expanded(child: 
                          Text(serieObject.mainTitle, style: TextStyle(fontSize: 35 , color: Colors.white),)
                          )
                      ],
                    ),
                  )
                );
              }
            ));
          },
        );
}


class PhotoHero extends StatelessWidget {
  const PhotoHero({ Key key, this.photo, this.onTap, this.width }) : super(key: key);

  final String photo;
  final VoidCallback onTap;
  final double width;

  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.asset(
              photo,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ),
    );
  }
}

