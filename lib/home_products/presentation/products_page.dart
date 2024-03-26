
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shopping/home_products/domain/bloc/load/home_products_load_bloc.dart';
import 'package:shopping/home_products/domain/bloc/load/home_products_load_event.dart';
import 'package:shopping/home_products/domain/bloc/load/home_products_load_state.dart';
import 'package:shopping/common/bloc/bloc_constant.dart';
import 'package:shopping/home_products/data/remote/repository/home_products_repository.dart';

class HomeProducts extends StatelessWidget {
  const HomeProducts({super.key});

  static Route<void> route() {
    // return MaterialPageRoute<void>(
    //     builder: (context) => BlocProvider(
    //         create: (context) => HomeProductsLoadBloc(),
    //         child: const HomeProducts(),
    //     )
    // );

    return MaterialPageRoute<void>(
        builder: (context) => const HomeProducts()
    );
  }

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) {
      HomeProductsRepository repository = HomeProductsRepository();
      return HomeProductsLoadBloc(repository: repository);
    },
    child: const HomeProductsWidget(),
  );
}

class HomeProductsWidget extends StatefulWidget {
  const HomeProductsWidget({super.key});

  @override
  State<HomeProductsWidget> createState() => _HomeProductsState();
}

class _HomeProductsState extends State<HomeProductsWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Center(
        child: loadButton(context),
      ),
    );
  }

  Widget loadButton(BuildContext context) {
    return BlocBuilder<HomeProductsLoadBloc, HomeProductsLoadState>(
        builder: (context, state) {
          print("TestAlan - state.status ${state.status}");
          print("TestAlan - STATUS_LOADING $STATUS_LOADING");
          switch(state.status) {
            case STATUS_LOADING: return const CircularProgressIndicator();
            default: return InkWell(
              key: const Key("products_page_button_loading"),
              splashColor: Colors.white10,
              onTap: () {
                context.read<HomeProductsLoadBloc>().add(const HomeProductsLoadRequested("1"));
              },
              child: const Text("Load", style: TextStyle(color: Colors.blue, fontSize: 18.0, fontWeight: FontWeight.w700)),
            );
          }
        }
    );
  }
}
