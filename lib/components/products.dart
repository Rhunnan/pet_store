import 'package:flutter/material.dart';
import 'package:pet_store/components/cartPage.dart';
import 'package:pet_store/components/petProfile.dart';
import 'package:pet_store/components/storeData.dart';
import 'package:pet_store/components/store_class.dart';

class Product extends StatefulWidget {
  const Product({required this.store, super.key});
  final Store store;
  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  final TextEditingController _poductSearch = TextEditingController();

  void searchEngineProduct(TextEditingController searchText) {
    if (searchText.text.isEmpty) {
      listOfPets = widget.store.listOfPets;
    } else {
      listOfPets = widget.store.listOfPets
          .map((e) => e)
          .where((element) => element.petName
              .toLowerCase()
              .contains(searchText.text.toLowerCase()))
          .toList();
    }

    setState(() {});
  }

  @override
  late List<Pet> listOfPets;

  @override
  void initState() {
    super.initState();
    listOfPets = widget.store.listOfPets;
  }

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
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 20, left: 5),
            child: Container(
              height: 50,
              width: 320,
              decoration: const BoxDecoration(
                  border: Border.fromBorderSide(
                      BorderSide(style: BorderStyle.solid))),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        searchEngineProduct(_poductSearch);
                        _poductSearch.clear();
                      },
                      icon: const Icon(Icons.search)),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, right: 30),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: SizedBox(
                        height: 70,
                        width: 220,
                        child: TextField(
                          controller: _poductSearch,
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 136, 129, 129)),
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search',
                              hintStyle: TextStyle(fontSize: 25)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 17.0),
            child: SizedBox(
              height: 650,
              width: 350,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.8, crossAxisCount: 2),
                itemCount: listOfPets.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyPetProfile(
                                  pet: listOfPets[index],
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
                                      image: AssetImage(
                                          listOfPets[index].imagePath),
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
                              listOfPets[index].petName,
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
                                    listOfPets[index].petPrice.toString(),
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
