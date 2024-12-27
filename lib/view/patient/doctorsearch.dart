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
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    controller.fetchSearchDoctor();
                  },
                  icon: Icon(Icons.search)),
              Expanded(
                child: Form1(
                    hint1: 'doctor name',
                    mycontroller: controller.name,
                    valid: (p0) {
                      return vaidInput(p0!, 3, 25);
                    },
                    max: 1),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: InlineChoice<String>.single(
              clearable: true,
              value: controller.selectedValuelocation.value,
              onChanged: controller.setSelectedValue,
              itemCount: controller.city.length,
              itemBuilder: (state, i) {
                return ChoiceChip(
                  selected: state.selected(controller.city[i]),
                  onSelected: state.onSelected(controller.city[i]),
                  label: Text(controller.city[i]),
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
                            labelText: 'Specialty: ',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        popupProps: PopupProps.menu(
                          showSearchBox: true,
                          searchFieldProps: TextFieldProps(
                            decoration: InputDecoration(
                              labelText: "Search Specialties",
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
