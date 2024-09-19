abstract class ListEvent{}

class AddMapEvent extends ListEvent{
  Map<String, dynamic> newData;
  AddMapEvent({required this.newData});
}
class UpdateMapEvent extends ListEvent{
  Map<String, dynamic> updatedData;
  int index;
  UpdateMapEvent({required this.updatedData, required this.index});
}
class DeleteMapEvent extends ListEvent{
  int index;
  DeleteMapEvent({required this.index});
}