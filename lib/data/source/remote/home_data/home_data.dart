import '../../../../core/class/crud.dart';
import '../../../../core/constant/api_link.dart';

class HomeData {
  CRUD crud;

  HomeData(this.crud);

  getSummary([DateTime? date]) async {
    var response = await crud.postData(AppLink.getSummery, {
      "month": date?.month.toString() ?? DateTime.now().month.toString(),
      "year": date?.year.toString() ?? DateTime.now().year.toString(),
    });

    return response.fold((l) => l, (r) => r);
  }
}
