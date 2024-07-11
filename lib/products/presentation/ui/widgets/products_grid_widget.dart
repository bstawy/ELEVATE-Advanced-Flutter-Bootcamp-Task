import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/entities/product_entity.dart';
import 'product_widget/product_grid_item_widget.dart';

class ProductsGridWidget extends StatelessWidget {
  final List<ProductEntity> products;

  const ProductsGridWidget({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.only(top: 16.h, bottom: 24.h),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.w,
          mainAxisSpacing: 16.h,
          childAspectRatio: 0.75.r,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductsGridItemWidget(product: products[index]);
        },
      ),
    );
  }
}
