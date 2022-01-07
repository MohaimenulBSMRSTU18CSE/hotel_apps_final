class Room {
  final String roomId;
  final String bed;
  final String windows;
  final String withTable;
  final String floorStyle;
  final String ac;
  final String balcony;
  final bool foodDelivery;
  final double size;
  final String title;
  final List imageList;
  final bool? isFavorite;
  Room(
      {required this.roomId,
      required this.bed,
      required this.windows,
      required this.withTable,
      required this.floorStyle,
      required this.ac,
      required this.balcony,
      this.foodDelivery = false,
      required this.title,
      required this.size,
      required this.imageList,
      this.isFavorite});
}

class SelectedData {
  final List? listname;
  final String? service;
  final String? selectName;
  final String? window;
  final String? bed;
  final String? detailsRoomId;
  final String? roomId;
  SelectedData(
      {this.listname,
      this.selectName,
      this.service,
      this.bed,
      this.window,
      this.detailsRoomId,
      this.roomId});
}
