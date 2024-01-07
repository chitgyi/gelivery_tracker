import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelivery_tracker/src/di/di.dart';
import 'package:gelivery_tracker/src/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:gelivery_tracker/src/presentation/blocs/login_bloc/login_bloc.dart';
import 'package:gelivery_tracker/src/presentation/blocs/pickup_bloc/pickup_bloc.dart';
import 'package:gelivery_tracker/src/presentation/navigation/route_extension.dart';
import 'package:gelivery_tracker/src/presentation/pages/home_page.dart';
import 'package:gelivery_tracker/src/presentation/pages/login_page.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouteConfig {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        redirect: (context, state) async {
          final authBloc = context.read<AuthBloc>();
          final isLoggedIn = await authBloc.checkAuthState();
          if (isLoggedIn) return null;
          return '/login';
        },
        builder: (context, state) => HomePage(
          onGetPickupCubit: () => get<PickupCubit>(),
        ),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => LoginPage(
          onGetLoginBloc: () => get<LoginBloc>(),
          onLoggedInSuccess: () => context.goToHomePage(),
        ),
      ),
    ],
  );
}
