import 'package:amrpfe/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'bottom_navigation_bar.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Cart> cartItems = [
    Cart(
      name: "John Deere",
      imagePath: "assets/tractor.PNG",
      amount: 1,
      brand: "Tractor attachment",
      isSelected: false,
      price: 3500,
    ),
    Cart(
      name: "Case IH",
      imagePath: "assets/tractor.PNG",
      amount: 1,
      brand: "Combine harvestor",
      isSelected: false,
      price: 3500,
    ),
    Cart(
      name: "CLASS",
      imagePath: "assets/tractor.PNG",
      amount: 1,
      brand: "Thresher",
      isSelected: false,
      price: 3500,
    ),
  ];

  double calculateTotalPrice() {
    double total = 0;
    for (var element in cartItems) {
      if (element.isSelected) {
        setState(() {
          total += element.price * element.amount;
        });
      }
    }
    return total;
  }

  bool _isAllItemsSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: _isAllItemsSelected,
                            activeColor: Colors.green,
                            onChanged: (value) {
                              setState(() {
                                _isAllItemsSelected = value!;
                                for (var element in cartItems) {
                                  setState(() {
                                    element.isSelected = value;
                                  });
                                }
                                // cartItems.map((e) => e.isSelected = value);
                              });
                            },
                          ),
                          Text(
                            "Select all(${cartItems.where((element) => element.isSelected).length} items)",
                          ),
                        ],
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey, // Button background color
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(20), // Rounded corners
                            side: BorderSide(
                                color: Colors.red), // Border color and width
                          ),
                        ),
                        onPressed: () {},
                        icon: Icon(
                          Icons.delete_outline,
                          color: Color.fromRGBO(214, 44, 44, 1),
                        ),
                        label: Text(
                          "Remove",
                          style: TextStyle(
                            color: Color.fromRGBO(214, 44, 44, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5,
                          ),
                          child: Row(
                            children: [
                              Checkbox(
                                value: cartItems[index].isSelected,
                                activeColor: Colors.green,
                                onChanged: (value) {
                                  setState(() {
                                    cartItems[index].isSelected = value!;
                                  });
                                },
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ListTile(
                                    contentPadding: EdgeInsets.only(
                                      left: 5,
                                      top: 5,
                                      bottom: 5,
                                    ),
                                    leading: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        cartItems[index].imagePath,
                                      ),
                                    ),
                                    title: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          cartItems[index].name,
                                        ),
                                        Text(
                                          cartItems[index].brand,
                                        )
                                      ],
                                    ),
                                    subtitle: Text(
                                      "${cartItems[index].price}(ETB)",
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 10,
            right: 10,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 0,
              ),
              child: Container(
                // height: 100,
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                ),
                child: Column(
                  children: [
                    Text(
                      "Total (ETB): ${calculateTotalPrice()}",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green, // Button background color
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10), // Rounded corners
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "GO TO PURCHASE PLAN",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // width: double.infinity,
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
