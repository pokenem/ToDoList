import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdlist/page/presentation/todo_bloc.dart';
import '../../../localization/s.dart';
import '../../../theme/app_color.dart';
import '../home_page.dart';

class MySliverAppBar extends StatelessWidget {
  final bool isVis;
  final Function(bool newValue) updateParent;

  const MySliverAppBar({
    super.key,
    required this.isVis,
    required this.updateParent,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: CustomSliverAppBarDelegate(
        isVis: isVis,
        updateParent: updateParent,
      ),
      pinned: true,
    );
  }
}

class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final bool isVis;
  final Function(bool newValue)? updateParent;

  const CustomSliverAppBarDelegate({
    required this.isVis,
    required this.updateParent,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        boxShadow: [
          if (shrinkOffset / 106 >= 1)
            const BoxShadow(
              color: AppColor.clGreyLight,
              spreadRadius: 3,
              blurRadius: 5.0,
            )
          else
            const BoxShadow(
              color: Colors.transparent,
            ),
        ],
      ),
      child: SafeArea(
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 60 - (44 * shrinkOffset / 106) >= 16
                    ? 60 - (44 * shrinkOffset / 106)
                    : 16,
                bottom: 44 - (44 * shrinkOffset / 106) >= 16
                    ? 44 - (44 * shrinkOffset / 106)
                    : 16,
              ),
              child: Text(
                S.of(context).get('myTasks'),
                style: TextStyle(
                  fontSize: 32 - 12 * ((shrinkOffset / 106).clamp(0, 1)),
                  height: 1.6 - 0.4125 * ((shrinkOffset / 106).clamp(0, 1)),
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 16,
                left: 60 - (44 * shrinkOffset / 106) >= 16
                    ? 60 - (44 * shrinkOffset / 106)
                    : 16,
              ),
              child: Opacity(
                opacity: (1 - (shrinkOffset / 26)).clamp(0, 1),
                child: Text(
                  '${S.of(context).get('done')} — ${howMuch(context)}',
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.25,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.secondaryContainer,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 16,
                  bottom: 0,
                ),
                child: IconButton(
                  onPressed: () {
                    if (updateParent != null) {
                      bool newIsVis = !isVis;
                      updateParent!(newIsVis);
                    }
                    logger.i('Pressed visibility iconButton in MyHomePage');
                  },
                  color: Colors.white,
                  icon: isVis
                      ? const Icon(
                          Icons.visibility_off_outlined,
                          color: AppColor.clBlue,
                        )
                      : const Icon(
                          Icons.visibility_outlined,
                          color: AppColor.clBlue,
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 220;

  @override
  double get minExtent => 104;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}

int howMuch(BuildContext context) {
  int kol = 0;
  for (int i = 0; i < context.read<TodoBloc>().state.length; i++) {
    if (context.read<TodoBloc>().state[i].isDone!) kol++;
  }
  return kol;
}
