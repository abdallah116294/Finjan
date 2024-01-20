import 'package:finjan/core/utils/app_methods.dart';
import 'package:finjan/core/utils/appcolor.dart';
import 'package:finjan/features/auth/presentation/widgets/custom_button.dart';
import 'package:finjan/features/home/presentation/widgets/titles_widget.dart';
import 'package:finjan/features/orders/cubit/get_cards_cubit.dart';
import 'package:finjan/features/orders/presentation/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finjan/injection_container.dart' as di;
import 'package:flutter_paymob/flutter_paymob.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrdersScreen extends StatefulWidget {
  final String uid;
  const OrdersScreen({super.key, required this.uid});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  double totalCardsPrice = 0.0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<GetCardsCubit>(context).getCards(uid: widget.uid);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<GetCardsCubit>()..getCards(uid: widget.uid),
      child:
          BlocBuilder<GetCardsCubit, GetCardsState>(builder: (context, state) {
        if (state is GetCardsLoading) {
          const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetCardsError) {
          return const Center(
            child:  TitlesTextWidget(color:Color(0xFFD17742),label:"No order Found"),
          );
        } else if (state is GetCardsSucess) {
          totalCardsPrice = state.cards
              .map((card) => card
                  .cardPrice) // Replace 'price' with your actual property name
              .fold(0.0, (sum, price) => sum + price!.toInt());
          //  double totlalPrice=state.cards.fold(0, (double sum, Card card) => sum+card.price);
          return Column(
            children: [
             Expanded (
                child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: state.cards.length,
                            itemBuilder: (context, index) {
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset(
                      'assets/not.png'
                  )),
                  onDismissed: (direction) {
                    AppMethods.dailogAlert(
                        context: context,
                        imagePathe:
                            'assets/not.png',
                        title:
                            "delete ${state.cards[index].cardName.toString()}",
                        fun: () {
                          debugPrint(widget.uid);
                          debugPrint(state.cards[index].cardId);
                          BlocProvider.of<GetCardsCubit>(context).deleteCard(
                              cardEntity: state.cards[index],
                              uid: widget.uid);
                        });
                  },
                  child: CartWidget(
                    coffeeImage: state.cards[index].cardImage.toString(),
                    coffeeName: state.cards[index].cardName.toString(),
                    coffePrice: state.cards[index].cardPrice!.toInt(),
                    cardEntity: state.cards[index],
                    uid: widget.uid,
                  ),
                );
                            },
                          ),
              ),
                      state.cards.isNotEmpty?     Padding(
                              padding:  EdgeInsets.only(bottom: 15.h,top: 15.h),
                              child: CustomButton(
                                color: const  Color(0xFFD17742),
                                action: "Check out",
                                onPressed: () {
                                    FlutterPaymob.instance.payWithCard(
                                                            context: context,
                                                            currency: "EGP",
                                                            amount: totalCardsPrice,
                                                            onPayment: (response) {
                                                              response.success == true
                                                                  ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                                      content: Text(response.message ?? "Successes")))
                                                                  : null;
                                                            },
                                                          );
                                },
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                ),
                                width: 160.w,
                              ),
                            ):Container(),
            ],
          );
        }
        return const Center(
          child: TitlesTextWidget(color:Color(0xFFD17742),label:"No order Found"),
        );
      }),
    );
  }
}
