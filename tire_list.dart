import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/tire_repair/tire_form.dart';
import 'package:flutter_application_1/pages/tire_repair/tirereprtdetail.dart';

class TireInspectionReport extends StatefulWidget {
  const TireInspectionReport({super.key});

  @override
  State<TireInspectionReport> createState() => _TireInspectionReportState();
}

class _TireInspectionReportState extends State<TireInspectionReport>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  final double containerWidthFactor = 0.8;
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tween =
        Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero);
    final animation = tween.animate(_controller);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF1F1F1),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120.0),
        child: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {},
          ),
          title: const Text('Tire Inspection Report'),
          centerTitle: true,
          backgroundColor: const Color(0xFFF1F1F1),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search tire',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GradientBackground(),
                    ),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 107,
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFF67ADFF),
                        const Color(0xFF4778B2),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/ban.png',
                            width: 100.0,
                            height: 120.0,
                          ),
                          const SizedBox(width: 10.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'S9S00394',
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black,
                                  fontSize: 25.0,
                                ),
                              ),
                              const SizedBox(height: 4.0),
                              Container(
                                width: 120.0,
                                height: 2.0,
                                color: Colors.black,
                              ),
                              const SizedBox(height: 4.0),
                              Text(
                                'BRIDGESTNE',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                  fontSize: 12.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '37.888R57\n27 Mei 2024',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color(0xFFA3FF94), const Color(0xFF5A6AFB)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
          shape: BoxShape.circle,
        ),
        child: FloatingActionButton(
          onPressed: () {
            _controller.forward();
            Navigator.push(
              context,
              PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 500),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const Offset begin = Offset(1.0, 0.0);
                    const Offset end = Offset.zero;
                    const Curve curve = Curves.easeInOut;

                    var tween = Tween<Offset>(begin: begin, end: end);
                    var offsetAnimation =
                        animation.drive(tween.chain(CurveTween(curve: curve)));

                    return SlideTransition(
                        position: offsetAnimation, child: child);
                  },
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      NewInspectionPage()),
            );
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 36.0,
          ),
          backgroundColor: Colors.transparent,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
