import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class Client extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final List<int> projectsIds;
  @HiveField(2)
  final String name;

  Client(this.id, {required this.name, required this.projectsIds});
}

class ClientAdapter extends TypeAdapter<Client> {
  @override
  final typeId = 1;

  @override
  Client read(BinaryReader reader) {
    return Client(
      reader.readInt(),
      name: reader.readString(),
      projectsIds: List<int>.from(reader.readList()),
    );
  }

  @override
  void write(BinaryWriter writer, Client obj) {
    writer
      ..writeInt(obj.id)
      ..writeString(obj.name)
      ..writeList(obj.projectsIds);
  }
}
