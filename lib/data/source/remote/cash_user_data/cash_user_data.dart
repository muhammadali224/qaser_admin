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
      "cashName": cashModel.cashUserName,
      "cashEmail": cashModel.cashUserEmail,
      "cashBranchId": cashModel.cashBranchId.toString(),
      "cashCreatedDate": DateTime.now().toString(),
      "password": cashModel.cashUserPassword.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  editCashUser(CashUserModel cashModel, String id) async {
    var response = await crud.postData(AppLink.editCashUser, {
      "cashId": id,
      "cashName": cashModel.cashUserName,
      "cashEmail": cashModel.cashUserEmail,
      "cashBranchId": cashModel.cashBranchId.toString(),
      "password": cashModel.cashUserPassword.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteCashUser(String id) async {
    var response = await crud.postData(AppLink.deleteCashUser, {
      'cashId': id,
    });
    return response.fold((l) => l, (r) => r);
  }
}
