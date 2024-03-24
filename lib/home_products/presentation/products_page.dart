
import 'package:flutter/material.dart';

class HomeProducts extends StatelessWidget {
  const HomeProducts({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const HomeProducts());
  }

  @override
  Widget build(BuildContext context) => const HomeProductsWidget();
}

class HomeProductsWidget extends StatefulWidget {
  const HomeProductsWidget({super.key});

  @override
  State<HomeProductsWidget> createState() => _HomeProductsState();
}

class _HomeProductsState extends State<HomeProductsWidget> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand(
      child: Center(
        child: Text("Home Page 1"),
      ),
    );
  }
}
