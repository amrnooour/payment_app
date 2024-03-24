import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/core/utils/app_assets.dart';
import 'package:payment_app/features/checkout/data/repos/checkout_repo_impl.dart';
import 'package:payment_app/features/checkout/presentaions/manger/payment_cubit.dart';
import 'package:payment_app/features/checkout/presentaions/views/payment_details_view.dart';
import 'package:payment_app/features/checkout/presentaions/views/widgets/custom_button_payment.dart';
import 'package:payment_app/features/checkout/presentaions/views/widgets/order_info_item.dart';
import 'package:payment_app/features/checkout/presentaions/views/widgets/payment_method_bottom_sheet.dart';
import 'package:payment_app/features/checkout/presentaions/views/widgets/total_price.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 18,),
          Expanded(child: Image.asset(AppAssets.basketImage)),
          const SizedBox(height: 25,),
          OrderInfoItem(title: "Order Subtotal",value: r"42.97$",),
          const SizedBox(height: 3,),
          OrderInfoItem(title: "Discount",value: r"0$",),
          const SizedBox(height: 3,),
          OrderInfoItem(title: "Shipping",value: r"8$",),
          const Divider(thickness: 2,color: Color(0xffC7C7C7),height: 34,),
          TotalPrice(title: "Total", value: r"50.97$"),
          const SizedBox(height: 16,),
          CustomButtonPayment(text: "Complete Payment",onTap: (){
            //Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PaymentDetailsView(),));
            showBottomSheet(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              context: context, builder: (context) => BlocProvider(
                create: (context) => PaymentCubit(CheckoutRepoImpl()),
                child: const PaymentMethodsBottomSheet()),);
          },),
          const SizedBox(height: 12,),
        ],
      ),
    );
  }
}
