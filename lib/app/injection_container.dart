import 'package:drinkly/players/cubit/player_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void initGetIt() {
  sl.registerFactory(() => PlayerCubit());
}
