import 'package:flutter/material.dart';
import 'package:pet_store/components/cartPage.dart';
import 'package:pet_store/components/petProfile.dart';
import 'package:pet_store/components/store_class.dart';

class Product extends StatefulWidget {
  const Product({required this.store, super.key});
  final Store store;
  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Padding(
          padding: EdgeInsets.only(left: 55),
          child: Text(
            "Products",
            style: TextStyle(fontSize: 35),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyCart()),
                );
              },
              icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 25, top: 25),
              child: Container(
                height: 50,
                width: 310,
                decoration: const BoxDecoration(color: Colors.blue),
              ),
            ),
          ),
          Center(
            child: SizedBox(
              height: 650,
              width: 350,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.8, crossAxisCount: 2),
                itemCount: widget.store.listOfPets.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyPetProfile(
                                  pet: widget.store.listOfPets[index],
                                )),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20, right: 20),
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.yellow,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: Offset(1, 1),
                              ),
                            ]),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Container(
                                height: 100,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: AssetImage(widget
                                          .store.listOfPets[index].imagePath),
                                      fit: BoxFit.cover),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black,
                                      spreadRadius: 0,
                                      blurRadius: 0,
                                      offset: Offset(0, 0),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              widget.store.listOfPets[index].petName,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w400),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 40),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.attach_money_rounded,
                                    color: Colors.green,
                                  ),
                                  Text(
                                    widget.store.listOfPets[index].petPrice
                                        .toString(),
                                    style: const TextStyle(
                                        color: Colors.green, fontSize: 20),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
