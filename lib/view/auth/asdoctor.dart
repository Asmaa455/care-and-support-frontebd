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
                  ),
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
                      hint1: 'Clinic location',
                      mycontroller: controller.connectionInformation,
                      valid: (p0) {
                        return Valid().vaidInput(p0!, 4, 10);
                      },
                      max: 1),
                  Container(
                    height: 40,
                    padding: EdgeInsets.only(right: 10, left: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Text('Add certificate photo'),
                        IconButton(
                            onPressed: () =>
                                controller.selectCertificationImage(),
                            icon: Icon(Icons.add_a_photo)),
                        controller.certificationImage.value != null
                            ? Row(
                                children: [Icon(Icons.check_circle)],
                              )
                            : Container()
                      ],
                    ),
                  ),
                ],
              );
            }),
            Container(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                    child: DropdownSearch<String>(
                  key: controller.dropDownKey,
                  selectedItem: controller.selectedValueCity.value.isEmpty
                      ? null
                      : controller.selectedValueCity.value,
                  items: (ilter, infiniteScrollProps) => controller.city,
                  decoratorProps: DropDownDecoratorProps(
                    decoration: InputDecoration(
                      labelText: 'Select a City:',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  popupProps: PopupProps.menu(
                    showSearchBox: true,
                    searchFieldProps: TextFieldProps(
                      decoration: InputDecoration(
                        labelText: 'Search City',
                      ),
                    ),
                    fit: FlexFit.loose,
                    constraints: BoxConstraints(),
                  ),
                  onChanged: (String? newValue) {
                    controller.selectedValueCity.value = newValue ?? '';
                    print(
                        'Selected City: ${controller.selectedValueCity.value}');
                  },
                  filterFn: (item, filter) =>
                      item.toLowerCase().startsWith(filter.toLowerCase()),
                )),
              ],
            )
          ],
        ),
      ),
    ])));
  }
}
