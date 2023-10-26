import '../../../../core/class/crud.dart';
import '../../../../core/constant/api_link.dart';
import '../../../model/admin_model/admin_model.dart';

class AdminUserData {
  CRUD crud;

  AdminUserData(this.crud);

  getAdmin() async {
    var response = await crud.postData(AppLink.viewAdminUser, {});
    return response.fold((l) => l, (r) => r);
  }

  addAdmins(AdminModel adminModel) async {
    var response = await crud.postData(AppLink.addAdminUser, {
      "adminName": adminModel.adminName,
      "adminEmail": adminModel.adminEmail,
      "adminBranchId": adminModel.adminBranchId.toString(),
      "adminSuperAdmin": adminModel.adminSuperAdmin.toString(),
      "password": adminModel.adminPassword.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  editAdmins(AdminModel adminModel, String id) async {
    var response = await crud.postData(AppLink.editAdminUser, {
      "adminId": id,
      "adminName": adminModel.adminName,
      "adminEmail": adminModel.adminEmail,
      "adminBranchId": adminModel.adminBranchId.toString(),
      "adminSuperAdmin": adminModel.adminSuperAdmin.toString(),
      "password": adminModel.adminPassword.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteAdmins(String adminId) async {
    var response = await crud.postData(AppLink.deleteAdminUser, {
      'adminId': adminId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
