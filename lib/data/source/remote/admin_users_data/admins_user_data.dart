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
      "adminName": adminModel.adminName!.trim(),
      "adminEmail": adminModel.adminEmail!.trim(),
      "adminBranchId": adminModel.adminBranchId.toString().trim(),
      "adminSuperAdmin": adminModel.adminSuperAdmin.toString().trim(),
      "password": adminModel.adminPassword.toString().trim(),
    });
    return response.fold((l) => l, (r) => r);
  }

  editAdmins(AdminModel adminModel, String id) async {
    var response = await crud.postData(AppLink.editAdminUser, {
      "adminId": id.trim(),
      "adminName": adminModel.adminName!.trim(),
      "adminEmail": adminModel.adminEmail!.trim(),
      "adminBranchId": adminModel.adminBranchId.toString().trim(),
      "adminSuperAdmin": adminModel.adminSuperAdmin.toString().trim(),
      "password": adminModel.adminPassword.toString().trim(),
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteAdmins(String adminId) async {
    var response = await crud.postData(AppLink.deleteAdminUser, {
      'adminId': adminId.trim(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
