import 'dart:ui';
import 'package:flutter/material.dart';
import '../SQLDB.dart';
import 'home.dart';

class DetailsPage extends StatelessWidget {
  SQLdb sqldb = SQLdb();
  String name;
  String price;
  String description;
  String image;


  DetailsPage({required this.name,required this.price, required this.description, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$name',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
        ),),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .5,
            decoration: BoxDecoration(
              image: DecorationImage(
                image:AssetImage('$image'),
                fit: BoxFit.cover
              )
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width ,
              height: MediaQuery.of(context).size.height * 0.45,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight:  Radius.circular(40),
                ),
                boxShadow:[
                  BoxShadow(
                    color: Colors.black.withOpacity(.2),
                    offset:Offset(0, -4),
                    blurRadius: 8
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 30,
                      right: 30,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text('$name',
                            style:TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        left: 30,
                        right: 30
                      ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text('$description',
                            style:TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            ),
                          ),
                        ),
                      ],

                    ),
                  ),
                  Spacer(),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.07),
                          offset: Offset(0, -3),
                          blurRadius: 12
                        )
                      ]
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('$price'+" DH",
                                style:TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              )

                            ],
                          ),
                        ),
                        Material(
                          color: Color.fromRGBO(243, 175, 45, 1),
                          borderRadius: BorderRadius.circular(10),

                          child: InkWell(

                              onTap:() async{
                                int rep = await sqldb.insertData("INSERT INTO 'cart' (name, price, image) VALUES (\"${name}\",${int.parse(price)},\"${image}\")");
                                if(rep>0){
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(builder: (context)=>Home()),
                                          (route) => false);
                                }
                            },
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical:10,horizontal: 20 ),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(243, 175, 45, 1),
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Text("Add to Cart",
                                style:TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ),

          ),
        ],
      )
    );
  }
}