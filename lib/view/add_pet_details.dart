import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mymall/model/infection.dart';
import 'package:mymall/model/medical_contact.dart';
import 'package:mymall/model/pet_model.dart';
import 'package:mymall/utils/calendar_utils.dart';
import 'package:mymall/utils/database_utils/hive_data_store.dart';

class AddPetDetails extends StatefulWidget {
  const AddPetDetails({Key? key}) : super(key: key);

  @override
  State<AddPetDetails> createState() => _AddPetDetailsState();
}

class _AddPetDetailsState extends State<AddPetDetails> {
  // Pet Information

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _breedController = TextEditingController();
  final TextEditingController _speciesController = TextEditingController();
  final TextEditingController _sexController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _dobContoller = TextEditingController();
  final TextEditingController _birthMarkController = TextEditingController();
  final TextEditingController _natureController = TextEditingController();
  final TextEditingController _pregnancyController = TextEditingController();
  final TextEditingController _sterilizationController =
      TextEditingController();

  // Clinic Information
  final TextEditingController _doctorNameController = TextEditingController();
  final TextEditingController _clinicAddressController =
      TextEditingController();
  final TextEditingController _clinicNameController = TextEditingController();
  final TextEditingController _clinicContactController =
      TextEditingController();

  // owner Information
  final TextEditingController _ownerNameController = TextEditingController();

  final TextEditingController _ownerAddressController = TextEditingController();

  final TextEditingController _ownerContactController = TextEditingController();

  final TextEditingController _ownerAltContactController =
      TextEditingController();

  final ValueNotifier<bool> _dogImageUpdate = ValueNotifier<bool>(false);
  final List<String> _dogImages = [];

  final ValueNotifier<bool> _birthMarkImageUpdate = ValueNotifier<bool>(false);
  String _birthMarkImage = "";

  final ValueNotifier<bool> _pictureWithOwnerUpdate =
      ValueNotifier<bool>(false);
  String _pictureWithOwner = "";

  final List<Infection> _treatmentList = [Infection()];

  List<ValueNotifier<bool>> isRecurringUpdateList = [
    ValueNotifier<bool>(false)
  ];

  final List<TextEditingController> _lastVisitDateController = [
    TextEditingController()
  ];

  final HiveDataStore dataStore = HiveDataStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(context),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back),
      ),
      title: const Text("Add Pet Details"),
      centerTitle: true,
    );
  }

  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // pet Information

            const Text(
              "Pet Information",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            _petInformationData(),
            const SizedBox(
              height: 10,
            ),

            // medical Contact

            const Text(
              "Medical Contact",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            _medicalContact(),

            const SizedBox(
              height: 10,
            ),

            const Text(
              "Upload Dog Image",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: _dogImage(),
            ),
            const SizedBox(
              height: 10,
            ),

            const Text(
              "Birthmark Image",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: _getBirthMarkImage(),
            ),
            const SizedBox(
              height: 10,
            ),

            const Text(
              "Picture With Owner",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: _getPictureWithOwner(),
            ),
            const SizedBox(
              height: 10,
            ),

            const Text(
              "Owner Information",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            _ownerInformation(),

            const SizedBox(
              height: 10,
            ),

            const Text(
              "Vaccine Information",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            _vaccineInformation(),

            const SizedBox(
              height: 10,
            ),

_saveButton()
          ],
        ),
      ),
    );
  }

  TextFormField _appTextField({
    required String labelText,
    TextEditingController? controller,
    Widget? suffixIcon,
    bool readOnly = false,
    bool enabled = true,
    Function()? onTap,
    Function(dynamic)? onChanged,
  }) {
    return TextFormField(
      controller: controller,
      enabled: enabled,
      readOnly: readOnly,
      onTap: readOnly ? onTap : null,
      onChanged: onChanged,
      decoration: InputDecoration(
        fillColor: Colors.grey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        suffixIcon: suffixIcon,
        label: Text(
          labelText,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Column _petInformationData() {
    return Column(
      children: [
        // pet name
        _appTextField(
          labelText: "Name",
          controller: _nameController,
        ),
        const SizedBox(
          height: 10,
        ),
        // pet breed
        _appTextField(
          labelText: "Breed",
          controller: _breedController,
        ),
        const SizedBox(
          height: 10,
        ),
        _appTextField(
          labelText: "Species",
          controller: _speciesController,
        ),
        const SizedBox(
          height: 10,
        ),
        _appTextField(
          labelText: "Sex",
          controller: _sexController,
        ),
        const SizedBox(
          height: 10,
        ),
        _appTextField(
          labelText: "Weigth",
          controller: _weightController,
        ),
        const SizedBox(
          height: 10,
        ),
        _appTextField(
          labelText: "D.O.B",
          readOnly: true,
          controller: _dobContoller,
          suffixIcon: const Icon(
            Icons.date_range,
            color: Colors.grey,
          ),
          onTap: () async {
            var date = await CalendarUtils.getDate(context);
            if (date != null) {
              _dobContoller.text = date;
            }
          },
        ),
        const SizedBox(
          height: 10,
        ),
        _appTextField(
          labelText: "BirthMark",
          controller: _birthMarkController,
        ),
        const SizedBox(
          height: 10,
        ),
        _appTextField(
          labelText: "Nature",
          controller: _natureController,
        ),
        const SizedBox(
          height: 10,
        ),
        _appTextField(
          labelText: "Last Pregnancy",
          controller: _pregnancyController,
        ),
        const SizedBox(
          height: 10,
        ),
        _appTextField(
          labelText: "Sterilization",
          controller: _sterilizationController,
        ),
      ],
    );
  }

  Column _medicalContact() {
    return Column(
      children: [
        // pet name
        _appTextField(
          labelText: "Doctor Name",
          controller: _doctorNameController,
        ),
        const SizedBox(
          height: 10,
        ),
        // pet breed
        _appTextField(
          labelText: "Clinic Address",
          controller: _clinicAddressController,
        ),
        const SizedBox(
          height: 10,
        ),
        _appTextField(
          labelText: "Clinic Name",
          controller: _clinicNameController,
        ),
        const SizedBox(
          height: 10,
        ),
        _appTextField(
          labelText: "Clinic Contact",
          controller: _clinicContactController,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget _dogImage() {
    return ValueListenableBuilder<bool>(
      valueListenable: _dogImageUpdate,
      builder: (context, b, __) {
        return _imageList();
      },
    );
  }

  Widget _getBirthMarkImage() {
    return ValueListenableBuilder<bool>(
      valueListenable: _birthMarkImageUpdate,
      builder: (context, b, __) {
        return _birthMarkImage.isNotEmpty
            ? SizedBox(
                width: 400,
                height: 300,
                child: Image.memory(base64Decode(_birthMarkImage)),
              )
            : _addButton(onTap: () async {
                var image = await _selectImage();

                _birthMarkImage = image;
                _birthMarkImageUpdate.value = true;
              });
      },
    );
  }

  Widget _getPictureWithOwner() {
    return ValueListenableBuilder<bool>(
      valueListenable: _pictureWithOwnerUpdate,
      builder: (context, b, __) {
        return _pictureWithOwner.isNotEmpty
            ? SizedBox(
                width: 400,
                height: 300,
                child: Image.memory(base64Decode(_pictureWithOwner)),
              )
            : _addButton(onTap: () async {
                var image = await _selectImage();

                _pictureWithOwner = image;
                _pictureWithOwnerUpdate.value = true;
              });
      },
    );
  }

  Widget _imageList() {
    return Column(
      children: [
        _addButton(onTap: () {
          _dogImageUpdate.value = false;
          _selectMultipleImages();
        }),
        _dogImages.isNotEmpty
            ? GridView.builder(
                itemCount: _dogImages.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Image.memory(
                      base64Decode(_dogImages[index]),
                      fit: BoxFit.contain,
                    ),
                  );
                },
              )
            : const SizedBox.shrink(),
      ],
    );
  }

  Widget _addButton({required Function() onTap}) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.grey,
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  void _selectMultipleImages() async {
    final ImagePicker imagePicker = ImagePicker();
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      for (var element in selectedImages) {
        List<int> imageBytes = await element.readAsBytes();
        String base64Image = base64Encode(imageBytes);
        _dogImages.add(base64Image);
      }
    }

    _dogImageUpdate.value = true;
  }

  Column _ownerInformation() {
    return Column(
      children: [
        // pet name
        _appTextField(
          labelText: "Owner Name",
          controller: _ownerNameController,
        ),
        const SizedBox(
          height: 10,
        ),
        // pet breed
        _appTextField(
          labelText: "Owner Address",
          controller: _ownerAddressController,
        ),
        const SizedBox(
          height: 10,
        ),
        _appTextField(
          labelText: "Owner Contact",
          controller: _ownerContactController,
        ),
        const SizedBox(
          height: 10,
        ),
        _appTextField(
          labelText: "Owner AltContact",
          controller: _ownerAltContactController,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Column _vaccineInformation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Treatment Information",
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ListView.builder(
            itemCount: _treatmentList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  const Divider(
                    height: 1,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  // treatment
                  _appTextField(
                    labelText: "Treatment",
                    onChanged: (treatment) {
                      _treatmentList[index].treatment = treatment;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  // infection
                  _appTextField(
                    labelText: "Infection",
                    onChanged: (infection) {
                      _treatmentList[index].infection = infection;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  // infection
                  _appTextField(
                    labelText: "Last Visit Date",
                    controller: _lastVisitDateController[index],
                    readOnly: true,
                    suffixIcon: const Icon(
                      Icons.date_range,
                      color: Colors.grey,
                    ),
                    onTap: () async {
                      var date = await CalendarUtils.getDate(context);
                      if (date != null) {
                        _treatmentList[index].lastVisitDate = date;
                        _lastVisitDateController[index].text = date;
                      }
                    },
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  ValueListenableBuilder<bool>(
                    valueListenable: isRecurringUpdateList[index],
                    builder: (context, isRecurring, __) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CheckboxListTile(
                            title: const Text("Is Recurring"),
                            value: isRecurring,
                            onChanged: (newValue) {
                              isRecurringUpdateList[index].value = newValue!;
                              _treatmentList[index].isRecurring = isRecurring;
                            },
                            controlAffinity: ListTileControlAffinity
                                .leading, //  <-- leading Checkbox
                          ),

                          // recurringDays
                          _appTextField(
                            labelText: "RecurringDays",
                            enabled: isRecurring,
                            onChanged: (recurringDays) {
                              _treatmentList[index].recurringDays =
                                  recurringDays;
                            },
                          ),
                        ],
                      );
                    },
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // doctorDetails
                  _appTextField(
                    labelText: "DoctorDetails",
                    onChanged: (doctorDetails) {
                      _treatmentList[index].doctorDetails = doctorDetails;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              );
            }),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: MaterialButton(
            color: Colors.blue,
            minWidth: MediaQuery.of(context).size.width * 0.4,
            child: const Text(
              "Add Treatment",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              _treatmentList.add(Infection());
              isRecurringUpdateList.add(ValueNotifier<bool>(false));
              _lastVisitDateController.add(TextEditingController());
              setState(() {});
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Future<String> _selectImage() async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? selectedImages =
        await imagePicker.pickImage(source: ImageSource.gallery);

    String base64Image = "";
    if (selectedImages != null) {
      List<int> imageBytes = await selectedImages.readAsBytes();
      base64Image = base64Encode(imageBytes);
    }

    return base64Image;
  }

  Widget _saveButton() {
    return  SizedBox(
      width: MediaQuery.of(context).size.width,
      child: MaterialButton(
        color: Colors.blue,
        minWidth: MediaQuery.of(context).size.width * 0.4,
        child: const Text(
          "Save Details",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: () {
          dataStore.addUser(petModel: PetModel(uid: "1",name: "Jitarth",medicalContact: MedicalContact(doctorName: "Rutvij",clinicAddress: "ahmedabad",clinicContact: "33434443434"),dogImages:["dqwdqwdqwd","qwdqdqwdqwdqwd"]));
        },
      ),
    );
  }
}
