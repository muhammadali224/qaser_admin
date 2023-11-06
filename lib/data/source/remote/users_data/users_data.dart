import '../../../../core/class/crud.dart';
import '../../../../core/constant/api_link.dart';
import '../../../../core/extension/date_extension.dart';

class UsersData {
  CRUD crud;

  UsersData(this.crud);

  getUsers() async {
    var response = await crud.postData(AppLink.viewUsers, {});
    return response.fold((l) => l, (r) => r);
  }

  deleteUser(String userId, String userImage) async {
    var response = await crud.postData(AppLink.deleteUsers, {
      "userId": userId,
      "userImage": userImage,
    });
    return response.fold((l) => l, (r) => r);
  }

  changeUserState(int userId, int userState) async {
    var response = await crud.postData(AppLink.changeUserState, {
      "userId": userId.toString(),
      "userState": userState.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  sendUserNotification({
    required int userId,
    required String body,
    required String title,
  }) async {
    var response = await crud.postData(AppLink.sendUserNotification, {
      "userId": userId.toString(),
      "title": title,
      "body": body,
    });
    return response.fold((l) => l, (r) => r);
  }

  sendUserPoint({
    required int userId,
    required String body,
    required String title,
    required String pointCount,
  }) async {
    var response = await crud.postData(AppLink.addUserPoint, {
      "userId": userId.toString(),
      "title": title,
      "body": body,
      "pointCount": pointCount,
      "expireDate": DateTime.now().parseDate(),
      "createDate": DateTime.now().add(const Duration(days: 100)).parseDate(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
