import 'package:go_router/go_router.dart';
import 'package:login/features/home/presentation/views/home_view.dart';
import 'package:login/features/onbording_screen/presentation/views/onboarding_view.dart';
import 'package:login/features/splash/presentation/views/splash_view.dart';
import 'package:login/features/analytics/presentation/views/analytics_screen.dart';

class AppRouter {
  static const String splashRoute = '/';
  static const String onboardingRoute = '/onboarding';
  static const String informationRoute = '/information';
  static const String homeRoute = '/home';

  GoRouter goRouter = GoRouter(
    initialLocation: splashRoute,
    routes: [
      GoRoute(
        path: splashRoute,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: onboardingRoute,
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(
        path: homeRoute,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: '/analytics',
        builder: (context, state) => AnalyticsScreen(),
      ),
    ],
  );
}
