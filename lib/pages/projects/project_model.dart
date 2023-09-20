import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Project extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final int clientId;

  Project(this.id, {required this.name, required this.clientId});
}

class ProjectAdapter extends TypeAdapter<Project> {
  @override
  final typeId = 0;

  @override
  Project read(BinaryReader reader) {
    return Project(
      reader.readInt(),
      name: reader.readString(),
      clientId: reader.readInt(),
    );
  }

  @override
  void write(BinaryWriter writer, Project obj) {
    writer
      ..writeInt(obj.id)
      ..writeString(obj.name)
      ..writeInt(obj.clientId);
  }
}
