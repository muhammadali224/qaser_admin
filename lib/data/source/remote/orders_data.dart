import '../../../core/class/crud.dart';
import '../../../core/constant/api_link.dart';

class OrdersData {
  CRUD crud;

  OrdersData(this.crud);

  getData(int id) async {
    var response =
        await crud.postData(AppLink.getAllOrders, {'branchId': id.toString()});
    return response.fold((l) => l, (r) => r);
  }

  ordersDetails(int id) async {
    var response =
        await crud.postData(AppLink.orderDetails, {'id': id.toString()});
    return response.fold((l) => l, (r) => r);
  }

  ordersDelete(int id) async {
    var response =
        await crud.postData(AppLink.orderDelete, {'order_id': id.toString()});
    return response.fold((l) => l, (r) => r);
  }

  ordersCancel(int id) async {
    var response =
        await crud.postData(AppLink.orderCancel, {'order_id': id.toString()});
    return response.fold((l) => l, (r) => r);
  }

  ordersState(int orderId, int userId, int orderState) async {
    var response = await crud.postData(AppLink.orderState, {
      'order_id': orderId.toString(),
      'user_id': userId.toString(),
      'order_state': orderState.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
