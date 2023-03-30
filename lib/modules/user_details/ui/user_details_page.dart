import 'dart:io';
import 'package:image_picker/image_picker.dart';

import '../../../utils/exports.dart';

class UserDetailsPage extends BaseGetView<UserDetailsController> {
  const UserDetailsPage({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
        appBar: MainAppBar(title: 'User Details'),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Scrollbar(
            scrollbarOrientation: ScrollbarOrientation.bottom,
            child: UserDetailsItem(),
          ),
        ));
  }

  @override
  String? getTag() => (UserDetailsPage).toString();
}

class UserDetailsItem extends StatefulWidget {
  const UserDetailsItem({Key? key}) : super(key: key);

  @override
  State<UserDetailsItem> createState() => _UserDetailsItemState();
}

class _UserDetailsItemState extends State<UserDetailsItem> {
  /// Variables
  File? imageFile;

  _setPlaceHolder() async {
    this.imageFile = await ImageUtils.imageToFile(
        imageName: "ic_placeholder_user", ext: "png");
  }

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;
    _setPlaceHolder();
    return Column(
      children: [
        Flexible(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              ProfileWidget(
                imagePath: imageFile==null? user.imagePath:imageFile?.path,
                onClicked: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Wrap(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Text('Profile Photo')),
                          ),
                          ListTile(
                            leading: Container(
                                decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(6)),
                                child: const Icon(Icons.camera_alt_rounded)),
                            title: const Text('Camera'),
                            onTap: () {
                              _getFromCamera();
                            },
                          ),
                          ListTile(
                            leading: Container(
                                decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(6)),
                                child: const Icon(
                                    Icons.enhance_photo_translate_outlined)),
                            title: const Text('Gallery'),
                            onTap: () {
                              _getFromGallery();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 12),
              const Center(
                child: Text(
                    maxLines: 1,
                    'Richa Shah',
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    )),
              ),
              const CustomDividerSpacer(),
              buildDob(user),
              const CustomDividerSpacer(),
              buildSex(user),
              const CustomDividerSpacer(),
              buildMRN(user),
              const CustomDividerSpacer(),
              buildPhone(user),
              const CustomDividerSpacer(),
              buildEmail(user),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildDob(User user) => Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "DOB",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
            ),
            const SizedBox(height: 4),
            Text(
              user.dob,
              style: const TextStyle(color: Colors.grey),
            ),
            const Divider(),
          ],
        ),
      );

  Widget buildSex(User user) => Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "SEX",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
            ),
            const SizedBox(height: 4),
            Text(
              user.gender,
              style: const TextStyle(color: Colors.grey),
            ),
            const Divider(),
            // color: Colors.grey,height: 1,thickness: 1.0)
          ],
        ),
      );

  Widget buildPhone(User user) => Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "PHONE",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
            ),
            const SizedBox(height: 4),
            Text(
              user.phone,
              style: const TextStyle(color: Colors.grey),
            ),
            const Divider(),
            // color: Colors.grey,height: 1,thickness: 1.0)
          ],
        ),
      );

  Widget buildEmail(User user) => Center(
        child: Align(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "EMAIL",
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
              ),
              const SizedBox(height: 4),
              Text(
                user.email,
                style: const TextStyle(color: Colors.grey),
              ),
              const Divider(),
              // color: Colors.grey,height: 1,thickness: 1.0)
            ],
          ),
        ),
      );

  Widget buildMRN(User user) => Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "MRN",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
            ),
            const SizedBox(height: 4),
            Text(
              user.mrn,
              style: const TextStyle(color: Colors.grey),
            ),
            const Divider(),
          ],
        ),
      );

  /// Get from gallery
  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        Get.back();
        imageFile = File(pickedFile.path);
        print(imageFile?.path);
      });
    }
  }

  /// Get from Camera
  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        Get.back();
        imageFile = File(pickedFile.path);
        print(imageFile?.path);
      });
    }
  }
}

