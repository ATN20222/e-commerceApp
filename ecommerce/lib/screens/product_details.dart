import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/models/product.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final Product product;
  final void Function(bool)? onFavTapped;
  final void Function(bool)? onCartTapped;

  const ProductDetails({
    Key? key,
    required this.product,
    this.onFavTapped,
    this.onCartTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          // alignment: Alignment.topRight,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Column(children: [
                    FloatingActionButton(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      hoverColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      splashColor: Colors.black54,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back, color: Colors.black),
                    ),
                  ]),
                ),
                // ClipRRect(
                //   borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                //   child: Image.network(
                //     '${product.images[0]}',
                //     fit: BoxFit.fitHeight,
                //     height: 150,
                //   ),
                // ),

                Container(
                  height: 200,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 200,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: true,
                      autoPlay: true,
                    ),
                    items: product.images.map((url) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Image.network(
                            url,
                            fit: BoxFit.cover,
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "${product.title}",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
                  child: Text(
                    '\$${product.price}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
                  child: Row(
                    children: [
                      Icon(Icons.star_outline),
                      Text(
                        '${product.rating}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
                      child: Flexible(
                        child: Text(
                          'category :',
                          style: TextStyle(
                            fontSize: 14,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 0, left: 10.0, bottom: 10.0),
                      child: Text(
                        ' ${product.category}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
                  child: Flexible(
                    child: Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 14,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
                  child: Text(
                    '${product.description}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.topRight,
              child: Column(children: [
                FloatingActionButton(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  splashColor: Colors.black54,
                  onPressed: () {},
                  child:
                      Icon(Icons.favorite_border_outlined, color: Colors.black),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
