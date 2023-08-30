import 'package:flutter/material.dart';

import '../widgets/favourite_product_card.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        //this temporary !iin the future will be list of products product[index].title and so on
        return FavouriteProductCard(
          title: "Samsung Universe 9",
          price: 1249,
          brand: "Impression of Acqua Di Gio",
          thumbnail: "https://i.dummyjson.com/data/products/7/thumbnail.jpg",
        );
      },
      itemCount: 15, //products.length
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 15,
        );
      },
    );
  }
}
