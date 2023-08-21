import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';
import '../data/model/album_model.dart';

class UploadController extends GetxController {
  final Rx<List<AlbumModel>> _albums = Rx<List<AlbumModel>>([]);
  final Rxn<AssetEntity> _selectImage = Rxn<AssetEntity>();
  final RxInt _index = 0.obs;

  List<AlbumModel> get albums => _albums.value;
  int get index => _index.value;

  @override
  void onInit() {
    super.onInit();
    _checkPermission();
  }

  void _checkPermission() {
    PhotoManager.requestPermissionExtend().then((ps) {
      if (ps.isAuth) {
        getAlbums();
      } else {
        PhotoManager.openSetting();
      }
    });
  }

  void getAlbums() {
    PhotoManager.getAssetPathList().then((paths) {
      for (AssetPathEntity path in paths) {
        path.getAssetListRange(start: 0, end: 10000).then((images) {
          if (images.isNotEmpty) {
            final album = AlbumModel.fromGallery(path.name, path.id, images);
            _albums.value.add(album);
            _albums.refresh();
          }
        });
      }
    });
  }
}
