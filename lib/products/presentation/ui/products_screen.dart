import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../core/config/theme/text_styles.dart';
import '../../domain/entities/product_entity.dart';
import '../manager/products_cubit.dart';
import 'widgets/header_widget.dart';
import 'widgets/loading_products_shimmer_widget.dart';
import 'widgets/products_grid_widget.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocBuilder<ProductsCubit, ProductsState>(
          bloc: context.read<ProductsCubit>()..getProducts(),
          builder: (context, state) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<ProductsCubit>().getProducts();
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    const HeaderWidget(),
                    Gap(8.h),
                    _buildBodyWidget(state),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  _buildBodyWidget(ProductsState state) {
    if (state is ProductsLoadingState) {
      return const LoadingProductsShimmerWidget();
    } else if (state is ProductsLoadedState) {
      final List<ProductEntity> products = state.products;

      if (products.isEmpty) {
        return _buildEmptyWidget();
      }

      return ProductsGridWidget(products: products);
    } else if (state is ProductsErrorState) {
      return Center(
        child: Text(
          state.message,
          style: TextStyle(color: const Color(0xff004182), fontSize: 16.0.sp),
        ),
      );
    }
  }

  Widget _buildEmptyWidget() {
    return SizedBox(
      width: 1.sw,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Gap(75.h),
          Image.asset(
            "assets/images/no_data_image.png",
            width: 150.w,
            height: 150.h,
          ),
          Gap(40.h),
          Text('No Products Found', style: TextStyles.font14DarkBlueRegular),
        ],
      ),
    );
  }
}
