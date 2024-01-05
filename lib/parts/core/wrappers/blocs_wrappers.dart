part of "../core_part.dart";

class BlocWrappers extends StatelessWidget {
  final Widget child;
  const BlocWrappers({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DIC().firstRunCubit,
          lazy: false,
        ),
        BlocProvider(
          create: (context) => DIC().authBloc,
        ),
      ],
      child: child,
    );
  }
}
