import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FoodDetailWidget extends StatefulWidget {
  FoodDetailWidget({Key  key}) : super(key: key);

  @override
  _FoodDetailWidgetState createState() => _FoodDetailWidgetState();
}

class _FoodDetailWidgetState extends State<FoodDetailWidget> {
  dynamic pageViewController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF1E5128),
        automaticallyImplyLeading: true,
        title: Text(
          'สูตรอาหาร',
          style: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Poppins',
            color: Color(0xFFFFEAAF),
            fontSize: 20,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFF1E5128),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 400),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.25,
                          decoration: BoxDecoration(
                            color: Color(0xFFEEEEEE),
                          ),
                          child: Container(
                            width: double.infinity,
                            height: 500,
                            child: Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 50),
                                  child: PageView(
                                    controller: pageViewController ??=
                                        PageController(initialPage: 0),
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      Image.asset(
                                        'assets/images/a9b86b24-fd18-4e76-9b01-cd4a273d312c.jpg',
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                      Image.network(
                                        'https://picsum.photos/seed/964/600',
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                      Image.network(
                                        'https://picsum.photos/seed/149/600',
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      )
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, 1),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 10),
                                    child: SmoothPageIndicator(
                                      controller: pageViewController ??=
                                          PageController(initialPage: 0),
                                      count: 3,
                                      axisDirection: Axis.horizontal,
                                      onDotClicked: (i) {
                                        pageViewController.animateToPage(
                                          i,
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.ease,
                                        );
                                      },
                                      effect: ExpandingDotsEffect(
                                        expansionFactor: 2,
                                        spacing: 8,
                                        radius: 16,
                                        dotWidth: 16,
                                        dotHeight: 16,
                                        dotColor: Color(0xFF9E9E9E),
                                        activeDotColor: Color(0xFF3F51B5),
                                        paintStyle: PaintingStyle.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 120, 0, 150),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 120, 0, 0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.3,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                            ),
                            child: ListView(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 10, 0, 0),
                                  child: Text(
                                    'วัตถุดิบ\n1. เส้นมะละกอสับ\n2. ถั่วฝักยาว\n3. มะเขือเทศ\n4. พริกสด\n5. มะนาว\n6. กระเทียม\n7. น้ำปลา\n8. น้ำตาลปี๊บ\n9. กุ้งแห้ง\nวิธีทำ\n   - ใส่พริกกับกระเทียมลงในครกตำพอหยาบ จากนั้นฝานมะเขือเทศ ถั่วผักยาวตามลงตำให้พอเข้ากัน ปรุงรสด้วยน้ำปลา น้ำตาลปี๊บ และมะนาว\n   - ใส่เส้นมะละกอสับ ตำเคล้าให้เครื่องปรุงทั้งหมดเข้ากันดี ชิมรสชาติและปรุงเพิ่มได้ตามใจชอบ ตักใส่จานโรยด้วยกุ้งแห้งและถั่วลิสง',
                                    style: FlutterFlowTheme.bodyText1,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 530, 0, 0),
                    child: Text(
                      'ความคิดเห็นจากชุมชน',
                      style: FlutterFlowTheme.title3.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 570, 0, 0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.25,
                            height: MediaQuery.of(context).size.height * 0.1,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                            ),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 4, 0, 0),
                                  child: Container(
                                    width: 60,
                                    height: 60,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      'https://picsum.photos/seed/148/600',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15, 65, 0, 0),
                                  child: Text(
                                    'นายชื่อ สกุล',
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 10,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(80, 0, 0, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.75,
                              height: MediaQuery.of(context).size.height * 0.1,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 0, 0),
                                child: AutoSizeText(
                                  'อาหารใช้ได้เลยค่ะ',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.bodyText1,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
