import 'package:book_cubit_working/cubits/book/books_cubit.dart';
import 'package:book_cubit_working/cubits/counter/counter_cubit.dart';
import 'package:book_cubit_working/cubits/helper/helpers_cubit.dart';
import 'package:book_cubit_working/data/local/storage.dart';
import 'package:book_cubit_working/data/repositories/books_repository.dart';
import 'package:book_cubit_working/data/repositories/helper_repsitory.dart';
import 'package:book_cubit_working/data/services/api_client.dart';
import 'package:book_cubit_working/data/services/api_provider.dart';
import 'package:book_cubit_working/ui/no_internet/no_internet_page.dart';
import 'package:book_cubit_working/ui/router.dart';
import 'package:book_cubit_working/utils/constants.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.getInstance();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(providers: [
      BlocProvider(create: (BuildContext context) => CounterCubit()),
      BlocProvider(
        create: (_) => BooksCubit(
          bookRepository: BookRepository(
            apiProvider: ApiProvider(apiClient: ApiClient()),
          ),
        ),
      ),
      BlocProvider(
        create: (_) => HelpersCubit(
          helperRepository: HelperRepository(
            apiProvider: ApiProvider(apiClient: ApiClient()),
          ),
        ),
      ),
    ], child: const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        builder: (context, child) {
          return StreamBuilder(
              stream: Connectivity().onConnectivityChanged,
              builder: (context, snapshot) {
                if (snapshot.data == ConnectivityResult.none) {
                  return const NoInternetPage();
                }
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                      textScaleFactor: 1.0, alwaysUse24HourFormat: true),
                  child: child!,
                );
              });
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: MyRouter.generateRoute,
        initialRoute: splashPage // mainPage,
        );
  }
}
