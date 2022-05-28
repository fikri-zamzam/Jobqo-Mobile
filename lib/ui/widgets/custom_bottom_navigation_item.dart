import 'package:flutter/material.dart';
import 'package:jobqo/cubit/page_cubit.dart';
import 'package:jobqo/shared/shared.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomNavigationItem extends StatelessWidget {
  final int index;
  final String imageUrl;
  // final bool isSelected;

  const CustomBottomNavigationItem(
      {Key? key,
      required this.imageUrl,
      // this.isSelected = false,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PageCubit>().setPage(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Image.asset(
            imageUrl,
            width: 24,
            height: 24,
            color: context.read<PageCubit>().state == index
                ? kPrimaryColor
                : kGreyColor,
          ),
          Container(
            width: 30,
            height: 2,
            decoration: BoxDecoration(
              color: context.read<PageCubit>().state == index
                  ? kPrimaryColor
                  : kTransparentColor,
              borderRadius: BorderRadius.circular(defaultRadius),
            ),
          )
        ],
      ),
    );
  }
}
