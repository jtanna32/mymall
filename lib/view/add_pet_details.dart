import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mymall/utils/calendar_utils.dart';

class AddPetDetails extends StatefulWidget {
  const AddPetDetails({Key? key}) : super(key: key);

  @override
  State<AddPetDetails> createState() => _AddPetDetailsState();
}

class _AddPetDetailsState extends State<AddPetDetails> {
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

  final TextEditingController _doctorNameController = TextEditingController();
  final TextEditingController _clinicAddressController =
      TextEditingController();
  final TextEditingController _clinicNameController = TextEditingController();
  final TextEditingController _clinicContactController =
      TextEditingController();

  final TextEditingController _ownerNameController =
      TextEditingController();

  final TextEditingController _ownerAddressController =
      TextEditingController();

  final TextEditingController _ownerContactController =
      TextEditingController();

  final TextEditingController _ownerAltContactController =
      TextEditingController();

  ValueNotifier<bool> _update = ValueNotifier<bool>(false);
  List<String> _dogImages =[];

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
          ],
        ),
      ),
    );
  }

  TextFormField _appTextField({
    required String labelText,
    required TextEditingController controller,
    Widget? suffixIcon,
    bool readOnly = false,
    Function()? onTap,
  }) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      onTap: readOnly ? onTap : null,
      decoration: InputDecoration(
        fillColor: Colors.grey,
        focusColor: Colors.grey,
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
      valueListenable: _update,
      builder: (context, b, __) {
        return _dogImages.isNotEmpty ? _imageList() : _addButton();
      },
    );
  }

  Widget _imageList() {
    return GridView.builder(
      itemCount: _dogImages.length,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: /*(orientation == Orientation.portrait) ? 2 :*/ 3),
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Image.memory(base64Decode(_dogImages[index])),
        );
      },
    );
  }

  Widget _addButton() {
    return InkWell(
      onTap: () {
        _selectImages();
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

  void _selectImages() async {
    final ImagePicker imagePicker = ImagePicker();
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      for (var element in selectedImages)  {
        List<int> imageBytes = await element.readAsBytes();
        String base64Image = base64Encode(imageBytes);
        _dogImages.add(base64Image);
      }
    }

    _update.value = true;
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
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 10,
        ),

        // pet name
        _appTextField(
          labelText: "Vaccination Name",
          controller: _ownerNameController,
        ),
        const SizedBox(
          height: 10,
        ),
        // pet breed
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
