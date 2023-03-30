import '../../../utils/exports.dart';

class MedSummaryPage extends BaseGetView<MedSummaryController> {
  const MedSummaryPage({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      drawer:  CustomDrawer(),
      body: Column(
        children: [
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
          Flexible(
            child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: 5,
                padding: const EdgeInsets.all(8),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      ListTile(
                        trailing: SvgPicture.asset(
                          // Assets.images.icShare.path,
                          Assets.svgs.icPdd,
                          height: 30,
                          fit: BoxFit.contain,
                        ),
                        title: const Text('budesonide',
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),

                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("40 mg ",
                                style: TextStyle(fontWeight: FontWeight.w100,fontSize: 16)),
                            Text("Once a day",
                                style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16))
                          ],
                        ),
                        visualDensity: VisualDensity.comfortable,
                        contentPadding: const EdgeInsets.all(6),
                        dense: true,
                        isThreeLine: true,
                      ),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }

  @override
  String? getTag() => (MedSummaryPage).toString();
}
