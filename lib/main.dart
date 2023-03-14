import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Data {
  String nama = "";

  String skor = "";

  String jenis = "";

  String imbalHasil = "";

  String hargaUnit = "";

  String danaKelolaan = "";
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final textEditController = TextEditingController();
  String pilihanWaktu = "6 bulan";
  String pilihanWaktuOut = "";

  List<Data> dataList = [
    Data()
      ..nama = 'Securinvest Sharia Sukuk Fund'
      ..skor = '4.1'
      ..jenis = 'Pendapatan Tetap'
      ..imbalHasil = '6.2%'
      ..hargaUnit = 'Rp.1.080'
      ..danaKelolaan = 'Rp.3.3T',
    Data()
      ..nama = 'Start Stable Income Fund'
      ..skor = '3.2'
      ..jenis = 'Pendapatan Tetap'
      ..imbalHasil = '12%'
      ..hargaUnit = 'Rp.1.070'
      ..danaKelolaan = 'Rp.256M',
  ];

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> waktu = [];
    var item1 = const DropdownMenuItem<String>(
      value: "6 bulan",
      child: Text("6 bulan"),
    );
    var item2 = const DropdownMenuItem<String>(
      value: "1 tahun",
      child: Text("1 tahun"),
    );
    waktu.add(item1);
    waktu.add(item2);
    return MaterialApp(
      title: 'Quiz 2 Flutter',
      home: Scaffold(
        appBar: AppBar(
            leading: FlutterLogo(),
            backgroundColor: Colors.blueGrey,
            title: Text('Quiz Flutter'),
            actions: <Widget>[ButtonNamaKelompok(), ButtonPerjanjian()]),
        body: Column(
          children: [
            DropdownButton(
              value: pilihanWaktu,
              items: waktu,
              onChanged: (String? newValue) {
                setState(
                  () {
                    if (newValue != null) {
                      pilihanWaktu = newValue;
                    }
                  },
                );
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount: dataList.length,
                itemBuilder: (BuildContext context, int index) {
                  Data data = dataList[index];
                  return Container(
                    decoration: BoxDecoration(border: Border.all()),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image.network(
                          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                          height: 50,
                          width: 50,
                          fit: BoxFit.fitHeight,
                        ),
                        Text(
                          data.nama,
                          textAlign: TextAlign.center,
                        ),
                        Image.network(
                          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                          height: 25,
                          width: 25,
                          fit: BoxFit.fitHeight,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.star),
                            SizedBox(
                              width: 5,
                              height: 5,
                            ),
                            Text('${data.skor} - ${data.jenis}'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '\nImbal Hasil\n${data.imbalHasil}',
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              width: 50,
                              height: 5,
                            ),
                            Text(
                              '\nHarga Unit\n${data.hargaUnit}',
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              width: 50,
                              height: 5,
                            ),
                            Text(
                              '\nDana Kelolaan\n${data.danaKelolaan}',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ButtonNamaKelompok extends StatelessWidget {
  const ButtonNamaKelompok({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.account_circle_rounded),
      onPressed: () {
        // icon account di tap
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Kelompok 18'),
            content: const Text(
                'Fauziyyah Zayyan Nur (zayyanfau@upi.edu) ; Muhammad Fakhri Fadhlurrahman (mfakhrif@upi.edu)'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ButtonPerjanjian extends StatelessWidget {
  const ButtonPerjanjian({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.access_alarm_rounded),
      onPressed: () {
        // icon setting ditap
        const snackBar = SnackBar(
          duration: Duration(seconds: 20),
          content: Text(
              'Kami berjanji  tidak akan berbuat curang dan atau membantu kelompok lain berbuat curang'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
  }
}
