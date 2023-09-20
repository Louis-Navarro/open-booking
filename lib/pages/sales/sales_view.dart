import "package:flutter/material.dart";

class SalesPage extends StatefulWidget {
  const SalesPage({super.key});

  @override
  State<SalesPage> createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesPage> {
  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Center(
        child: Text(
          'Sales Page',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
