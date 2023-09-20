import "package:flutter/material.dart";

class PurchasesPage extends StatefulWidget {
  const PurchasesPage({super.key});

  @override
  State<PurchasesPage> createState() => _PurchasesPageState();
}

class _PurchasesPageState extends State<PurchasesPage> {
  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Center(
        child: Text(
          'Purchases Page',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
