import 'package:flutter/material.dart';
import 'package:untitled/SQLDB.dart';

class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  SQLdb sqldb = SQLdb();
  TextEditingController searchController = TextEditingController();
  List<Map> filteredProducts = []; // Store the filtered products
  List<Map> allProducts = []; // Store all the products

  @override
  void initState() {
    super.initState();
    getAllProducts(); // Load all products from the database
  }

  // Function to filter the products based on the search query
  void filterProducts(String query) {
    setState(() {
      filteredProducts = allProducts.where((product) =>
          product['name'].toString().toLowerCase().contains(query.toLowerCase())).toList();
    });
  }

  Future<void> getAllProducts() async {
    List<Map> products = await sqldb.getData("SELECT * FROM 'cart'");
    setState(() {
      allProducts = products;
      filteredProducts = products;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        width: double.infinity,
        height: double.infinity,
        color: Colors.white54,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Form(
                      child: TextFormField(
                        controller: searchController,
                        decoration: InputDecoration(
                          labelText: 'Search',
                        ),
                        onFieldSubmitted: (value) {
                          filterProducts(value);
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 10),

                ],
              ),
            ),
            Expanded(
              flex: 11,
              child: Container(
                child: ListView.builder(
                  itemCount: filteredProducts.length,
                  itemBuilder: (ctx, index) {
                    return Card(
                      child: ListTile(
                        leading: Image.asset("${filteredProducts[index]['image']}"),
                        title: Text(
                          "${filteredProducts[index]['name']}",
                          style: TextStyle(fontSize: 25, color: Colors.black),
                        ),
                        subtitle: Text(
                          "${filteredProducts[index]['price']} MAD",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.brown,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text("Voulez-vous vraiment supprimer ${filteredProducts[index]['name']}"),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () async {
                                          int rep = await sqldb.deleteData(
                                            "DELETE FROM 'cart' WHERE id = ${filteredProducts[index]['id']}",
                                          );
                                          if (rep > 0) {
                                            Navigator.of(context).pop();
                                            getAllProducts(); // Refresh the product list
                                          }
                                        },
                                        child: Text("Oui"),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("Annuler"),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: Icon(Icons.delete, color: Colors.red, size: 25),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(flex: 1, child: Container()),
          ],
        ),
      ),
    );
  }
}
