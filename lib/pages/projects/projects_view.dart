import "package:flutter/material.dart";
import "package:hive_flutter/hive_flutter.dart";

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Projects"),
      ),
      body: ValueListenableBuilder(
          valueListenable: Hive.box("projects").listenable(),
          builder: (context, box, child) {
            return Center(
              child: Text(
                'Projects Page',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            );
          }),
    );
  }
}
