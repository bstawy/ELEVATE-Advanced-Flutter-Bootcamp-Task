import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductFavoriteButtonWidget extends StatefulWidget {
  final bool isFavorite;
  const ProductFavoriteButtonWidget({
    super.key,
    required this.isFavorite,
  });

  @override
  State<ProductFavoriteButtonWidget> createState() =>
      _ProductFavoriteButtonWidgetState();
}

class _ProductFavoriteButtonWidgetState
    extends State<ProductFavoriteButtonWidget> {
  bool isFavorite = false;
  @override
  initState() {
    isFavorite = widget.isFavorite;
    super.initState();
  }

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              isFavorite ? "Added to favorites" : "Removed from favorites"),
          backgroundColor: isFavorite ? Colors.green : Colors.red,
          duration: const Duration(milliseconds: 500),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        toggleFavorite();
      },
      child: Container(
        padding: EdgeInsets.all(6.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50.r),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff000000).withOpacity(0.07),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(0, 7),
            ),
          ],
        ),
        child: SvgPicture.asset(
          isFavorite
              ? 'assets/icons/favorite_filled_icon.svg'
              : 'assets/icons/favorite_icon.svg',
          width: 24.w,
        ),
      ),
    );
  }
}
