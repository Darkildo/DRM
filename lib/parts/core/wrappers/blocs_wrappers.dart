part of "../core_part.dart";

class BlocWrappers extends StatelessWidget {
  const BlocWrappers({super.key});

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
      child: Container(),
    );
  }
}
