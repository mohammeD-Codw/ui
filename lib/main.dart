import 'dart:ui';
import 'package:app00/models/authorsModel.dart';
import 'package:app00/screens/detailScreen.dart';
import 'package:app00/widgets/Authors.dart';
import 'package:app00/widgets/expandWid.dart';
import 'package:flutter/material.dart';
import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'Data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: ExpandableBottomSheet(
        background: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
              'assets/images/background.jpg',
            ),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: const EdgeInsets.only(top: 80.0, left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Browse',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Find podcast that suit your interest',
                  style: TextStyle(color: Colors.white70, fontSize: 17),
                ),
                SizedBox(height: 35),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Type Keyword',
                    hintStyle: TextStyle(color: Colors.white70),
                    fillColor: Colors.blueGrey.withOpacity(0.6),
                    filled: true,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 30, vertical: 17),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(children: [
                      CircleAvatar(
                        radius: 32,
                        child: Icon(Icons.star_rate_rounded),
                        backgroundColor: Colors.white,
                      ),
                      SizedBox(height: 10),
                      Text('Popular', style: TextStyle(color: Colors.white)),
                    ]),
                    //    SizedBox(width: 15),
                    Column(children: [
                      CircleAvatar(
                        radius: 32,
                        child: Icon(Icons.star_rate_rounded),
                        backgroundColor: Colors.white,
                      ),
                      SizedBox(height: 10),
                      Text('Trending', style: TextStyle(color: Colors.white)),
                    ]),
                    //   SizedBox(width: 15),
                    Column(children: [
                      CircleAvatar(
                        radius: 32,
                        child: Icon(Icons.star_rate_rounded),
                        backgroundColor: Colors.white,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Recent',
                        style: TextStyle(color: Colors.white),
                      ),
                    ]),
                    //   SizedBox(width: 15),
                    Column(children: [
                      CircleAvatar(
                        radius: 32,
                        child: Icon(Icons.star_rate_rounded),
                        backgroundColor: Colors.white,
                      ),
                      SizedBox(height: 10),
                      Text('Mogic', style: TextStyle(color: Colors.white)),
                    ]),
                    //    SizedBox(width: 15),
                  ],
                )
              ],
            ),
          ),
        ),
        persistentContentHeight: 10,
        // animationCurveExpand: Curves.bounceOut,
        // animationCurveContract: Curves.ease,
        // animationDurationExtend: Duration(milliseconds: 500),
        // animationDurationContract: Duration(milliseconds: 250),
        persistentHeader: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: Colors.white,
          ),

          // constraints: BoxConstraints.expand(height: 60),
          child: Center(
            child: Container(
              child: Padding(
                padding: EdgeInsets.only(top: 30),
                child: Column(children: [
                  Text(
                    'Handpicked',
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    color: Colors.orangeAccent,
                    width: 25,
                    height: 4,
                  )
                ]),
              ),
            ),
          ),
        ),
        expandableContent: Container(
          constraints: BoxConstraints(
            maxHeight: 400,
            minHeight: 20,
          ),
          child: Container(
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <ExpandWid>[
                        for (int i = 0; i < list.length; i++)
                          ExpandWid(list[i]),
                      ],
                    ),
                    SizedBox(height: 25),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text('Top Auther', style: TextStyle(fontSize: 20)),
                    ),
                    SizedBox(height: 25),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Authors>[
                          for (int i = 0; i < listAuthers.length; i++)
                            Authors(listAuthers[i]),
                        ],
                      ),
                    ),
                    TextButton(onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                        return DetailsSccreen(list[0], listAuthers[0]);
                      }));
                    }, child: Text('To Next Screen'))
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
