import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:untitled/screens/details.page.dart';
import 'package:untitled/repository/data.dart';
class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    ProduitService produitService= ProduitService();
    final produits = produitService.allProduits();
    ContainerTransitionType _transition = ContainerTransitionType.fadeThrough;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'All products',
                      style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
                    ),
                    Text(
                      '',
                      style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(25, 0, 15, 0),
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 20,
                          childAspectRatio: 0.73),
                      itemCount: produits.length,
                      itemBuilder: (context, index) {
                        return OpenContainer(
                        transitionType: _transition,
                        transitionDuration: Duration(seconds: 1),
                        closedBuilder: (context,action) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                    color: Colors.lightBlueAccent,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Stack(
                                      children: [

                                        Container(

                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20),
                                                bottomLeft: Radius.circular(20),
                                                bottomRight: Radius.circular(20),
                                              ),
                                              image: DecorationImage(
                                                  image:AssetImage( produits[index].image),
                                                  fit: BoxFit.cover

                                              )
                                          ),
                                        )

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Text(produits[index].name,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400)),
                              Text(
                                produits[index].price + r' MAD',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w700),
                              )
                            ],
                          );
                        },

                            openBuilder: (context,action){
                              return DetailsPage(
                              name: produits[index].name,
                              price: produits[index].price,
                              description: produits[index].description,
                              image: produits[index].image);

                          }
                        );
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}