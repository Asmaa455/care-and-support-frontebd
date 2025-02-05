import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/content/form.dart';
import 'package:supcar/content/profileimage.dart';
import 'package:supcar/content/valid.dart';
import 'package:supcar/controller/doctor_profile_controller.dart';

class UpdateProfile extends StatelessWidget {
  UpdateProfile({super.key});
  DoctorProfileController controller = Get.put(DoctorProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '135'.tr,
          style: TextStyle(color: lightPink, fontWeight: FontWeight.bold),
        ),
        backgroundColor: deepPurple,
        centerTitle: true,
      ),
      body: Form(
          key: controller.formstate1,
          child: Obx(
            () => Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ProfileImage(onEdit: () {}),
                  Form1(
                      mycontroller: controller.firstNamecontroller,
                      valid: (p0) {
                        return Valid().vaidInput(p0!, 0, 20);
                      },
                      max: 1),
                  Form1(
                      mycontroller: controller.secondNamecontroller,
                      valid: (p0) {
                        return Valid().vaidInput(p0!, 0, 20);
                      },
                      max: 1),
                  Container(
                    margin: const EdgeInsets.only(top: 10, left: 4, right: 4),
                    child: DropdownSearch<String>(
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
                  ),
                  Form1(
                      mycontroller: controller.clinicLocationcontroller,
                      valid: (p0) {
                        return Valid().vaidInput(p0!, 0, 20);
                      },
                      max: 1),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                        color: pink,
                        border: Border.all(color: deepPurple),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                      onPressed: () {
                        if (controller.formstate1.currentState?.validate() ??
                            false) {
                          controller.updateDoctorData();
                        } else {
                          print('Form validation failed');
                        }
                      },
                      child: Text('133'.tr),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
