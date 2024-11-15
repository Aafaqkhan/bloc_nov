import 'package:bloc_nov/cubit/buttons_page.dart';
import 'package:bloc_nov/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitHome extends StatefulWidget {
  const CubitHome({super.key});

  @override
  State<CubitHome> createState() => _CubitHomeState();
}

class _CubitHomeState extends State<CubitHome> {
  // final counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    final counterCubit = BlocProvider.of<CounterCubit>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Bloc'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterCubit, int>(
                bloc: counterCubit,
                builder: (context, _) {
                  return Text(
                    '${counterCubit.state}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                }),
            const SizedBox(height: 100),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ButtonsPage();
                  }));
                },
                child: const Icon(Icons.next_plan)),
          ],
        ),
      ),
    );
  }
}
