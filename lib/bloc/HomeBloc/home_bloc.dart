import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test/Repo/product_repo.dart';
import 'package:test/model/product_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial(isloading: true,null,true)) {
    on<ApiCalling>((event, emit) async {
      emit(HomeState(isloading: true,null,true));
      final data = await ProductRepo.getProducts();
      emit(HomeState(data, isloading: false,false));
    });
  }
}
