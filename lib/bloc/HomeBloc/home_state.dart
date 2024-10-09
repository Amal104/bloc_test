part of 'home_bloc.dart';

class HomeState {
  final bool isloading;
  final List<Products>? result;
  final bool isEmpty;
  HomeState(this.result, this.isEmpty, {required this.isloading});
}

class HomeInitial extends HomeState {
  HomeInitial(super.result, super.isEmpty, {required super.isloading});
}
