import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:test/pages/details.dart';

import '../bloc/HomeBloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final itemBloc = context.read<HomeBloc>();
    if (itemBloc.state is HomeInitial) {
      itemBloc.add(ApiCalling());
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("bloc"),
      ),
      body: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if(state is HomeInitial){
            return context.read<HomeBloc>().add(ApiCalling());
          }
          if(state.result != []){
            Timer(const Duration(seconds: 2), () {
             Get.snackbar("Success", "Api loaded successfully");
            },);
          }
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return state.isloading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: state.result?.length,
                    itemBuilder: (context, index) {
                      final data = state.result?[index];
                      return Text(data?.title ?? "NO DATA FOUND");
                    },
                  );
          },
        ),
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
