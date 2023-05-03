import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../presentation/business_logic/cubit/cach/cach_cubit.dart';

GetIt sL = GetIt.instance;
Future<void> getInit() async {
  SharedPreferences preferences = await initCachInstance();
  sL.registerLazySingleton<SharedPreferences>(() => preferences);
  sL.registerLazySingleton<CachCubit>(() => CachCubit(sL<SharedPreferences>()));
}

Future<SharedPreferences> initCachInstance() async {
  return await SharedPreferences.getInstance();
}
