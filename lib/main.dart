import 'package:drm/parts/core/core_part.dart';
import 'package:drm/parts/onboarding/onboarding_part.dart';
import 'package:drm/parts/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'package:drm/code_kit/constants.dart';
import 'package:drm/parts/ui_kit/ui_kit.dart';

Future<void> main() async {
  await SentryFlutter.init(
    (options) {
      options.dsn = CS.sentryKey;

      options.tracesSampleRate = 1.0;
    },
    appRunner: () => runApp(MyApp()),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _router = AppRouter();
  @override
  Widget build(BuildContext context) {
    var brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    final colors = isDarkMode ? DarkAppColors() : LightAppColors();
    return BlocWrappers(
      child: BlocBuilder<FirstRunCubit, FirstRunState>(
        builder: (context, state) {
          return AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            child: state is FirstRunLoaded && !state.isFirstRun
                ? MaterialApp.router(
                    title: 'DRM',
                    debugShowCheckedModeBanner: false,
                    theme: ThemeData(
                      primaryColor: colors.primary,
                      colorScheme:
                          ColorScheme.fromSeed(seedColor: colors.primary),
                      useMaterial3: true,
                    ),
                    routerConfig: _router.config(),
                  )
                : MaterialApp(
                    title: 'DRM',
                    debugShowCheckedModeBanner: false,
                    theme: ThemeData(
                      primaryColor: colors.primary,
                      colorScheme:
                          ColorScheme.fromSeed(seedColor: colors.primary),
                      useMaterial3: true,
                    ),
                    home: OnboardingScreen(),
                  ),
          );
        },
      ),
    );
  }
}
