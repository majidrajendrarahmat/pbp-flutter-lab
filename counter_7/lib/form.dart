import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/drawer.dart';

class Data {
  static List<String> _listJudul = [];
  static String judul = '';

  static List<String> _listJumlah = [];
  static String jumlah = '';

  static List<String> _listBudgeting = [];
  static String budgeting = 'Pilih Jenis';
  static List<String> jenisBudgeting = ['Pilih Jenis','Pemasukan', 'Pengeluaran'];

  static void addJudul(String t) {
    _listJudul.add(t);
  }

  static void addJumlah(String a) {
    _listJumlah.add(a);
  }

  static void addBudgeting(String b) {
    _listBudgeting.add(b);
  }

  static List<String> getJudul() {
    return _listJudul;
  }

  static List<String> getJumlah() {
    return _listJumlah;
  }

  static List<String> getBudgeting() {
    return _listBudgeting;
  }

  static int getLength() {
    return _listJudul.length;
  }
}

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController tanggal = TextEditingController();

  Data data = Data();

  @override
  void initState() {
    tanggal.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Budget'),
      ),
      // Menambahkan drawer menu
      drawer: DrawerClass(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh: Beli Sate Pacil",
                      labelText: "Judul",
                      // Menambahkan icon agar lebih intuitif
                      icon: const Icon(Icons.people),
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        Data.judul = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Judul tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),

                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh: Rp15.000",
                      labelText: "Nominal",
                      // Menambahkan icon agar lebih intuitif
                      icon: const Icon(Icons.people),
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        Data.jumlah = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nominal tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),

                ListTile(
                  leading: const Icon(Icons.class_),
                  title: const Text(
                    'Pilih Jenis',
                  ),
                  trailing: DropdownButton(
                    value: Data.budgeting,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: Data.budgeting.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        Data.budgeting = newValue!;
                      });
                    },
                  ),
                ),

                TextButton(
                    child: const Text(
                      "Simpan",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Data.addJudul(currentData.placeholderJudul);
                        Data.addJumlah(currentData.placeholderNominal);
                        Data.addBudgeting(currentData.placeholderBudgeting);
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 15,
                              child: Container(
                                child: ListView(
                                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                                  shrinkWrap: true,
                                  children: <Widget>[
                                    Center(child: const Text('Informasi Data')),
                                    SizedBox(height: 20),
                                    Text(
                                      'Data Sudah Ditambahkan',
                                      textAlign: TextAlign.center,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Kembali'),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                    }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}