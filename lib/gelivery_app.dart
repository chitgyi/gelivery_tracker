import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelivery_tracker/src/di/di.dart';
import 'package:gelivery_tracker/src/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:gelivery_tracker/src/presentation/blocs/login_bloc/login_cubit.dart';
import 'package:gelivery_tracker/src/presentation/navigation/app_route_config.dart';
import 'package:gelivery_tracker/src/presentation/styles/colors.dart';

class GeliveryApp extends StatelessWidget {
  const GeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => get<AuthCubit>()),
        BlocProvider(create: (_) => get<LoginCubit>()),
      ],
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: MaterialApp.router(
          routerConfig: AppRouteConfig.router,
          theme: ThemeData(
            primaryColor: primaryColor,
            cardTheme: CardTheme(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            appBarTheme: const AppBarTheme(
              backgroundColor: primaryColor,
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
              systemOverlayStyle: SystemUiOverlayStyle.light,
              iconTheme: IconThemeData(color: Colors.white),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.white),
                backgroundColor:
                    MaterialStateProperty.all(Colors.blue.shade900),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
