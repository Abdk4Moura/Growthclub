import 'package:flutter/material.dart';
import 'package:growthclub/growthron_ui.dart';

class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage({Key? key}) : super(key: key);

  @override
  _CreateTaskPageState createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  String? teamSelectValue;
  TextEditingController? shortBioController;
  TextEditingController? userNameController;
  String? userSelectValue1;
  String? userSelectValue2;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    shortBioController = TextEditingController();
    userNameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Create Task',
          style: Theme.of(context).textTheme.headline1?.apply(
                color: const Color(0xFF14181B),
              ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
            child: IconButton(
              iconSize: 48,
              icon: const Icon(
                Icons.close_rounded,
                color: Color(0xFF57636C),
                size: 30,
              ),
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
          ),
        ],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                      child: TextFormField(
                        controller: userNameController,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Task Name',
                          labelStyle:
                              Theme.of(context).textTheme.headline3?.apply(
                                    fontFamily: 'Outfit',
                                    color: const Color(0xFF57636C),
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFF1F4F8),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFF1F4F8),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                              20, 32, 20, 12),
                        ),
                        style: Theme.of(context).textTheme.headline3?.apply(
                              fontFamily: 'Outfit',
                              color: const Color(0xFF14181B),
                            ),
                        textAlign: TextAlign.start,
                        maxLines: 1,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                      child: TextFormField(
                        controller: shortBioController,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Enter description here...',
                          hintStyle:
                              Theme.of(context).textTheme.bodyText2?.apply(
                                    fontFamily: 'Outfit',
                                    color: const Color(0xFF57636C),
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFF1F4F8),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFF1F4F8),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                              20, 32, 20, 12),
                        ),
                        style: Theme.of(context).textTheme.bodyText1?.apply(
                              fontFamily: 'Outfit',
                              color: const Color(0xFF14181B),
                            ),
                        textAlign: TextAlign.start,
                        maxLines: 4,
                        keyboardType: TextInputType.multiline,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                      child: GrowthronDropdown(
                        options: ['Team 1', 'Team 2', 'Team 3'],
                        onChanged: (val) =>
                            setState(() => teamSelectValue = val),
                        width: double.infinity,
                        height: 60,
                        textStyle: Theme.of(context).textTheme.bodyText1?.apply(
                              fontFamily: 'Outfit',
                              color: const Color(0xFF14181B),
                            ),
                        hintText: 'Select Team',
                        icon: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Color(0xFF57636C),
                          size: 15,
                        ),
                        fillColor: Colors.white,
                        elevation: 2,
                        borderColor: const Color(0xFFF1F4F8),
                        borderWidth: 2,
                        borderRadius: 8,
                        margin:
                            const EdgeInsetsDirectional.fromSTEB(24, 4, 12, 4),
                        hidesUnderline: true,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                      child: GrowthronDropdown(
                        options: [],
                        width: double.infinity,
                        height: 60,
                        textStyle: Theme.of(context).textTheme.bodyText1?.apply(
                              fontFamily: 'Outfit',
                              color: const Color(0xFF14181B),
                            ),
                        hintText: 'Select User',
                        icon: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Color(0xFF57636C),
                          size: 15,
                        ),
                        fillColor: Colors.white,
                        elevation: 2,
                        borderColor: const Color(0xFFF1F4F8),
                        borderWidth: 2,
                        borderRadius: 8,
                        margin:
                            const EdgeInsetsDirectional.fromSTEB(24, 4, 12, 4),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                      child: GrowthronDropdown(
                        options: ['Not Started', 'In Progress', 'Complete'],
                        onChanged: (val) =>
                            setState(() => userSelectValue2 = val),
                        width: double.infinity,
                        height: 60,
                        textStyle: Theme.of(context).textTheme.bodyText1?.apply(
                              fontFamily: 'Outfit',
                              color: const Color(0xFF14181B),
                            ),
                        hintText: 'Select Status',
                        icon: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Color(0xFF57636C),
                          size: 15,
                        ),
                        fillColor: Colors.white,
                        elevation: 2,
                        borderColor: const Color(0xFFF1F4F8),
                        borderWidth: 2,
                        borderRadius: 8,
                        margin:
                            const EdgeInsetsDirectional.fromSTEB(24, 4, 12, 4),
                        hidesUnderline: true,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 8, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.44,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: const Color(0xFFF1F4F8),
                                  width: 2,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12, 5, 12, 5),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Start Date',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          ?.apply(
                                            fontFamily: 'Outfit',
                                            color: const Color(0xFF57636C),
                                          ),
                                    ),
                                    const Icon(
                                      Icons.date_range_outlined,
                                      color: Color(0xFF57636C),
                                      size: 24,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.44,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: const Color(0xFFF1F4F8),
                                width: 2,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12, 5, 12, 5),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Due Date',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        ?.apply(
                                          fontFamily: 'Outfit',
                                          color: const Color(0xFF57636C),
                                        ),
                                  ),
                                  const Icon(
                                    Icons.date_range_outlined,
                                    color: Color(0xFF57636C),
                                    size: 24,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 16),
                  child: GrowthronButton(
                    onPressed: () async {
                      if (formKey.currentState == null ||
                          !formKey.currentState!.validate()) {
                        return;
                      }

                      Navigator.pop(context);
                    },
                    text: 'Create Task',
                    options: GrowthronButtonOptions(
                      width: 270,
                      height: 50,
                      color: const Color(0xFF4B39EF),
                      textStyle: Theme.of(context).textTheme.subtitle1?.apply(
                            fontFamily: 'Outfit',
                            color: Colors.white,
                          ),
                      elevation: 3,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
