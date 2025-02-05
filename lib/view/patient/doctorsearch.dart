import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/content/form.dart';
import 'package:supcar/content/valid.dart';
import 'package:supcar/controller/doctorsearchcontroller.dart';
import 'package:supcar/fonts/my_flutter_app_icons.dart';
import 'package:choice/choice.dart';
import 'package:dropdown_search/dropdown_search.dart';

class Doctorsearch extends StatelessWidget {
  Doctorsearch({super.key});
  final Doctorsearchcontroller controller = Get.put(Doctorsearchcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Icon(
          MyFlutterApp.nounDoctorSearch,
          color: lightPink,
          weight: 2,
          size: 50,
        ),
        backgroundColor: deepPurple,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 10,
          ),
          Row(
            children: [
              Container(
                width: 20,
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 5, right: 5),
                width: 50,
                child: IconButton(
                    onPressed: () {
                      controller.fetchSearchDoctor();
                    },
                    icon: Icon(Icons.search)),
              ),
              Expanded(
                child: Container(
                  // margin: EdgeInsets.all(20),
                  child: TextFormField(
                      decoration: InputDecoration(
                          hintText: '76'.tr,
                          label: Text('75'.tr),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: deepPurple))),
                      controller: controller.name,
                      validator: (p0) {
                        return Valid().vaidInput(p0!, 3, 25);
                      },
                      maxLines: 1),
                ),
              ),
              Container(
                width: 20,
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: InlineChoice<String>.single(
              clearable: true,
              value: controller.selectedValuelocation.value,
              onChanged: controller.setSelectedValue,
              itemCount: controller.city.length,
              itemBuilder: (state, i) {
                return ChoiceChip(
                  selected: state.selected(controller.city[i]),
                  onSelected: state.onSelected(controller.city[i]),
                  label: Text(
                    controller.city[i],
                    style: TextStyle(
                        color: deepPurple, fontWeight: FontWeight.bold),
                  ),
                  selectedColor: lightPink,
                  backgroundColor: pink,
                  side: BorderSide(color: deepPurple),
                );
              },
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
                            border: OutlineInputBorder(),
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
                Obx(
                  () => GridView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisExtent: 120,
                    ),
                    scrollDirection: Axis.vertical,
                    itemCount: controller.alldoctor.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Container(
                          color: lightBlue,
                          height: 100,
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                  alignment: Alignment.center,
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: deepPurple,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Image.asset(
                                    controller.alldoctor[index].profilePicture,
                                    height: 80,
                                    width: 80,
                                  )),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${controller.alldoctor[index].user.firstName} ${controller.alldoctor[index].user.secondName}',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    controller.alldoctor[index].specialization,
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    controller.alldoctor[index].clinicLocation,
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
