part of "../onboarding_part.dart";

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      context.firstRunCubit.switchState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RepaintBoundary(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
