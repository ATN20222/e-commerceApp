import 'package:ecommerce/constants/app_colors.dart';
import 'package:flutter/material.dart';

class FavouriteProductCard extends StatelessWidget {
  final String thumbnail, brand, title;
  final int price;
  const FavouriteProductCard({
    super.key,
    required this.thumbnail,
    required this.brand,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.lightgray,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 70,
            height: 70,
            child: Image.network(
              thumbnail,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //name of Brand
              Text(
                brand,
                style: TextStyle(
                  fontFamily: "display",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  fontFamily: "display",
                  fontSize: 14,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$ $price",
                    style: TextStyle(
                      fontFamily: "display",
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: 100),
                  IconButton(
                    color: AppColors.orange,
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_rounded,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
