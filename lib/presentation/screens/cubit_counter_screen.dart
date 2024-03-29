import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';



class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: const _CubitCounterView(),
      create: (_) => CounterCubit(),);
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  @override
  Widget build(BuildContext context) {


    // final counterState = context.watch<CounterCubit>().state;

    void _increaseCounterBy( BuildContext context, [ int value = 1 ] ) => context.read<CounterCubit>().increaseBy(value);

    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterCubit cubit) => Text('Cubit Counter: ${ cubit.state.transactionCount }')),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () => context.read<CounterCubit>().reset(),
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterCubit,CounterState>(
          // buildWhen: (previous, current) => previous.counter != current.counter,
          builder: (context, state) {
            return Text('Counter value: ${ state.counter }');

          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          BlocBuilder<CounterCubit,CounterState>(
            builder: (context, state) => FloatingActionButton(
              heroTag: '1',
              child: const Text('+1'),
              onPressed: () => _increaseCounterBy(context),
            )
          ),
          const SizedBox(height: 10,),
          FloatingActionButton(
            heroTag: '2',
            child: const Text('+2'),
            onPressed: () => _increaseCounterBy(context,2),
          ),
          const SizedBox(height: 10,),
          FloatingActionButton(
            heroTag: '3',
            child: const Text('+3'),
            onPressed: () => _increaseCounterBy(context,3),
          ),
        ],
      ),
      
    );
  }
}