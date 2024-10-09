import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/HomeBloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("bloc"),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return state.isloading? const Center(child: CircularProgressIndicator(),) : ListView.builder(
            itemCount: state.result?.length,
            itemBuilder: (context, index) {
              // final data = state.result![index];
             return Text(state.result?[index].title ?? "NO DATA FOUND");
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<HomeBloc>().add(ApiCalling());
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
