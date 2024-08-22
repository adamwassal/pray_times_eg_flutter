import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pray_timesz/network/dio_helper.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:pray_timesz/network/dio_qibla.dart';

class Times extends StatefulWidget {
  const Times({super.key});

  @override
  State<Times> createState() => _TimesState();
}

class _TimesState extends State<Times> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFajrTime();
    getDuhurTime();
    getAsrTime();
    getMaghrebTime();
    getIshaTime();
    getDate();
    getQibla();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'مواقيت الصلاة',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text('التاريخ الهجري'),
                  Text(
                    date != null ? '$date' : 'Loading',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Column(
                children: [
                  Text('التاريخ الميلادي'),
                  Text(
                    dateMilady != null ? '$dateMilady' : 'Loading',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ],
          ),
          Card(
            margin: EdgeInsets.all(10),
            color: Colors.pink[100],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  fajr != null ? '$fajr' : 'Loading',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'الفجر',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          Card(
            margin: EdgeInsets.all(10),
            color: Colors.pink[100],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  duhur != null ? '$duhur' : 'Loading',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'الظهر',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          Card(
            margin: EdgeInsets.all(10),
            color: Colors.pink[100],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  asr != null ? '$asr' : 'Loading',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'العصر',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          Card(
            margin: EdgeInsets.all(10),
            color: Colors.pink[100],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  maghreb != null ? '$maghreb' : 'Loading',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'المغرب',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          Card(
            margin: EdgeInsets.all(10),
            color: Colors.pink[100],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  isha != null ? '$isha' : 'Loading',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'العشاء',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 50),
            child: new RotationTransition(
              turns: new AlwaysStoppedAnimation(qiblaDirection / 360),
              child: new Text("القبلة"),
            ),
          )
        ],
      ),
    );
  }

  String? fajr;
  String? duhur;
  String? asr;
  String? maghreb;
  String? isha;

  String? date;
  String? dateMilady;
  String? mounthHijri;

  double qiblaDirection = 360.0;

  getFajrTime() {
    fajr = null;
    DioHelper.getData('/2024/8').then((value) {
      setState(() {
        // Fetch the Asr time from the response
        fajr = value.data['data'][0]['timings']['Fajr'];
        // Remove the (EEST) part
        fajr = fajr!.replaceAll(' (EEST)', '');

        // Parse the time and format it to hh:mm
        DateTime parsedFajrTime = DateFormat("HH:mm").parse(fajr!);
        fajr = DateFormat('hh:mm a').format(parsedFajrTime);
      });
    }).catchError((error) {
      print(error.toString());
    });
  }

  getDuhurTime() {
    duhur = null;
    DioHelper.getData('/2024/8').then((value) {
      setState(() {
        // Fetch the Asr time from the response
        duhur = value.data['data'][0]['timings']['Dhuhr'];
        // Remove the (EEST) part
        duhur = duhur!.replaceAll(' (EEST)', '');

        // Parse the time and format it to hh:mm
        DateTime parsedDuhurTime = DateFormat("HH:mm").parse(duhur!);
        duhur = DateFormat('hh:mm a').format(parsedDuhurTime);
      });
    }).catchError((error) {
      print(error.toString());
    });
  }

  getAsrTime() {
    asr = null;
    DioHelper.getData('/2024/8').then((value) {
      setState(() {
        // Fetch the Asr time from the response
        asr = value.data['data'][0]['timings']['Asr'];
        // Remove the (EEST) part
        asr = asr!.replaceAll(' (EEST)', '');

        // Parse the time and format it to hh:mm
        DateTime parsedAsrTime = DateFormat("HH:mm").parse(asr!);
        asr = DateFormat('hh:mm a').format(parsedAsrTime);
      });
    }).catchError((error) {
      print(error.toString());
    });
  }

  getMaghrebTime() {
    maghreb = null;
    DioHelper.getData('/2024/8').then((value) {
      setState(() {
        // Fetch the Asr time from the response
        maghreb = value.data['data'][0]['timings']['Maghrib'];
        // Remove the (EEST) part
        maghreb = maghreb!.replaceAll(' (EEST)', '');

        // Parse the time and format it to hh:mm
        DateTime parsedMaghrebTime = DateFormat("HH:mm").parse(maghreb!);
        maghreb = DateFormat('hh:mm a').format(parsedMaghrebTime);
      });
    }).catchError((error) {
      print(error.toString());
    });
  }

  getIshaTime() {
    isha = null;
    DioHelper.getData('/2024/8').then((value) {
      setState(() {
        // Fetch the Asr time from the response
        isha = value.data['data'][0]['timings']['Isha'];
        // Remove the (EEST) part
        isha = isha!.replaceAll(' (EEST)', '');

        // Parse the time and format it to hh:mm
        DateTime parsedIshaTime = DateFormat("HH:mm").parse(isha!);
        isha = DateFormat('hh:mm a').format(parsedIshaTime);
      });
    }).catchError((error) {
      print(error.toString());
    });
  }

  getDate() {
    date = null;
    DioHelper.getData('/2024/8').then((value) {
      setState(() {
        // Fetch the Asr time from the response
        date = value.data['data'][0]['date']['hijri']['date'];
        dateMilady = value.data['data'][0]['date']['readable'];
        mounthHijri = value.data['data'][0]['date']['hijri']['month']['ar'];
      });
    }).catchError((error) {
      print(error.toString());
    });
  }

  getQibla() {
    DioQibla.getData('/26.820553/30.802498').then((value) {
      setState(() {
        qiblaDirection = value?.data['data']['direction'];
      });
    }).catchError((error) {
      print(error.toString());
    });
  }
}
