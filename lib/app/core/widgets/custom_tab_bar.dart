import '../../../utils/exports.dart';

/// Provide TabBar as per our app's design and requirements.
///
/// Used in [HomePage] to show tabs for YourChild View And BusRoutes view.
class CustomTabBar extends StatelessWidget {
  const CustomTabBar({Key? key, this.height, this.showBottomBorder = true, this.borderWidth, required this.tabs, required this.onTap, required this.tabController}) : super(key: key);
  /// Height of TabBar view
  final double? height;
  /// Whether to show bottom border or not.
  final bool showBottomBorder;
  /// Bottom Border width, default will be [Dimens.borderWidthSmall].
  final double? borderWidth;
  /// [List] of [Tab] to be shown.
  final List<Tab> tabs;
  /// [onTap] function to handle taps of tabs.
  final Function(int position) onTap;
  /// [TabController] to control and sync [TabBar] and [TabBarView].
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.appBarShadow,
            style: showBottomBorder ? BorderStyle.solid : BorderStyle.none,
            width: borderWidth ?? Dimens.borderWidthSmall.h,
          ),
        ),
      ),
      child: TabBar(
        tabs: tabs,
        onTap: onTap,
        controller: tabController,
        padding: EdgeInsets.zero,
      ),
    );
  }
}
