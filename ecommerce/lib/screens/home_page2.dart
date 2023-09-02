import 'package:ecommerce/dataprovider/remote/firebasehelper.dart';
import 'package:ecommerce/providers/user_data.dart';
import 'package:ecommerce/screens/cart_screen.dart';
import 'package:ecommerce/widgets/category_item.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

import '../widgets/featured_product.dart';

import 'all_product_screen.dart';

class HomePage2 extends StatelessWidget {
  const HomePage2({super.key});

  // List<Product> products = [];
  @override
  Widget build(BuildContext context) {
    double ScreenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //start header
              SizedBox(
                height: 70,
                width: ScreenWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //header left

                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          child: Icon(
                            Icons.person_outlined,
                            size: 28,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(width: 70, height: 15),
                              Text(
                                "Hello",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                UserData.username,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    //header right
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const CartScreen();
                          },
                        ));
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.grey[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: SizedBox(
                        height: 50,
                        child: Icon(
                          Icons.shopping_cart_checkout,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //end header
              SizedBox(height: 10),
              //Start Const Text After header
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Let's find",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "Your Gadget!",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              //End Const Text After header

              SizedBox(height: 20),

              //Start Offers
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 225, 197, 94),
                ),
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                height: 140,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Big offers 20%\nSale on products",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "Looking for the right  \nplace for your money",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            backgroundColor: Colors.black,
                            textStyle: TextStyle(color: Colors.white),
                          ),
                          child: Text(
                            'Shop Now',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    Image.asset('assets/images/PhoneBrand.jpg'),
                  ],
                ),
              ),
              //End Offers
              // SizedBox(height: 20),
              // //Start Category
              // Container(
              //   child: Column(
              //     children: [
              //       const Text(
              //         "Categories",
              //         style: TextStyle(fontWeight: FontWeight.w600),
              //       ),
              //       const SizedBox(height: 10),
              //       CategoryItem(type: 'smart phone'),
              //     ],
              //   ),
              // ),
              // //End Category
              SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Featured Products",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AllProductScreen(),
                          ));
                    },
                    child: Text(
                      "View All",
                      style: TextStyle(
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const FeaturedProduct(numOfProduct: 3),
            ],
          ),
        ),
      ),
    );
  }
}
