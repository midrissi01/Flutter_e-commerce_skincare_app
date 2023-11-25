import 'package:flutter/material.dart';
import 'package:untitled/repository/data.dart';


class ItemPage extends StatelessWidget {

  String name;
  String price;
  String description;
  String image;


  ItemPage({required this.name,required this.price, required this.description, required this.image});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$name'),),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 1.9,
                  decoration: BoxDecoration(
                    color: Color(0xffbccaca),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: Center(
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    radius: 75,
                                    backgroundColor: Colors.white,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    radius: 75,
                                    backgroundColor:
                                    Color(0xffbccaca).withOpacity(0.5),
                                  ),
                                ),
                                Image.asset('$image',
                                  height: 200,),


                              ],
                            ),
                          ),
                        ),
                        flex: 6,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Color(0xff9db1b1),
                          child: Padding(
                            padding: const EdgeInsets.all(22.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  'assets/shopping-bag-outline.png',
                                  color: Colors.white,
                                  height: 35,
                                ),
                                SizedBox(
                                  height: 20,
                                ),

                                Icon(
                                  Icons.favorite_border,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    top: 30,
                    left: 10,
                    child: Icon(Icons.arrow_back_ios, color: Colors.white,))
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$name',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 23),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    child: Row(children: [
                      CircleAvatar(
                        backgroundColor: Colors.black54,
                        radius: 5,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        '$description',
                        style: TextStyle(color: Colors.black54, fontSize: 16),
                      ),
                    ]),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    child: Row(children: [
                      CircleAvatar(
                        backgroundColor: Colors.black54,
                        radius: 5,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        'No phthalates, leads or glues',
                        style: TextStyle(color: Colors.black54, fontSize: 16),
                      ),
                    ]),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    child: Row(children: [
                      CircleAvatar(
                        backgroundColor: Colors.black54,
                        radius: 5,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        'BPA-free, polypropylene lid and  heat sleeve',
                        style: TextStyle(color: Colors.black54, fontSize: 16),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20,0,0,0),
              child: Text(
                'Size',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20,0,0,0),
              height: 90,
              child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.all((index+1)*7.0),
                        width: 130,
                        child:
                        Image.network('https://cdn.accentuate.io/31823129542702/11366956630062/StoJo_200206_Product-68488-v1584383135067.png?936x1160',
                        ),
                        decoration: BoxDecoration(
                            color: Color(0xffbccaca),
                            borderRadius: BorderRadius.circular(15)
                        ),
                      ),
                    );
                  }),
            ),
            Expanded(child: Container()),
            Row(
              children: [
                Expanded(
                  child: Text(
                    '$price'+"r DH",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(40)),
                        color: Color(0xff9db1b1)),
                    child: Text(
                      'Add to cart',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 27),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

