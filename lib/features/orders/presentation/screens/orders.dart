import 'package:finjan/core/utils/appcolor.dart';
import 'package:finjan/features/orders/cubit/get_cards_cubit.dart';
import 'package:finjan/features/orders/presentation/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finjan/injection_container.dart' as di;

class OrdersScreen extends StatefulWidget {
  final String uid;
  const OrdersScreen({super.key, required this.uid});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
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
            child: Text("error"),
          );
        } else if (state is GetCardsSucess) {
          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: state.cards.length,
            itemBuilder: (context, index) {
              return CartWidget(
                coffeeImage: state.cards[index].cardImage.toString(),
                coffeeName: state.cards[index].cardName.toString(),
                coffePrice: state.cards[index].cardPrice!.toInt(),
              );
            },
          );
        }
        return const Center(
          child: Text(
            'Order Screem',
            style: TextStyle(color: AppColor.backgroundColor),
          ),
        );
      }),
    );
  }
}
