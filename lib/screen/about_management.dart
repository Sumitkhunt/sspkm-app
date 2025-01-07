import 'package:flutter/material.dart';

class about_managements extends StatefulWidget {
  const about_managements({Key? key}) : super(key: key);

  @override
  State<about_managements> createState() => _about_managementState();
}

class _about_managementState extends State<about_managements> {

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title:Center(child: Text(
          "Management Desk",style: TextStyle(fontSize: 25)
        ),
        ),
        actions: [
          Image.asset("assets/images/aboutus/managbanner.png")
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
              child: Image.asset('assets/images/aboutus/devji.png',
              height: height*0.25,
                width: width*0.4,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Center(
              child: Text(
                " Devjibhai M. Sojitra",
                 textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                " President",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                " President's Message",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              " પ્રમુખશ્રીની કલમેથી",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: width*0.98,
              child: Text(
                "     ૧૯ મી સદીમાં પ્રારંભ કરેલ યાત્રાનુ એકવીસમી સદીના ડીઝીટલ યુગમા પ્રયાણ.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: width * 0.98,
              child: Text(
                "     આપણી સંસ્થા શ્રી સૌરાષ્ટ્ર પટેલ કેળવણી મંડળ અમદાવાદની સ્થાપના ૧૯૫૩ માં આપણા વડીલો અને સખાવતી દીર્ધદ્રષ્ટા, ઉદાર અને સમાજની ચિંતા કરનારા લોકોએ કરેલ. અમદાવાદ એજ્યુકેશનનુ હબ છે અને એજ્યુકેશનના હાર્દ સમાન વિસ્તારમાં જ બહારગામથી આવતા વિદ્યાર્થીભાઈઓ માટે છાત્રાલયની સ્થાપના કરેલ,",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: width * 0.98,
              child: Text(
                "     જે તે સમયે નાનકડી શરૂઆતને ભૂતપૂર્વ વિદ્યાર્થીઓ તેમજ સમાજ શ્રેષ્ઠીઓએ આગળ વધારીને આજે વટવૃક્ષની જેમ ૧૩૦૦ વિદ્યાર્થીઓ અને ૧૦૦૦ વિદ્યાર્થીનીઓ રહી શકે તે કક્ષાએ લઈ ગયા.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: width * 0.98,
              child: Text(
                "     આ વાતને અહી ન અટકાવતા નવા જુસ્સા અને ઉત્સાહ સાથે વર્તમાન સમાજ શ્રેષ્ઠીઓએ તેને પણ વધારવા અને વિસ્તારવા આયોજન કર્યું છે.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: width * 0.98,
              child: Text(
                "     સમય પરિવર્તનશીલ છે. અને સમય સાથે કદમ મિલાવવા આજના ડીઝીટલ યુગમા આપણી સંસ્થા પ્રયાણ કરી રહી છે અને વહીવટી તંત્ર અને એડમીશન ઓનલાઈન કરવામાં આવશે તો આ પ્રક્રિયાને સૌ સાથ સહકાર આપશો તેવી અપેક્ષા.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: width * 0.98,
              child: Text(
                " પ્રમુખશ્રી\n  દેવજીભાઈ એમ. સોજીત્રા",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Image.asset('assets/images/aboutus/bhavesh.png',
                height: height*0.25,
                width: width*0.4,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Center(
              child: Text(
                " Bhaveshbhai C. Vaghasiya",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                " Secretary",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                " Secretary's Message",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: width * 0.98,
              child: Text(
                " મંત્રીશ્રીની કલમે\n\n     ટ્રેડિશનના સંકલ્પ સાથે ટેકનોલોજીને આવકારતી આપણી સંસ્થા"
                "વિશ્વભરમાં વસતા પટેલોનું ગૌરવ બનેલી આપણી શ્રી સૌરાષ્ટ્ર પટેલ કેળવણી મંડળ સંસ્થા નવા સમય સાથે પરંપરાને જાળવીને કદમ મિલાવી રહી છે. પરંપરા, સંસ્કાર અને સંસ્કૃતિના પાયા પર નિર્માણ પામેલી આપણી વ્યવસ્થા સાંપ્રત સમયના નાવિન્યને આવકારીને ટેકનોલોજી સાથે આગળ વધી રહી છે."
                "\n\n     વરસો પહેલા આપણા વડવાઓએ આપણા સમાજના બાળકો આર્થિક અછતના લીધે અભ્યાસથી વંચીત ન રહી જાય અને અમદાવાદ જેવા શહેરમાં તેમને આસરો મળી રહે તેવા શુભ ઉદેશ્ય સાથે સંસ્થાની શરૂઆત કરી હતી. કુમાર અને કન્યા એમ બંને છાત્રાલયોમાં વર્ષે અનેક વિદ્યાર્થીઓ અભ્યાસ કરીને પ્રગતિનો માર્ગ કંડારે છે."
                "\n\n     સાંપ્રત સમયમાં આખી દુનિયા કોરોના મહામારી સામે લડી રહી છે. શિક્ષણ વ્યવસ્થા પર હાલ પુરતો અલ્પવિરામ લગાવી દેવામાં આવ્યો છે. પરંતુ ફરીથી એ વ્યવસ્થાનો ઝડપથી પુનઃ શુભારંભ થશે અને એ સાવચેતીને ધ્યાનમાં રાખી અને અત્યાધુનિકતાને અપનાવીને આ વરસથી એડમિશન પ્રોસેસ એટલે પ્રવેશ પ્રક્રિયા ઓનલાઈન કરવાનો નિર્ધાર કર્યો છે. આપણી સંસ્થાની વેબસાઈટ પર વિદ્યાર્થી ઘરે બેઠા હોસ્ટેલ એડમિશન માટે અરજી કરી શકશે. પહેલાં વિદ્યાર્થીએ રૂબરૂ આવીને ફોર્મ ભરવું પડતું હતું. હવે ઓનલાઈન પ્રક્રિયા દ્વારા પ્રવેશ આપવામાં આવશે. જેના લીધે સમય અને ખર્ચની મોટી બચત થશે અને દરેક માટે સરળ બનશે."
                "\n\n ભાવેશભાઈ વઘાસીયા"
                "\n મંત્રીશ્રી"
                "\n શ્રી સૌરાષ્ટ્ર પટેલ કેળવણી મંડળ",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Image.asset('assets/images/aboutus/ramesh.png',
                height: height*0.25,
                width: width*0.4,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                " Shree Rameshbhai Babubhai Mesiya",
                 textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Center(
              child: Text(
                "Vice President",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Image.asset('assets/images/aboutus/nagji.png',
                height: height*0.25,
                width: width*0.4,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                " Shree Nagjibhai Nanjibhai Singala",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Center(
              child: Text(
                "Vice President",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Image.asset('assets/images/aboutus/bhikhubhai.png',
                height: height*0.23,
                width: width*0.4,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                " Shree Bhikhubhai Popatbhai Gajera",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Center(
              child: Text(
                "Vice President",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
