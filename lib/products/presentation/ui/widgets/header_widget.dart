import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'custom_search_bar.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: CustomSearchBar(),
        ),
        Gap(24.w),
        GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Cart will coming soon..."),
                duration: Duration(milliseconds: 500),
              ),
            );
          },
          child: SvgPicture.asset('assets/icons/cart_icon.svg'),
        ),
      ],
    );
  }
}
