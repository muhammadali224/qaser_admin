import '../../../core/class/crud.dart';
import '../../../core/constant/api_link.dart';
import '../../shared/user_details.dart';

class ItemsData {
  CRUD crud;

  ItemsData(this.crud);

  getData(int id, int userId) async {
    var response = await crud.postData(AppLink.items, {
      'id': id.toString(),
      'userid': userId.toString(),
      'branch_id': userData.userFavBranchId,
    });
    return response.fold((l) => l, (r) => r);
  }

  getSubItems(int itemId) async {
    var response = await crud.postData(AppLink.subItems, {
      'item_id': itemId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
