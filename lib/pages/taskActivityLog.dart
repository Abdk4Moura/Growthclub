import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TrackMyProgressStoryWidget extends StatefulWidget {
  const TrackMyProgressStoryWidget({Key? key}) : super(key: key);

  @override
  _TrackMyProgressStoryWidgetState createState() =>
      _TrackMyProgressStoryWidgetState();
}

class _TrackMyProgressStoryWidgetState
    extends State<TrackMyProgressStoryWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).canvasColor,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 16, 24, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Activity',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 4, 24, 24),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'All Activity from this past month.',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            color: Theme.of(context).hintColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Container(
                          width: 2,
                          height: 110,
                          decoration: BoxDecoration(
                            color: Theme.of(context).hintColor, // hintColor
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '14, Sept. 2021',
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                              Icon(
                                Icons.chevron_right_rounded,
                                color: Color(0xFF95A1AC),
                                size: 24,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Created New User',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                child: Text(
                                  'Andrew Daniels',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      ?.apply(
                                        fontFamily: 'Lexend Deca',
                                        color: Theme.of(context).primaryColor,
                                        // fontSize: 18,
                                        // fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  clipBehavior:
                                      Clip.antiAlias, // research about this
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    'https://picsum.photos/seed/252/600',
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 0, 0),
                                  child: Text(
                                    'Andrew F.',
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            color: Theme.of(context).hintColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Container(
                          width: 2,
                          height: 110,
                          decoration: BoxDecoration(
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '14, Sept. 2021',
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                              Icon(
                                Icons.chevron_right_rounded,
                                color: Color(0xFF95A1AC),
                                size: 24,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Creted a Group',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                child: Text(
                                  'Design Team',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.apply(
                                          fontFamily: 'Lexend Deca',
                                          color: Theme.of(context)
                                              .secondaryHeaderColor
                                          // color: Theme.of(context).alternate,
                                          // fontSize: 18,
                                          // fontWeight: FontWeight.w500,
                                          ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    'https://picsum.photos/seed/252/600',
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 0, 0),
                                  child: Text(
                                    'Andrew F.',
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            color: Theme.of(context).hintColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Container(
                          width: 2,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '14, Sept. 2021',
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                              Icon(
                                Icons.chevron_right_rounded,
                                color: Color(0xFF95A1AC),
                                size: 24,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Created Invoice',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                child: Text(
                                  '#402 - Contractor',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.apply(
                                        fontFamily: 'Lexend Deca',
                                        color: Theme.of(context).primaryColor,
                                        // fontSize: 18,
                                        // fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    'https://picsum.photos/seed/252/600',
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 0, 0),
                                  child: Text(
                                    'Andrew F.',
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(23, 0, 0, 0),
                      child: Container(
                        width: 2,
                        height: 152,
                        decoration: BoxDecoration(
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 26, 0, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      color:
                          Theme.of(context).canvasColor, // secondaryBackground
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 0,
                          color: Theme.of(context).hintColor,
                          offset: Offset(0, 1),
                        )
                      ],
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/allTasksComplete@2x.png',
                            width: 300,
                            height: 100,
                            fit: BoxFit.fitHeight,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
              child: Text(
                'Beginning of Activity',
                style:
                    Theme.of(context).textTheme.titleLarge, // subtextTheme.ti..
              ),
            ),
          ],
        ),
      ),
    );
  }
}
