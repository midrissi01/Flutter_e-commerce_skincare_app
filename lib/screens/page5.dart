import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Page5 extends StatefulWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  State<Page5> createState() => _Page5State();
}

class _Page5State extends State<Page5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 230,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image:AssetImage("assets/cover.jpeg"),
                        fit: BoxFit.cover
                    )
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.transparent,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: const Padding(

                  padding: EdgeInsets.all(10.0),
                  child: Card(
                    margin: EdgeInsets.all(10),
                    child: Text(

                      "Khlala Cosmetics is a Moroccan skincare brand that creates natural products infused with Moroccan and Berber elements. They harness the power of Moroccan oils, seeds, and rituals to develop high-quality skincare and cosmetics. Their formulations include ingredients like argan oil, prickly pear seed oil, and rosehip oil, known for their nourishing and rejuvenating properties. Khlala Cosmetics draws inspiration from traditional Moroccan and Berber beauty rituals, incorporating them into their product development. They prioritize using natural and organic ingredients, avoiding harsh chemicals and synthetic fragrances. Sustainability and ethical practices are also important values for the brand.",
                      style: TextStyle(fontFamily: 'Tsukimi', fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold,),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ),
              //SizedBox(height: 35,),
              Text("For more informatios visit:"),

              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Icon(
                      FontAwesomeIcons.instagram,
                      size: 20,
                    ),
                    Text("khlala__"),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.google,
                      size: 20,
                    ),
                    Text("www.khlalacosmetics.ma"),
                  ],
                ),
              ),
              SizedBox(height: 5,),


              Center(child: Text("devolloped by:",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,))),
              Text(" Mehdi EL MIR & Malika OULHAJ IDRISSI",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,)),
              Text("@2023"),


            ],
          ) ,
        ),
      ),

    );
  }
}
