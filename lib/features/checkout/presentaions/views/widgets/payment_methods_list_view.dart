import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/app_assets.dart';
import 'package:payment_app/core/widgets/payment_method_item.dart';

class PaymentMethodsListView extends StatefulWidget {

  const PaymentMethodsListView({Key? key}) : super(key: key);

  @override
  State<PaymentMethodsListView> createState() => _PaymentMethodsListViewState();
}

class _PaymentMethodsListViewState extends State<PaymentMethodsListView> {
  final List<String> paymentMethodsItems = const [AppAssets.card,AppAssets.paypal];
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: paymentMethodsItems.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    activeIndex = index;
                  });
                },
                  child: PaymentMethodItem(isActive: activeIndex==index, image: paymentMethodsItems[index])),
            );
          },),
    );
  }
}
