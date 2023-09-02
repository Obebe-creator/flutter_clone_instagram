import 'package:flutter_clone_inst/src/view/upload_choice.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';
import '../data/model/album_model.dart';

class UploadController extends GetxController {
  final Rx<List<AlbumModel>> _albums = Rx<List<AlbumModel>>([]);
  final Rxn<AssetEntity> _selectedImage = Rxn<AssetEntity>();
  final RxInt _index = 0.obs;

  List<AlbumModel> get albums => _albums.value;
  AssetEntity? get selectedImage => _selectedImage.value;
  int get index => _index.value;

  @override
  void onReady() {
    super.onReady();
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

  Future<void> getAlbums() async {
    await PhotoManager.getAssetPathList(type: RequestType.image).then((paths) {
      for (AssetPathEntity asset in paths) {
        asset.getAssetListRange(start: 0, end: 10000).then((images) {
          if (images.isNotEmpty) {
            final album = AlbumModel.fromGallery(asset.name, asset.id, images);
            _albums.value.add(album);
            _albums.refresh();
          }
        });
      }
    });
  }

  void moveToChoose() {
    Get.to(() => const UploadChoice(),
        transition: Transition.downToUp, popGesture: false);
  }

  void changeIndex(int value) {
    _index(value);
    Get.back();
  }

  void select(AssetEntity e) {
    _selectedImage(e);
    _selectedImage.refresh();
  }
}
