import '../../../../core/class/crud.dart';
import '../../../../core/constant/api_link.dart';
import '../../../model/cash_user_model/cash_user_model.dart';

class CashUserData {
  CRUD crud;

  CashUserData(this.crud);

  getCashUsers() async {
    var response = await crud.postData(AppLink.viewCashUser, {});
    return response.fold((l) => l, (r) => r);
  }

  addCashUser(CashUserModel cashModel) async {
    var response = await crud.postData(AppLink.addCashUser, {
      "cashName": cashModel.cashUserName!.trim(),
      "cashEmail": cashModel.cashUserEmail!.trim(),
      "cashBranchId": cashModel.cashBranchId.toString().trim(),
      "cashCreatedDate": DateTime.now().toString().trim(),
      "password": cashModel.cashUserPassword.toString().trim(),
    });
    return response.fold((l) => l, (r) => r);
  }

  editCashUser(CashUserModel cashModel, String id) async {
    var response = await crud.postData(AppLink.editCashUser, {
      "cashId": id.trim(),
      "cashName": cashModel.cashUserName!.trim(),
      "cashEmail": cashModel.cashUserEmail!.trim(),
      "cashBranchId": cashModel.cashBranchId.toString().trim(),
      "password": cashModel.cashUserPassword.toString().trim(),
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteCashUser(String id) async {
    var response = await crud.postData(AppLink.deleteCashUser, {
      'cashId': id.trim(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
