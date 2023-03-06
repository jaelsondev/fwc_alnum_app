import 'package:fwc_album_app/app/models/groups_stickers_model.dart';

abstract class MyStickersView {
  void loadedPage(List<GroupsStickersModel> album);
  void error(String message);
  void updateStatusFilter(String status);
  void updateAlbum(List<GroupsStickersModel> album);
  void showLoader();
}
