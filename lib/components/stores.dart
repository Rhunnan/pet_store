import 'package:flutter/material.dart';
import 'package:pet_store/components/products.dart';
import 'package:pet_store/components/storeData.dart';
import 'package:pet_store/components/store_class.dart';
import 'package:provider/provider.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  final TextEditingController _contoller = TextEditingController();
  List<Store> listOfStore = listOfPetStores;

  void searchStore(TextEditingController searchText) {
    if (searchText.text.isEmpty) {
      listOfStore = listOfPetStores;
    } else {
      listOfStore = listOfPetStores
          .map((element) => element)
          .where((element) => element.storeName
              .toLowerCase()
              .contains(searchText.text.toLowerCase()))
          .toList();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          const Center(
            child: Text(
              "Store",
              style: TextStyle(fontSize: 30),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 20,
            ),
            child: Container(
              height: 50,
              width: 300,
              decoration: const BoxDecoration(
                  border: Border.fromBorderSide(
                      BorderSide(style: BorderStyle.solid))),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        searchStore(_contoller);
                        _contoller.clear();
                      },
                      icon: Icon(Icons.search)),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, right: 30),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: SizedBox(
                        height: 70,
                        width: 220,
                        child: TextField(
                          controller: _contoller,
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
            padding: const EdgeInsets.only(left: 17),
            child: SizedBox(
              height: 620,
              width: 350,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: listOfStore.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20, right: 20),
                    child: Container(
                      height: 290,
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
                              height: 150,
                              width: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image: AssetImage(
                                        listOfStore[index].imagePath),
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
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.circle,
                                  color: Colors.green,
                                ),
                                const Text("Open"),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text(
                                    listOfStore[index].storeName,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 30),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                const Icon(Icons.location_city),
                                Text(listOfStore[index].location),
                              ],
                            ),
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Product(
                                            store: listOfStore[index],
                                          )),
                                );
                              },
                              child: Container(
                                height: 40,
                                width: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white),
                                child: const Center(
                                    child: Text(
                                  "Visit Store",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                )),
                              ))
                        ],
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
