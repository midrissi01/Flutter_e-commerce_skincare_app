import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Color appbar_color = const Color(0xfff4e7);
Color beige_klala = const Color(0xF8F5E9);

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        width: double.infinity,
        height: double.infinity,
        color: beige_klala,
        margin: EdgeInsets.all(5),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:AssetImage("assets/carte.PNG"),
                      fit: BoxFit.cover
                  )
              ),
            ),

            const Padding(
              padding: const EdgeInsets.only(
                left: 24,
                right: 34,
                 top: 24,
              ),
                child:
                    Text("KHLALA",style:TextStyle(fontFamily:'Tsukimi',fontSize: 30),
                  ),
                ),
            const Padding(
              padding: const EdgeInsets.all(40),
              child:
              Text("feel the Moroccan touch where ever you are",
                style: TextStyle(fontFamily:'Tsukimi',
                    fontSize: 20,backgroundColor: Colors.white54),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10),
            Container(
              width:200,
              height:200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:AssetImage("assets/qr.jpeg"),
                      fit: BoxFit.cover
                  )
              ),
            ),

          ],

        ),
      ),


    );
  }
}
