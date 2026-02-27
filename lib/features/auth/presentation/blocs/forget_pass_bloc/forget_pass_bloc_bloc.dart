import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'forget_pass_bloc_event.dart';
part 'forget_pass_bloc_state.dart';

class ForgetPassBlocBloc extends Bloc<ForgetPassBlocEvent, ForgetPassBlocState> {
  ForgetPassBlocBloc() : super(ForgetPassBlocInitial()) {
    on<ForgetPassBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
