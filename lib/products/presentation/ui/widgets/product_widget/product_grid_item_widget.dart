import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/theme/text_styles.dart';
import '../../../../domain/entities/product_entity.dart';
import 'product_favorite_button_widget.dart';
import 'product_image_widget.dart';

class ProductsGridItemWidget extends StatelessWidget {
  final ProductEntity product;

  const ProductsGridItemWidget({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: const Color(0xff004182).withOpacity(0.3),
          width: 2.w,
        ),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductImageWidget(imageUrl: product.image ?? ""),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.font14DarkBlueRegular,
                    ),
                    Text(
                      product.description ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.font14DarkBlueRegular,
                    ),
                    Gap(8.h),
                    Row(
                      children: [
                        Text(
                          "EGP ${product.price}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.font14DarkBlueRegular,
                        ),
                        Gap(15.w),
                        Expanded(
                          child: Text(
                            "EGP ${product.price ?? 0 + 100}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyles.font11BlueRegular.copyWith(
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "${product.rating?.rate} (${product.rating?.count})",
                          style: TextStyles.font12DarkBlueRegular,
                        ),
                        Gap(4.w),
                        SvgPicture.asset(
                          'assets/icons/rate_icon.svg',
                          width: 16.w,
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Added to cart successfully"),
                                backgroundColor: Colors.green,
                                duration: Duration(milliseconds: 500),
                              ),
                            );
                          },
                          child: SvgPicture.asset(
                            'assets/icons/add_button_icon.svg',
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 8.h,
            right: 8.w,
            child: ProductFavoriteButtonWidget(isFavorite: product.isFavorite),
          ),
        ],
      ),
    );
  }
}
