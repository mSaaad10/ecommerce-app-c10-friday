import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app_c10_frida/domain/entities/Category.dart';
import 'package:flutter/material.dart';

class CategoryItemWidget extends StatelessWidget {
  Category category;
  CategoryItemWidget({required this.category});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageBuilder: (context, imageProvider) => Container(
        width: 100,
        height: 100,
        
        decoration: BoxDecoration(

          shape: BoxShape.circle,
          image: DecorationImage(image: imageProvider)
        ),
      ),
    imageUrl: category.image ?? '',
    placeholder: (context, url) => CircularProgressIndicator(),
    );
  }
}
