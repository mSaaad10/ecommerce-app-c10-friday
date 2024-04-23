import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app_c10_frida/domain/entities/Product.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItemWidget extends StatelessWidget {
  Product product;

  ProductItemWidget({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18),
      width: 191.w,
      height: 237.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(width: 2, color: Colors.blue)),
      child: Column(
        children: [
          CachedNetworkImage(
              imageBuilder: (context, imageProvider) =>
                  Container(
                    width: 191.w,
                    height: 128.h,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: imageProvider)),
                  ),
              imageUrl: product.imageCover ?? ''),
          Text(product.title ?? '', maxLines: 2,),
          Row(
            children: [
              Visibility(
                  visible: product.priceAfterDiscount != null,
                  child: Text(product.priceAfterDiscount.toString())),
              SizedBox(width: 4,),
              Text(
                  product.price.toString(),

                  style: product.priceAfterDiscount != null ?
                  TextStyle(
                    color: Colors.red,
                      decoration:
                      TextDecoration.lineThrough) :  TextStyle(
                      color: Colors.blue,
                      decoration:
                      TextDecoration.none)

              ),

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Review (${product.ratingsAverage})'),
              Icon(Icons.star, color: Colors.yellow,),
              Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(44),
                      color: Colors.blue.shade900
                  ),
                  child: Icon(Icons.add, color: Colors.white, weight: 55,))
            ],
          )
        ],
      ),
    );
  }
}
