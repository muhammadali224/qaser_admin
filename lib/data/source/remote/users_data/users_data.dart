import '../../../../core/class/crud.dart';
import '../../../../core/constant/api_link.dart';

class UsersData {
  CRUD crud;

  UsersData(this.crud);

  getUsers() async {
    var response = await crud.postData(AppLink.viewUsers, {});
    return response.fold((l) => l, (r) => r);
  }

  deleteUser(String userId, String userImage) async {
    var response = await crud.postData(AppLink.deleteUsers, {
      "userId": userId.trim(),
      "userImage": userImage.trim(),
    });
    return response.fold((l) => l, (r) => r);
  }

  changeUserState(int userId, int userState) async {
    var response = await crud.postData(AppLink.changeUserState, {
      "userId": userId.toString().trim(),
      "userState": userState.toString().trim(),
    });
    return response.fold((l) => l, (r) => r);
  }

  getUserPoint(int userId) async {
    var response = await crud.postData(AppLink.getUserPoint, {
      "userId": userId.toString().trim(),
    });
    return response.fold((l) => l, (r) => r);
  }

  sendUserNotification({
    required int userId,
    required String body,
    required String title,
  }) async {
    var response = await crud.postData(AppLink.sendUserNotification, {
      "userId": userId.toString().trim(),
      "title": title.trim(),
      "body": body.trim(),
    });
    return response.fold((l) => l, (r) => r);
  }

  sendUserPoint({
    required int userId,
    required String pointCount,
    required String body,
  }) async {
    var response = await crud.postData(AppLink.addUserPoint, {
      "userId": userId.toString().trim(),
      "body": body.trim(),
      "pointCount": pointCount.trim(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
