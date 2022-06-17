import 'package:flutter/material.dart';
import 'package:jobqo/providers/wishlist_provider.dart';
import 'package:jobqo/shared/shared.dart';
import 'package:jobqo/ui/widgets/wishlist_card.dart';
import 'package:provider/provider.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

    Widget header() {
      return AppBar(
        backgroundColor: kBackgroundColor,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: kBlackColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Halaman Wishlist',
          style: primaryTextStyle.copyWith(
            fontWeight: medium,
          ),
        ),
      );
    }

    Widget emptywishlist() {
      return Expanded(
        child: Container(
          color: kBackgroundColor,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Halaman Wishlist\nMasih Kosong',
                style: blackTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: bold,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          color: kBackgroundColor,
          child: ListView(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              children: wishlistProvider.wishlist
                  .map(
                    (job) => WishlistCard(job),
                  )
                  .toList()),
        ),
      );
    }

    return Column(
      children: [
        header(),
        wishlistProvider.wishlist.length == 0 ? emptywishlist() : content(),
      ],
    );
  }
}
