import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supcar/content/form.dart';
import 'package:supcar/content/profileimage.dart';
import 'package:supcar/content/valid.dart';
import 'package:supcar/controller/asdoctorcontroller.dart';
import 'package:intl_phone_field2/intl_phone_field.dart';

class AsDoctor extends StatelessWidget {
  AsDoctor({super.key});
  final Asdoctorcontroller controller = Get.put(Asdoctorcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Obx(
        () => Container(
          child: ProfileImage(
            profileImage: controller.profileImage.value != null
                ? MemoryImage(controller.profileImage.value!)
                : null,
            onEdit: controller.selectProfileImage,
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(right: 20, left: 20, top: 10),
        child: Column(
          children: [
            Obx(() {
              return Column(
                children: [
                  DropdownSearch<String>(
                    key: controller.dropDownKey,
                    selectedItem:
                        controller.selectedValueSpecialites.value.isEmpty
                            ? null
                            : controller.selectedValueSpecialites.value,
                    items: (ilter, infiniteScrollProps) =>
                        controller.medicalSpecialties,
                    decoratorProps: DropDownDecoratorProps(
                      decoration: InputDecoration(
                        labelText: '73'.tr + ':',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                    popupProps: PopupProps.menu(
                      showSearchBox: true,
                      searchFieldProps: TextFieldProps(
                        decoration: InputDecoration(
                          labelText: "74".tr,
                        ),
                      ),
                      fit: FlexFit.loose,
                      constraints: BoxConstraints(),
                    ),
                    onChanged: (String? newValue) {
                      controller.selectedValueSpecialites.value =
                          newValue ?? '';
                      print(
                          'Selected Specialty: ${controller.selectedValueSpecialites.value}');
                    },
                    filterFn: (item, filter) =>
                        item.toLowerCase().startsWith(filter.toLowerCase()),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                  )
                ],
              );
            }),
            Container(
              child: IntlPhoneField(
                controller: controller.phoneNumber,
                positionedPopup: true,
                textFieldIsDense: true,
                prefixHeight: 10,
                flagWidth: 20,
                textFieldPadding: EdgeInsets.all(0),
                popupWidth: MediaQuery.sizeOf(context).width / 4,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(),
                  ),
                ),
                languageCode: "en",
                onChanged: (phone) {
                  print(phone.completeNumber);
                },
                onCountryChanged: (country) {
                  print('Country changed to: ' + country.name);
                },
              ),
            ),
            Form1(
                hint1: 'connection information',
                mycontroller: controller.connectionInformation,
                valid: (p0) {
                  return Valid().vaidInput(p0!, 4, 10);
                },
                max: 1)
          ],
        ),
      ),
    ])));
  }
}
