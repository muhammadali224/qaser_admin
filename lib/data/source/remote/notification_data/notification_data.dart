import '../../../../core/class/crud.dart';
import '../../../../core/constant/api_link.dart';
import '../../../model/notification_model/notification_model.dart';

class NotificationData {
  CRUD crud;

  NotificationData(this.crud);

  getNotifications() async {
    var response = await crud.postData(AppLink.viewNotifications, {});
    return response.fold((l) => l, (r) => r);
  }

  addNotification(NotificationModel notificationModel) async {
    var response = await crud.postData(AppLink.sendNotifications, {
      "title": notificationModel.notificationsTitle!.trim(),
      "body": notificationModel.notificationsBody!.trim(),
      "topic": notificationModel.notificationLevel.toString().trim(),
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteNotification(String couponId) async {
    var response = await crud.postData(
        AppLink.deleteNotifications, {"notificationId": couponId.trim()});
    return response.fold((l) => l, (r) => r);
  }
}
