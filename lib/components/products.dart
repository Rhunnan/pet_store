import 'package:flutter/material.dart';
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
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text(
              "Store",
              style: TextStyle(fontSize: 35),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 25, top: 25),
          child: Container(
            height: 50,
            width: 310,
            decoration: BoxDecoration(color: Colors.blue),
          ),
        ),
        SizedBox(
          height: 550,
          width: 350,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1),
            itemCount: widget.store.listOfPets.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20, right: 20),
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
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
                          height: 200,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: AssetImage(
                                    widget.store.listOfPets[index].imagePath),
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
                      Text(widget.store.listOfPets[index].petName),
                      const Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: Colors.green,
                          ),
                          Text("Open")
                        ],
                      ),
                      Text(widget.store.listOfPets[index].petPrice as String),
                      ElevatedButton(
                          onPressed: () {},
                          child: Container(
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(color: Colors.yellow),
                            child: Text("Add to Cart"),
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
    );
  }
}
