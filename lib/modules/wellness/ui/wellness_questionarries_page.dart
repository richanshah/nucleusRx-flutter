
import '../../../utils/exports.dart';

class WellnessQuestionsPage extends BaseGetView<WellnessController> {
  WellnessQuestionsPage({Key? key}) : super(key: key);




  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomAppBar(
            title: 'Wellness screening',
            onBackPressed: controller.onBackPressed,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.separated(
                itemCount: controller.questions.length,
                separatorBuilder: (context, position) {
                  return Divider(
                    thickness: 1.0,
                  );
                },
                itemBuilder: (context, position) {
                  String question = controller.questions[position];
                  // QuizPaperModel vitalsModel=controller.vitalsItem.value[index];

                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'Title of the first question is this much long and it should be displayed properly: $question',
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        Wrap(
                          alignment: WrapAlignment.spaceEvenly,
                          children: controller.options.map((answer) {
                            int index = controller.options.indexOf(answer);
                            return
                            Obx(() =>
                              InkWell(
                                onTap: () {
                                  controller.selectedAnswer[question] = answer;
                                },
                                child: Wrap(
                                  spacing: 4.0,
                                  direction: Axis.vertical,
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                        color:  _getColorFromIndex(index),
                                        borderRadius: BorderRadius.circular(5.0),
                                      ),
                                      child: Icon(
                                        controller.selectedAnswer[question] == answer
                                            ? Icons.check_box
                                            : Icons.check_box_outline_blank,
                                        size: 40.0,
                                        color: controller.selectedAnswer[question] == answer
                                            ? Colors.black
                                            : _getColorFromIndex(index),
                                      ),
                                    ),
                                    Text('$answer'),
                                  ],
                                ),
                              )
                            );

                          }).toList(),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              style: TextButton.styleFrom(
                backgroundColor: AppColors.primaryDarkColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(10.0),
                textStyle: const TextStyle(fontSize: 14),
              ),

              onPressed: () async {
                Get.snackbar("Answers Selected ==> ", controller.selectedAnswer.string,
                    colorText: Colors.white,
                    backgroundColor: AppColors.primaryColor,
                    snackPosition: SnackPosition.BOTTOM,
                    titleText: const Text(""));
                    controller.onBackPressed();
              },
              child: const Text('Save'),
            ),
          )
        ],
      ),
    );
  }

  Color _getColorFromIndex(int index) {
    switch(index){
      case 0 :
        return Colors.green;
        break;
      case 1 :
        return Colors.red;
        break;
      default:
        return Colors.grey;

    }
  }

  @override
  String? getTag() => (WellnessPage).toString();


}
