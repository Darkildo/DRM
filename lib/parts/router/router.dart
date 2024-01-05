import 'package:auto_route/auto_route.dart';
import 'package:drm/parts/router/router.gr.dart';
import 'package:flutter/material.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      initial: true,
      page: OnboardingRoute.page,
      path: OnboardingRoute.name,
    )
    // AutoRoute(
    //   initial: true,
    //   path: '/core',
    //   page: CoreRoute.page,
    //   children: [],
    // ),
    // AutoRoute(page: HomeRoute.page, path: HomeRoute.name),
    //   AutoRoute(
    //       page: DeliveryRoute.page,
    //       path: DeliveryRoute.name,
    //       maintainState: false),
    //   AutoRoute(
    //       page: BasketRoute.page,
    //       path: BasketRoute.name,
    //       maintainState: false),
  ];
}
