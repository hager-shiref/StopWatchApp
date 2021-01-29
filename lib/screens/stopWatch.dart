import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stop_watch/model/model.dart';
import 'package:provider/provider.dart';
import 'package:stop_watch/widgets/waves.dart';
class StopWatch extends StatefulWidget {
  @override
  _StopWatchState createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  Widget _buildContainer({String state,Function ontap}){
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 50,vertical: 20),
        height: 50,
        width: 80,
        decoration: BoxDecoration(
          color: Color(0xfff48fb1),
          borderRadius: BorderRadius.circular(30)
        ),
        child: Center(
          child: Text(state,style: TextStyle(
              color: Colors.white
          )),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context){
      return StopwatchProvider();
    },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Stop Watch'),
          centerTitle: true,
          backgroundColor: Color(0xfff48fb1),
        ),
        body: Stack(
          children: [
            Waves(),
            ListView(
              children: [
                Consumer<StopwatchProvider>(builder: (context, stopWatch,child) {
                  return Padding(
                    padding: EdgeInsets.only(top: 250,bottom: 150),
                    child: Center(
                      child: Text(stopWatch.stopTimeToDisplay,style: TextStyle(
                          fontWeight: FontWeight.bold,fontSize: 50,color: Colors.white
                      ),),
                    ),
                  );
                } ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Consumer<StopwatchProvider>(builder: (context,stopWatch,child){
                      return _buildContainer(state: 'Start',ontap: (){
                        stopWatch.start();
                      });
                    }),
                    Consumer<StopwatchProvider>(builder: (context,stopWatch,child){
                      return _buildContainer(state: 'Stop',ontap: (){
                        stopWatch.stop();
                      });
                    }),
                  ],
                ),
                Consumer<StopwatchProvider>(builder: (context,stopWatch,child){
                  return Center(
                    child: _buildContainer(state: 'Reset',ontap: (){
                      stopWatch.reset();
                    }),
                  );
                }),
              ],
            )
          ],
        ),
      ),
    );
  }
}