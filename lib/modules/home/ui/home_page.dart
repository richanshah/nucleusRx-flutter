import 'package:swipeable_card_stack/swipeable_card_stack.dart';

import '../../../utils/exports.dart';

class HomePage extends BaseGetView<HomeController> {
  HomePage({Key? key}) : super(key: key);
  int counter = 4;

  @override
  Widget buildView(BuildContext context) {
    //create a CardController
    SwipeableCardSectionController _cardController =
        SwipeableCardSectionController();
    return Scaffold(
      drawer: CustomDrawer(),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          /*  MainAppBar(
            title: AppString.home.tr,
          ),*/
          AppBar(
              leading: IconButton(
                onPressed: () {
                  // toggleDrawer();
                },
                icon: Image.asset(Assets.images.icLogo.path),
              ),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.calendar_today_rounded,
                    color: AppColors.yellowColor,
                  ),
                  onPressed: () {
                    // do something
                  },
                )
              ],
              backgroundColor: AppColors.primaryColor),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SwipeableCardsSection(
                    context: context,
                    cardController: _cardController,
                    items: [
                      CustomCard(
                          title: 'Load medications',
                          subTitle: 'Please complete medication setup',
                          onTap: () {
                            _cardController.triggerSwipeUp();
                          }),
                      CustomCard(
                          title: 'Load medications',
                          subTitle: 'Please complete medication setup',
                          onTap: () {
                            _cardController.triggerSwipeUp();
                          }),
                      CustomCard(
                          title: 'Load medications',
                          subTitle: 'Please complete medication setup',
                          onTap: () {
                            _cardController.triggerSwipeUp();
                          }),
                      CustomCard(
                          title: 'Load medications',
                          subTitle: 'Please complete medication setup',
                          onTap: () {
                            _cardController.triggerSwipeUp();
                          }),
                      CustomCard(
                          title: 'Load medications',
                          subTitle: 'Please complete medication setup',
                          onTap: () {
                            _cardController.triggerSwipeUp();
                          }),
                    ],
                    onCardSwiped: (dir, index, widget) {
                      //Add the next card
                  /*    if (counter <= 20) {
                        _cardController.addItem(CustomCard(
                            title: 'Load medications',
                            subTitle: 'Please complete medication setup',
                            onTap: () {
                              _cardController.triggerSwipeUp();
                            }));
                        counter++;
                      }*/

                      if (dir == Direction.left) {
                        print(
                            'onDisliked ${(widget as CustomCard).title} $index');
                      } else if (dir == Direction.right) {
                        print('onLiked ${(widget as CustomCard).title} $index');
                      } else if (dir == Direction.up) {
                        print('onUp ${(widget as CustomCard).title} $index');
                      } else if (dir == Direction.down) {
                        print('onDown ${(widget as CustomCard).title} $index');
                      }
                    },
                    enableSwipeUp: true,
                    enableSwipeDown: false,
                  ),
                  WellnessCard(
                      title: 'Wellness screening',
                      subTitle:
                          'Take all your medications on time even if you feel good',
                      onTap: () {}),
                  DoseCard(
                      title: 'Wellness screening',
                      subTitle:
                          'Take all your medications on time even if you feel good',
                      onTap: () {}),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  String? getTag() => (HomePage).toString();
}
