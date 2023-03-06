import 'package:fwc_album_app/app/models/groups_stickers_model.dart';
import 'package:fwc_album_app/app/pages/my_stickers/view/my_stickers_view.dart';
import 'package:fwc_album_app/app/repository/stickers/stickers_repository.dart';

import './my_stickers_presenter.dart';

class MyStickersPresenterImpl implements MyStickersPresenter {
  final StickersRepository stickersRepository;
  late final MyStickersView _view;

  var album = <GroupsStickersModel>[];
  var statusSelected = "all";
  List<String>? countries;

  MyStickersPresenterImpl({
    required this.stickersRepository,
  });

  @override
  Future<void> getMyAlbum() async {
    album = await stickersRepository.getMyAlbum();
    _view.loadedPage([...album]);
  }

  @override
  set view(MyStickersView view) => _view = view;

  @override
  Future<void> statusFilter(String status) async {
    statusSelected = status;
    _view.updateStatusFilter(status);
  }

  @override
  void countryFilter(List<String>? countries) {
    this.countries = countries;
    if (countries == null || countries.isEmpty) {
      _view.updateAlbum([...album]);
    } else {
      _view.updateAlbum([
        ...album.where(
          (group) => countries.contains(group.countryCode),
        ),
      ]);
    }
  }

  @override
  void refresh() async {
    _view.showLoader();
    await getMyAlbum();
    countryFilter(countries);
    statusFilter(statusSelected);
  }
}
