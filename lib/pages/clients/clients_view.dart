import "package:flutter/material.dart";

class ClientsPage extends StatefulWidget {
  const ClientsPage({super.key});

  @override
  State<ClientsPage> createState() => _ClientsPageState();
}

class _ClientsPageState extends State<ClientsPage> {
  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Center(
        child: Text(
          'Clients Page',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
