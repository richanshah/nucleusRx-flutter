import '../../../../utils/exports.dart';

/// Creates RichText with clickable Register
/// substring among the whole string(text).
class CustomCard extends StatelessWidget {
   CustomCard({Key? key,required this.title,required this.subTitle, required this.onTap}) : super(key: key);
  final void Function() onTap;
  String title;
  String subTitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      shadowColor: Colors.black12,
      color: AppColors.white,
      child: SizedBox(
        width: 350,
        height: 300,
        child: Padding(
          padding: const EdgeInsets.all(Dimens.padding20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  Text(
                   title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ), //Textstyle
                  ),
                  GestureDetector(onTap:() => onTap,child: Icon(Icons.close,color: AppColors.labelGrimGreyColor,))
                ],
              ), //Text
              const SizedBox(
                height: 10,
              ), //SizedBox
               Text(
                subTitle,
                style: const TextStyle(
                  fontSize: 15,
                ), //Textstyle
              ), //Text
              const SizedBox(
                height: 10,
              ), //SizedBox
              ElevatedButton(
                onPressed: () => 'Null',
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.primaryDarkColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(5.0),
                  textStyle: const TextStyle(fontSize: 14),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Configure',overflow: TextOverflow.ellipsis,),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
