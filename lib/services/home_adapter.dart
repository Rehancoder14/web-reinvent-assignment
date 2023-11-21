import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:webreinvent/Homepage/modal/home_modal.dart';

class HomeModelAdapter extends TypeAdapter<HomeModel> {
  @override
  final int typeId =
      0; // Unique ID for your custom class, must be unique across all adapters

  @override
  HomeModel read(BinaryReader reader) {
    final id = reader.readInt();
    final title = reader.readString();
    final isCheck = reader.readBool();
    final subject = reader.readString();
    return HomeModel(
      id: id,
      title: title,
      subject: subject,
      isChecked: isCheck.obs,
    );
  }

  @override
  void write(BinaryWriter writer, HomeModel obj) {
    writer.writeInt(obj.id!);
    writer.writeString(obj.title!);
    writer.writeString(obj.subject!);
    writer.writeBool(obj.isChecked.value);
  }
}
