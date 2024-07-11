import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/config/theme/app_theme.dart';
import 'core/di/di.dart';
import 'products/presentation/manager/products_cubit.dart';
import 'products/presentation/ui/products_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Init getIt package for DI
  configureDependencies();

  ScreenUtil.ensureScreenSize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Route Task',
          theme: AppTheme.appTheme,
          home: BlocProvider<ProductsCubit>(
            create: (context) => getIt<ProductsCubit>(),
            child: const ProductsScreen(),
          ),
        );
      },
    );
  }
}
