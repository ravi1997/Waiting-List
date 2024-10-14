import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'create_user_state.dart';

class CreateUserCubit extends Cubit<CreateUserState> {
  CreateUserCubit() : super(CreateUserInitial());
}
