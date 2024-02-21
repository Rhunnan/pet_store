import 'package:flutter/material.dart';
import 'package:pet_store/components/petProfile.dart';
import 'package:pet_store/components/store_class.dart';
import 'package:provider/provider.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Cart"), actions: [
        IconButton(
            onPressed: () {
              Provider.of<CartModel>(context, listen: false).removeAll();
            },
            icon: const Icon(Icons.delete))
      ]),
      body: Consumer<CartModel>(builder: (context, cart, child) {
        return SizedBox(
          height: 550,
          width: 350,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: cart.cartItems.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyPetProfile(
                              pet: cart.cartItems[index],
                            )),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20, right: 20),
                  child: Container(
                    height: 100,
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
                            height: 100,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: AssetImage(
                                      cart.cartItems[index].imagePath),
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
                          cart.cartItems[index].petName,
                          style: const TextStyle(fontSize: 10),
                        ),
                        Text(
                          cart.cartItems[index].petPrice.toString(),
                          style: const TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
