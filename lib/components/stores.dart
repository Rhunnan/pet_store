import 'package:flutter/material.dart';
import 'package:pet_store/components/products.dart';
import 'package:pet_store/components/storeData.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const Center(
            child: Text(
              "Store",
              style: TextStyle(fontSize: 30),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15, top: 15),
            child: Container(
              height: 30,
              width: 310,
              decoration: const BoxDecoration(color: Colors.blue),
            ),
          ),
          SizedBox(
            height: 620,
            width: 350,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: listOfPetStores.length,
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
                                      listOfPetStores[index].imagePath),
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
                                  listOfPetStores[index].storeName,
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
                              Text(listOfPetStores[index].location),
                            ],
                          ),
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Product(
                                          store: listOfPetStores[index],
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
                                    fontSize: 20, fontWeight: FontWeight.w400),
                              )),
                            ))
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // InkWell(
          //   onTap: () {},
          //   child:

          // onTap: (){Navigator.push(
          //             context,
          //             MaterialPageRoute(builder: (context) => const putpage()),
          //           );},
          // child: Container(
          //   height: 600,
          //   width: 350,
          //   decoration: BoxDecoration(
          //     color: Colors.blue,
          //   ),
          //   child: ListView.builder(
          //       scrollDirection: Axis.vertical,
          //       itemCount: listOfPetStores.length,
          //       itemBuilder: (context, index) {
          //         return Padding(
          //           padding: const EdgeInsets.only(bottom: 20),
          //           child: Container(
          //             height: 280,
          //             width: 300,
          //             decoration:
          //                 BoxDecoration(color: Colors.white, boxShadow: [
          //               BoxShadow(
          //                 color: Colors.black,
          //                 spreadRadius: 2,
          //                 blurRadius: 5,
          //                 offset: Offset(0, 3),
          //               ),
          //             ]),
          //             child: Column(
          //               children: [
          //                 Container(
          //                   height: 200,
          //                   width: 400,
          //                   decoration: BoxDecoration(
          //                     image: DecorationImage(
          //                         image: AssetImage(
          //                             listOfPetStores[index].imagePath),
          //                         fit: BoxFit.cover),
          //                     boxShadow: [
          //                       BoxShadow(
          //                         color: Colors.black,
          //                         spreadRadius: 0,
          //                         blurRadius: 0,
          //                         offset: Offset(0, 0),
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //                 Text(listOfPetStores[index].storeName),
          //                 const Row(
          //                   children: [Icon(Icons.add_circle), Text("Open")],
          //                 ),
          //                 Text(listOfPetStores[index].location)
          //               ],
          //             ),
          //           ),
          //         );
          //       }),
          // ),
          // ),
        ],
      ),
    );
  }
}
