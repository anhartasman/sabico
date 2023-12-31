import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:sabico/architectures/domain/entities/UserReport.dart';
import 'package:sabico/bloc/save_report/bloc.dart';
import 'package:sabico/theme/colors/Warna.dart';
import 'package:sabico/theme/decorations/box_decoration.dart';
import 'package:sabico/theme/decorations/input_decoration.dart';
import 'package:sabico/widgets/TampilanDialog.dart';

class form_laporan extends StatefulWidget {
  const form_laporan();
  @override
  State<form_laporan> createState() => _form_laporanState();
}

class _form_laporanState extends State<form_laporan> {
  final formKey = GlobalKey<FormBuilderState>();
  TextEditingController _etName = new TextEditingController();
  TextEditingController _etEmail = new TextEditingController();
  TextEditingController _etPhone = new TextEditingController();
  TextEditingController _etClassName = new TextEditingController();
  TextEditingController _etReport = new TextEditingController();

  void saveForm() async {
    if (!formKey.currentState!.saveAndValidate()) {
      TampilanDialog.showDialogAlert("Lengkapi form terlebih dahulu");
      return;
    }
    TampilanDialog.showDialogKonfirm("Kirim Laporan?").then((value) {
      if (value) {
        final theReport = UserReport(
          id: "",
          dateTime: DateTime.now(),
          userId: "",
          doneNote: "",
          status: "waiting",
          name: _etName.text,
          email: _etEmail.text,
          phone: _etPhone.text,
          className: _etClassName.text,
          report: _etReport.text,
        );
        BlocProvider.of<SaveReportBloc>(context)
            .add(SaveReportBlocStart(theReport));
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var downwardIcon = Icon(
      Icons.keyboard_arrow_down,
      color: Colors.black54,
    );
    return Scaffold(
      backgroundColor: Warna.unguMuda,
      appBar: AppBar(
        title: const Text("Form Laporan"),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        elevation: 0.00,
        backgroundColor: Colors.purple,
      ), //
      body: SafeArea(
        child: FormBuilder(
          key: formKey,
          child: BlocConsumer<SaveReportBloc, SaveReportBlocState>(
              listener: (context, state) {
            if (state is SaveReportBlocStateOnError) {
              TampilanDialog.showDialogAlert(state.errorMessage);
            }
            if (state is SaveReportBlocStateOnSuccess) {
              TampilanDialog.showDialogSuccess("Data tersimpan")
                  .then((value) => Get.back(result: true));
            }
          }, builder: (context, state) {
            if (state is SaveReportBlocStateOnStarted) {
              return Center(
                child: SpinKitWave(
                  color: Warna.warnaUtama,
                  size: 50.0,
                ),
              );
            }
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 25.0,
                            left: 16,
                          ),
                          child: Text("Nama Siswa",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            decoration: box_field_abu,
                            child: new FormBuilderTextField(
                              name: "Nama",
                              controller: _etName,
                              decoration: text_field_abu,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ]),
                              keyboardType: TextInputType.text,
                              style: new TextStyle(
                                fontFamily: "Poppins",
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 25.0,
                            left: 16,
                          ),
                          child: Text("No. Telepon Siswa",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            decoration: box_field_abu,
                            child: new FormBuilderTextField(
                              name: "phone",
                              controller: _etPhone,
                              decoration: text_field_abu,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ]),
                              keyboardType: TextInputType.phone,
                              style: new TextStyle(
                                fontFamily: "Poppins",
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 25.0,
                            left: 16,
                          ),
                          child: Text("Kelas",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            decoration: box_field_abu,
                            child: new FormBuilderTextField(
                              name: "className",
                              controller: _etClassName,
                              decoration: text_field_abu,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ]),
                              keyboardType: TextInputType.text,
                              style: new TextStyle(
                                fontFamily: "Poppins",
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 25.0,
                            left: 16,
                          ),
                          child: Text("Laporan",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            decoration: box_field_abu,
                            child: new FormBuilderTextField(
                              name: "report",
                              controller: _etReport,
                              decoration: text_field_abu.copyWith(),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ]),
                              keyboardType: TextInputType.multiline,
                              style: new TextStyle(
                                fontFamily: "Poppins",
                              ),
                              maxLines: 4,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 80,
                    width: width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        InkWell(
                          onTap: saveForm,
                          child: Container(
                            child: Text(
                              'Simpan',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18),
                            ),
                            alignment: Alignment.center,
                            margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
                            width: width - 40,
                            decoration: BoxDecoration(
                              color: Warna.unguTua,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
