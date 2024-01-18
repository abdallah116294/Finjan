import 'package:finjan/core/utils/app_methods.dart';
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
              return Dismissible(
                key: UniqueKey(),
                background: Container(
                  decoration:   BoxDecoration(
                  borderRadius: BorderRadius.circular(15),

                  ),
                  child: Image.network('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMwAAADACAMAAAB/Pny7AAAA81BMVEX/////vgAAAAAAAAgAAAv/vAD/wAT92Yr3ugGCYgAFAwUAAAT/wgD8////xQD/xwAAABD/uAAABAD/ywD5vwD9/vn9yVL5twDxuAB5YwX/wBvrtAv6+erMngbcpwxeQxBOOgWRcRccGBQvJA390Vb98M9iSwj789cAABb846O7kAj96rb/99H76K7+2pP91X3503D4wDr+0GT4wy4zLgZHNwv9y0Z1VAh0Wg9+YA2yhgP624ChehNLQwz74JUrGQv96L7ZsAgkHAZXSgY9KANgVg4cHQkNFw+rfAmYbAeohgkcDwsZEwKbfQhqSQrIlAfIpwdKQ6IvAAAOqUlEQVR4nO1djVfaytNms9k1ZDcJgY2mhEQQhSvW+oEoUtqr1Htrqf58//+/5p0BlaCA0hs+PCfPPaen9YDsw+zOzDMzm5vJpEiRIkWKFClSpEiRIkWKFClSpEiRIkWKFClSpEiRYimwrIw1/Ju32oX8R3hA5PPhl6Pj46ONg7plWate0H9CaX/3pFhUhDFePDk9+MBkLOvwnBGlCLelkpyw4vlBxvuYe80qnTKmFONSGluM25wzd+u4vupl/Rn2moRIrsJPVT1HxdmnEKyj3PO9Va/rT7DXdBn3O2e60B7RavhEbTU/fzyvVj9n0o4udKqZj1xMXW9HsNfO69bHYuN5py6XYVlQDQyDfwpBhS7KIbA5/VhcMta+S3jYwh1GResym71sUZqHv5cjotz9VS9vLlhekfGglkMyrU4U+H4QNVq41/SLQPJiadULnAOW9dVVRge3ltYOOIQYDn8En4TQdL0DG+3rR4qen4uKBz1Ny9NLRSQZQvqXcHz0aiBZsf5R2EAGtmlwVclpWq4cSMUeydhbflnLm6IrCT/9KGQymX04MSFFNxZyMgInjZwOjjripLj/UdiUNhWT3+CAaJ98ReJs/EthaqJsc7ZZ+hhsvA1myAY1Ba2GhMXJEBlW0Qk0JGHfP0SwsfY2CVd/41nvGnyMC/y8q2smrSrIA/Y+gGms0gZTdgWyGFqOJHkBOyoL09S7DuEbH8E0V0Umo7+FKe5u+UsuYJv+Dmy0vyPJmlfrb5rSMeixNmwmUQv4azaQF4BjyF1A5DwurbttvIMt7jR6YJhqw55kGadRFRrtNWzCrtabjJcpQebv1yBL1tvOayoDj1bTTSHa6APWO0XzMt8Zs+93YCf1rifYhRCmSNTTdPH71iHumkfOkiQy2tYhn6wUJtqFKV6o6BrVt8HVybU+NRZIMtWlAkMJmWgZPDaqh3rtlyG31jlFs/ZQXp5B5k/hgE8jw5wORqEzyNvcta1ueJ6Hp/8SE8yWw6ZxAZJ2i5pUy24pdr62+8zaZ6CVTR2kcmhPo4Js7BDikLYTMrW1rgraKp2DAKvpkGJmx8MlB4xSTgb/ygJj8cOXZE3dM2hlWPbtQExGfFzHEIXKefQTFZ0JTQhU0BtrWXeyrpoG9010VB05lvrbBYBjx3/E+3Cy6J0v2cnnVS98Io6Icj5REF8/Ah5buJSNi5tqK3vtuM8KmqhgW+hUZB3FjtfPMp51qBi/1iEpEw9xI8ioSrHGlNMrTkwRyAacGk1E3CiuYaOjdCp5ofVXHr7uIKaVuS8wgx4UAxsxFwcuHDiKb6CgT9fMB8B3uy8NG4OhfvMQl2S8nDOFmUfb0BsZ8wFOeAOJAgZXtb9eG83y9k6YDFrgomhFjZYM+UBeo09dgJ248uSqgq++CZjaXLOeDWhlbldMCDGt2IoZdy7Fc0dD0/sxVcBl1BJUy1dgo31ZK9NYe0VY3A3ImJ37uCTjclsbkcldjkkc2b0D8jeRTZp76xRsvFPGDTzRdNuPB0fOy9oItDaW5HB/GzZaLquwybEuZDzQyvA9P1Qh3zIb4+s1WjEyojyesTmdPNadGrZB1qe4YWWajAefwDC5f14kmH6MTF6UX2Rsdi2Xp7QdKNZcF8tkMt9dKTvYuxTBi0qZLE8nA6IzwCAL2Q93v6+awyO80haX12WIGqJS2Brjwvn22DYbJ8NJoTJIf8ABut6a+IBj1zG66LV2IKMZ30lObToZgFK/hUaxjMuO14PMZ0ggoyqsVTRgk41XysfI0PJLycbtBrZuQTIQ42rVPBClTXTLEBtp7WWdHCzTjpHRa69Kadyo4VnLgml2vdV7NGu/yOQDFab2b6jYKzKXIrbNai/LT5zI8Ce8Qg+lKq5eQVv1c0aMFpb2KwZ/TSZrxshcvibD/QqSKUNCt1lf8QiX521w6dwKCH6t1w0MODPd/IiM+WtCxVZFLQ10A6RtasXu2QOtDPkv6izanVAo25K3cTL9CWS4uofjJoQi7GTFVbTSkcsLl4JSrfYyXg4WajfuRrtspzHBdkQGNezaVkBBH61Wph0oOMKmborfHeflgUHY4YiMdhdOIkPsDhba89ec8asVBhurdGowvo2xv701obME2yyKk4kmVjml0UYfsK0UOV1hD9o6BEnWgeXSs3ByN0YGPe3p1IieMdEyBPtPptjpg0w7XJ1l6k3QymWUMdnJXDj3e6NA05MTLQP+GU6dScsBJ+crU9DehkvkfV6gXJz8nXNu3I3IVJ0pxXQZnYHmvOtKjuMBK9lp1h4okrCFiQxo5SnrtEeWoeUpjUHYaPdYbW+Bgi7urWjocdflRpZCjGgpPq3q79yIpxxgQmr2bEF1A/mmXvEV210JlcwB4/Khh4sIp3djnPKzZcSUgzUwYKhTTe892MRdhYL2MgpOfxuD//8mty+HZGr685m5n9q04cz5RikqaM6KyydjWaCVSUOHE5MLXmXLIxTa+tM2E/1JgwFDgIKmODj4IJX7ZelkMvWiq6IbTYBOnNUlcy6fC2f6WEH91QvvsYaA7rlYWnrh6Zg5rJ/TzNyNL6e5Mlxjd5QBTM5mHsEDEKu5XB/nUJa90Q6KhF/jvLLeUGQWmf6IzIRUNEaGN2DLijxErOKSfUAJZ7Av0OvCmZ2xRIIi/4mMVLNeyoOBgm5Lwk6XOuzg7RdJIcSiVzWcYRaCs3+jyrkziww2qnFMMBfavLi/xFNj1TeJUi3sxVZeFTFekIlGrrkw+6XEr8DXo7cg39xd3qiw5X3h3LnF9bVmHmqCm+fZMtW3yMiwpZki13eYXGJxY69pyOAGA0P3jfUR7j82m4TYdmbEo8Fr+S8K2XPVl6S5NAVd2uBYQwIytclyK75A8njlhL6uzbw2zfUPLNdeAuuN0pKy573BTK+ma3d9x5j9ZUMK8LjNTP1+emr2BOcWFDQ4FQkKehkuwMuUdhlXNWHm9Zqa7coArJB/JJPrOOQt5uTx93JpLKcH7e0zIjs92DjVmeM+T5YZVpvzppgi4OLMuT0c7+xIyZYyHlBXg+oQFiinKccYuLwfWEZo+htOfPBqOItUDAZv2TIu2VhfmeLdnE4F3h152zJ2mBsemdbbR4ZgBeRfIJPvcu5+XTyZOmPY9DYFZvTvIENUdbDPcv03dxmC2fe5gYKWRC46clrWpsv9CmhlejNj2C8GQ/bBLVOtNTuHeyYD5OHlekVJd3fBJUHrwAW3fAfhUoTTpzDj4MS//zdHf7yRw41ebjcolmpCbruL9QE4hcn9Nsb09swUeGx9RhBFwbuYo0NjauD/2j7nC5zgtDzQynD6Qwqn/x2OdsSGczVLwL1gwyMUNnpIQEEvzDTwiz+fKG78i8lJ5/1c5gU3UMFqVZ/wk8+L22jWMVESvA0kjYF8O5z/IZg96D/pXZuxo8VxuTrZkgEcT4321cK4oAjv4IdogU1OFqagS6eSyRq2/Noz5fx/hgzQx4gLm/PjBTU5vMPioPKIszuT6/kTAZGVyzleP2DTqGqC4qh38XAhHXXQyhDRyliQ+eS/f20Kskc/CPzpBcBJZHCwgNJtRchiFLQ3uBqTx0H/udyyE1XatVq7O9fOlA83kDGZtzY3FqKg600i8S6fMCvvyPyfuLBC4yaPCYPZatjq7Tc8wc5iUa4MuWxzAabxvm5xJ6sLE7Ksd3/HTDqhmRtKgJwZznFyBtOrmp4tSPco+TzgyoXTfwaLMvsz619jwDagPixowPfcm+OosULnN5BphY5kCV9P9TLeOYGkDBb117d36ZJHMk5Fe66bUbM711txhoVCiuYmnKJ5+BgJ2cB+vR69/8TA1h8bntuewwcovGQjxN8Nmyd80c7yOONRDRXthfP+Y8y4jM9o0tYc2wxcxwU6jlogOUvUNNZXVxp9iJf6z4DP4ZNIfBRYiPJceQMPfuO9lP5AQSdIpz5ob4NdcveFdwqT4XpkbBKQ0tp8ZJyuGCpoZiTmniGfwBnsyuBWhT9XYjKMsk+W0SdNNc14Mw9aWAKuGI57mlRS41mHeJHcpNjJmzPB5P5Z7qmnSatzuGYyrKLplGr5iMniQTJchlOYvAa/Vrv05zkw2N+XET5LY1BvpsHEwafpb5bcx8lvWuOK7SZURbO+MGI3IFrq+bcaGJOWFLRylOo5fNDJfKkzwUs2P4VGc/8Hvi0h94wtv8JfsMdyk4b93oLihei+fdmN5HxGHYAbwzFBB1uDibC5ag7uLEHMmyNbfgZTRDp4GfDdOVD8zYPUloqOw5tJ1J083GVOS8cRy3lif0Kw+3jmvtlcfU+AjOUdgY/E1HfSFObCISN8TIUZSCOJAU58sp/dAFOLyqwBi8WxqaAzbNjJXBoEtYzjYHqvs4JdRpjTxynPbsFN5Jrd3jlzKtjBaKyCDLE7eGfiVzJksI7h/NLF4Gklf+CQ/iM4Fmo07VeBJUbmFqTFz3c0WBeAYQ2l7yREBhxAaEL8z85VLUoIzMB7HjSULIlyoOdtMKnwdnJrnoJEQlS4HDwl8U5JksSznbzMviSFi0FD1l9uoMFSaHCpm6bWdkgiEyhWZu+EyGss/ZtdI/74iMWT4VJ1TR1UXcTZeTLdDe+IKPsfLJXQbiAlXxakLaMu7m+9VmDsKBl5Zh00Fb+uAhtBa53IN5YC3wii/j8CMjP9LOCkmdQFDjANZDQ9CmyEVr7MLgntH4NnvNJeA8RZYmVNq94cBK+BZhR0ORDDASIM1iCKmgmOa3xWLufhN/yiIOtbDqjI47zWdsglUYlWaA+2XBAC3Ttd4BOylgGh4YMcdvq+VO7WQaK3HawDm+HzvcP2XezRC4sEUOm1H7hkzJUJ397yMvVdBo6/YDu2JEvxzMRxCg6WTxfw/FDL+35SBOssUaAx+KziOT77JPEOjWWV9o/Pm2yJaG4e7y9q6szKlPYOv3zZWBb2D+qLsEqMD/y3FOCHLfius7W0+21LuLQ9+j+WLP6jlvQ5KVKkSJEiRYoUKVKkSJEiRYoUKVKkSJEiRYoUy8X/AwNpZEkAqiSgAAAAAElFTkSuQmCC'),
                ),
                onDismissed: (direction) {
                  AppMethods.dailogAlert(
                      context: context,
                      imagePathe:
                          'data:image/png;base64,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',
                      title: "delete ${state.cards[index].cardName.toString()}",
                      fun: () {
                        debugPrint(widget.uid);
                        debugPrint(state.cards[index].cardId);
                        BlocProvider.of<GetCardsCubit>(context).deleteCard(
                            cardEntity: state.cards[index], uid: widget.uid);
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
