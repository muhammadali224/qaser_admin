import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/coupon_controller/view_coupon_controller.dart';
import '../../../core/class/handling_data_view.dart';
import '../../widget/shred_component/curved_header.dart';
import '../../widget/shred_component/fab.dart';
import '../../widget/shred_component/item_list_tile.dart';
import '../app_drawer/app_drawer.dart';

class ViewCoupon extends StatelessWidget {
  const ViewCoupon({super.key});

  @override
  Widget build(BuildContext context) {
    CouponViewController controller = Get.put(CouponViewController());
    return Scaffold(
      floatingActionButton: FAB(
        onTap: controller.goToAddCoupon,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      drawer: const AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () => controller.getCoupon(),
        child: Column(
          children: [
            const CurvedHeader(
                title: 'coupons', background: Colors.amberAccent),
            Expanded(
              child: GetBuilder<CouponViewController>(builder: (controller) {
                return HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.couponList.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ItemListTile(
                        title: controller.couponList[index].couponName!,
                        subtitle:
                            "${controller.couponList[index].couponDiscount.toString()} %",
                        onEditTap: () => controller
                            .goToEditCoupon(controller.couponList[index]),
                        onDeleteTap: () => controller.deleteCoupon(
                            controller.couponList[index].couponId!),
                      ),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
