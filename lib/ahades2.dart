import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class Suracontent extends StatefulWidget {

  final String suraname;
  final String path;
  const Suracontent( {required this.suraname , required this.path});

  @override
  SuracontentState createState() => SuracontentState();
}

class SuracontentState extends State<Suracontent> {

  String data='';

  fetchFileData() async{
    String resp;
    resp = await rootBundle.loadString(widget.path);
    List<String> items = resp.split('\n');
    resp = "";
    for (int i = 0; i < items.length; i++ ){
      print(items[i]);
      print(items[i].length);
      resp += items[i];
      resp += "  ";
    }
    setState(() {
      data = resp;
    });
  }

  @override
  void initState() {
    fetchFileData();
    super.initState();
  }

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Container(
            child:Text(
              'إسلامي' ,
              style: TextStyle(
                fontSize: 32,
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),
            ),
          margin: EdgeInsets.only(left : 90),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        margin: EdgeInsets.all(3),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/ahades1.png'),
            fit: BoxFit.fill,
          ),
        ),

        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 90.0, bottom: 0),
                  child: Text( widget.suraname , style: TextStyle(fontSize: 30.0 ,color: Colors.black,fontWeight: FontWeight.bold),),
                ),
              ),
              Expanded(
                child: Container(
                    margin: EdgeInsets.all(20),
                    color: Colors.white54,
                    child: SingleChildScrollView(
                        child: Text(data , style: TextStyle(fontSize: 24 ,),textDirection: TextDirection.rtl,)) ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}