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
      body: Container(
        height: 700,
        width: 400,
        decoration: const BoxDecoration(color: Colors.white),
        child: Consumer<CartModel>(builder: (context, cart, child) {
          return Center(
            child: Column(
              children: [
                SizedBox(
                  height: 600,
                  width: 400,
                  child: Column(
                    children: [
                      Container(
                        height: 600,
                        width: 380,
                        decoration: const BoxDecoration(color: Colors.white),
                        child: cart.cartItems.isEmpty
                            ? const Center(
                                child: Text(
                                  "Cart is Empty",
                                  style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            : ListView.builder(
                                scrollDirection: Axis.vertical,
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
                                      padding:
                                          const EdgeInsets.only(bottom: 20),
                                      child: Container(
                                        height: 150,
                                        width: 380,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: Colors.yellow,
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Colors.yellow,
                                                spreadRadius: 1,
                                                blurRadius: 1,
                                                offset: Offset(1, 1),
                                              ),
                                            ]),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5, left: 5),
                                                  child: Container(
                                                    height: 140,
                                                    width: 150,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      image: DecorationImage(
                                                          image: AssetImage(cart
                                                              .cartItems[index]
                                                              .imagePath),
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
                                                Column(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 50),
                                                      child: Text(
                                                        cart.cartItems[index]
                                                            .petName,
                                                        style: const TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 103),
                                                      child: Row(
                                                        children: [
                                                          const Icon(
                                                            Icons
                                                                .attach_money_rounded,
                                                          ),
                                                          Text(
                                                            cart
                                                                .cartItems[
                                                                    index]
                                                                .petPrice
                                                                .toString(),
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        25),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                      ),
                    ],
                  ),
                ),
                cart.cartItems.isEmpty
                    ? Container(
                        height: 100,
                        width: 380,
                        decoration: const BoxDecoration(color: Colors.white),
                      )
                    : Center(
                        child: Container(
                            padding: const EdgeInsets.only(left: 80),
                            width: 400,
                            height: 100,
                            decoration:
                                const BoxDecoration(color: Colors.white),
                            child: Row(
                              children: [
                                const Text(
                                  "Total Price is:",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Icon(
                                    Icons.attach_money_rounded,
                                  ),
                                ),
                                Text(
                                  cart.getTotalPrice().toString(),
                                  style: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            )),
                      )
              ],
            ),
          );
        }),
      ),
    );
  }
}
