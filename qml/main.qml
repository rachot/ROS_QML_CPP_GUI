import QtQuick 2.2
import QtQuick.Window 2.1
import QtGraphicalEffects 1.0
import QtQml 2.2
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1
import QtQuick.Layouts 1.0

Window{

    signal qmlSignal()

         visible: true
         id: window1
         width: 1366
         height: 768


         property real time_hour : 0
         property real time_min : 13
         property real time_sec : 0
         property real time_status : 0


         property alias mlspeed: txtMlSpdSetL.ml_spdSet
         property alias mrspeed: txtMlSpdSetR.mr_spdSet


         function getStartStatus()
         {
             var mode_color
              if(time_status == 1)
              {
                   mode_color = "grey"

              }
              else if(time_status == 0)
              {
                  mode_color = "green"
              }

              return mode_color
         }
         function getStartGlow()
         {
             var Glow_mode
              if(time_status == 1)
              {
                   Glow_mode = 20
              }
              else if(time_status == 0)
              {
                   Glow_mode = 0
              }

              return Glow_mode
         }

         function getPauseStatus()
         {
             var mode_color
              if(time_status == 0)
              {
                   mode_color = "grey"
              }
              else if(time_status == 1)
              {
                  mode_color = "orange"
              }

              return mode_color
         }
         function getPauseGlow()
         {
             var Glow_mode
              if(time_status == 0)
              {
                   Glow_mode = 20
              }
              else if(time_status == 1)
              {
                   Glow_mode = 0
              }

              return Glow_mode
         }

        Image{
         opacity: 1.0
         sourceSize.width: 2000
         fillMode: Image.Stretch

         z: -1
         source: "/home/chot/catkin_ws/src/testqt5_create/qml/background02.png"
         smooth: true


         FontLoader { id: textFont; source: "/home/chot/catkin_ws/src/testqt5_create/qml/ReFormation Sans Regular.ttf" }
         FontLoader { id: numericFont; source: "/home/chot/catkin_ws/src/testqt5_create/qml/ReFormation Sans Regular.ttf" }
         FontLoader { id: fontSystem; source: "/home/chot/catkin_ws/src/testqt5_create/qml/ReFormation Sans Regular.ttf" }
         FontLoader { id: localFont; source: "/home/chot/catkin_ws/src/testqt5_create/qml/ReFormation Sans Regular.ttf" }





         function degToRad(degrees) {
             return degrees * (Math.PI / 180);
         }

         function getHeadStatus()
         {
             var head_color
            /* if(valueSource.light_status > 1)
                 valueSource.light_status = 0

             if(valueSource.light_status == 1)
             {
                 head_color = "#2dc2f0"
             }
             else if(valueSource.light_status == 0)
             {
                 head_color = "#828282"
             }
*/
             return head_color
         }
         function getGlowSample()
         {
             var Glow_sample
            /* if(valueSource.light_status == 0)
             {
                 Glow_sample = 0
                 btnLightHead.layer.enabled = false
             }
             else if(valueSource.light_status == 1)
             {
                 Glow_sample = 20
                 btnLightHead.layer = true
             }*/

             return Glow_sample
         }



         function getManGlowMode()
         {
             var Glow_mode
           /*  if(valueSource.man_status == 1)
             {
                 Glow_mode = 20
             }
             else if(valueSource.man_status == 0)
             {
                 Glow_mode = 0
             }*/

             return Glow_mode
         }


         function getAutGlowMode()
         {
             var Glow_mode
           /*  if(valueSource.aut_status == 1)
             {
                 Glow_mode = 20
             }
             else if(valueSource.aut_status == 0)
             {
                 Glow_mode = 0
             }*/

             return Glow_mode
         }


         function getBtnManStatus()
         {
             var mode_color

            /* if(valueSource.man_status == 1)
             {
                  mode_color = "#2dc2f0"
                  btnAutMode.layer.enabled = false
             }
             else if(valueSource.man_status == 0)
             {
                 mode_color = "#828282"
             }*/

             return mode_color
         }

         function getBtnAutStatus()
         {
             var mode_color

            /* if(valueSource.aut_status== 1)
             {
                  mode_color = "#2dc2f0"
                  btnManMode.layer.enabled = false
             }
             else if(valueSource.aut_status == 0)
             {
                 mode_color = "#828282"
             }*/

             return mode_color
         }



             Timer  // UTC Time
             {
                 interval: 10; running: true; repeat: true
                 onTriggered:
                 {
                     //canvas.requestPaint()

                 }
             }
             Timer  // CountDown
             {
                 id : timer_countdown
                 interval: 1000; running: false; repeat: true
                 onTriggered:
                 {

                     time_sec--;
                     if(time_sec == -1)
                     {
                         time_sec = 59
                         time_min--
                     }
                 }
             }


             Item{
              id:item_missontime
              x: 670
              y: -13
              width: 696
              height: 99

              Text {
                  id: lblMIssionTime
                  x: 0
                  y: 52
                  width: 234
                  height: 38
                  color: Qt.hsla(0.57,0.0,1,0.8)
                  text: "MISSION TIME :"
                  anchors.centerIn: parent
                  font.family: textFont.name
                  font.pixelSize: 30
                  anchors.horizontalCenterOffset: -231
                  font.bold: false
                  anchors.verticalCenterOffset: 21
              }


             // Item Hour
             Item {
                 id: itemHour
                 x: 234
                 y: 0

                 width: 113
                 height: 91

                 MouseArea {
                 id: mouseAreaHour
                 x: 32
                 y: 38
                 width: 49
                 height: 49

                 onClicked:
                 {
                     valueSource.mission_hour++;
                     txtMissionHour.text = time_min.toLocaleString(Qt.locale("00"),"A",0)
                 }

                 }
                 Text {
                 id: txtMissionHour

                 color: "#259df4"
                 text: time_hour.toLocaleString(Qt.locale("00"),"A",0)
                 verticalAlignment: Text.AlignTop
                 horizontalAlignment: Text.AlignHCenter
                 anchors.centerIn: parent
                 font.family: numericFont.name
                 font.pixelSize: 80
                 anchors.horizontalCenterOffset: 0
                 layer.effect: Glow {
                     color: "#2598f4"
                     samples: 6
                     transparentBorder: true
                 }
                 font.bold: false
                 anchors.verticalCenterOffset: 1
                 layer.enabled: true
                  }


                 }

                 Text {
                 id: lblhour
                 x: 347
                 y: 71

                 width: 39
                 height: 20
                 color: Qt.hsla(0.57,0.0,1,0.8)
                 text: "HR"
                 verticalAlignment: Text.AlignTop
                 anchors.centerIn: parent
                 font.family: textFont.name
                 font.pixelSize: 20
                 anchors.horizontalCenterOffset: 19
                 font.bold: false
                 anchors.verticalCenterOffset: 31
                 }
             // Item Minute
             Item {
                 id: itemMin
                 x: 387
                 y: 0

                 width: 113
                 height: 91
                 MouseArea {
                     id: mouseAreaHour1
                     x: 24
                     y: 35
                     width: 65
                     height: 51


                     onClicked: {
                     valueSource.mission_min++
                     txtMissionMin.text = Number(valueSource.mission_min).toLocaleString(Qt.locale("00"),"A",0)
                     }

                 }

                 Text {
                     id: txtMissionMin

                     color: "#259df4"
                     anchors.centerIn: parent
                     font.family: numericFont.name
                     horizontalAlignment: Text.AlignHCenter
                     font.pixelSize: 80
                     anchors.horizontalCenterOffset: 0
                     layer.effect: Glow {
                         color: "#2598f4"
                         samples: 6
                         transparentBorder: true
                     }
                     verticalAlignment: Text.AlignTop
                     font.bold: false
                     anchors.verticalCenterOffset: 0
                     layer.enabled: true
                     text: time_min.toLocaleString(Qt.locale("00"),"A",0)
                 }
                 }

                 Text {
                 id: lblmin
                 x: 501
                 y: 70

                 width: 37
                 height: 20
                 color: Qt.hsla(0.57,0.0,1,0.8)
                 text: "MIN"
                 anchors.centerIn: parent
                 font.family: textFont.name
                 font.pixelSize: 20
                 anchors.horizontalCenterOffset: 172
                 font.bold: false
                 anchors.verticalCenterOffset: 30
                 }

             Item {
                 id: itemSec
                 x: 538
                 y: 0

                 width: 113
                 height: 91
                 MouseArea {
                     id: mouseAreaHour2
                     x: 33
                     y: 33
                     width: 49
                     height: 58
                 }

                 Text {
                     id: txtMissionHour2

                     color: "#66bfd5e9"
                      text: time_sec.toLocaleString(Qt.locale("00"),"A",0)
                     anchors.centerIn: parent
                     font.family: numericFont.name
                     horizontalAlignment: Text.AlignHCenter
                     font.pixelSize: 80
                     anchors.horizontalCenterOffset: 0
                     layer.effect: Glow {
                         color: "#2598f4"
                         samples: 6
                         transparentBorder: true
                     }
                     font.bold: false
                     verticalAlignment: Text.AlignTop
                     anchors.verticalCenterOffset: 1
                     layer.enabled: true
                 }
             }

             Text {
                 id: lblsec
                 x: 652
                 y: 70

                 width: 39
                 height: 20
                 color: Qt.hsla(0.57,0.0,1,0.8)
                 text: "SEC"
                 anchors.centerIn: parent
                 font.family: textFont.name
                 font.pixelSize: 20
                 anchors.horizontalCenterOffset: 324
                 font.bold: false
                 anchors.verticalCenterOffset: 30
             }
            } // item_mission_time


            Item{
                id:item_robotstatus
                x: 839
                y: 94
                width: 527
                height: 505
                z: 0

                Rectangle {
                    id: rectangleRobotStatus
                    x: 0
                    y: 0

                    width: 527
                    height: 505
                    color: "#191c28"
                    radius: 25
                    z: 0
                    border.width: 3
                    border.color: "#409fe3"
                    opacity: 0.2
                }

                Text {
                    id: lblRoll
                    x: 273
                    y: 35
                    width: 116
                    height: 41
                    color: "#e49c11"
                    text: qsTr("ROLL")
                    font.bold: true
                    font.family: fontSystem.name
                    font.pointSize: 25
                    z: 2
                }

                Text {
                    id: lblManipulator
                    x: 276
                    y: 11
                    width: 113
                    height: 20
                    color: "#5fa5b4"
                    text: qsTr("MANIPULATOR :")
                    font.pointSize: 10
                    z: 2
                    font.family: fontSystem.name
                    font.bold: true
                }

                Text {
                    id: txtManipulatorStatus
                    x: 395
                    y: 8
                    width: 91
                    height: 28
                    //color: "#259df4"
                    color : "red"
                    text: qsTr("DISABLE")
                    font.pointSize: 15
                    z: 2
                    font.family: fontSystem.name
                    font.bold: true
                    layer.enabled: true
                      layer.effect: Glow
                      {
                            anchors.fill : txtManipulatorStatus

                          samples: 1
                          color: "#2598f4"
                          transparentBorder: true
                      }

                }

                Text {
                    id: lblMode
                    x: 8
                    y: 47
                    width: 189
                    height: 58
                    color: "#2dc2f1"
                    text: qsTr("MODE")
                    font.pointSize: 35
                    z: 2
                    font.family: fontSystem.name
                    font.bold: true
                             layer.enabled: true
                           layer.effect: Glow
                           {
                               samples: 10
                               color: "#2598f4"
                               transparentBorder: true
                           }
                }

                Text {
                    id: txtModeShow
                    x: 124
                    y: 98
                    width: 114
                    height: 28
                    color: "#ffffff"
                    text: qsTr("MANUAL")
                    font.pointSize: 18
                    z: 2
                    font.family: fontSystem.name
                    font.bold: true
                }





                Text {
                    id: lblRobotStatus
                    width: 254
                    height: 41
                    x: 10
                    y: 10
                    color: "#8fb9c2"
                    text: qsTr("ROBOT STATUS")
                    font.pointSize: 23
                    z: 2
                    font.family: fontSystem.name
                    font.bold: true
                }


                Text {
                    id: txtRollAngle
                    x: 395
                    y: 28
                    width: 130
                    height: 55
                    color: "#259df4"
                    text: BodyRoll.toFixed(1) +  "°"
                    scale: 1
                    horizontalAlignment: Text.AlignLeft


                    layer.enabled: true
                    font.pixelSize: 45
                    verticalAlignment: Text.AlignTop
                    wrapMode: Text.WordWrap
                    z: 0
                    rotation: 0
                    font.family: numericFont.name
                }

                Text {
                    id: lblPitch
                    x: 268
                    y: 82
                    width: 116
                    height: 41
                    color: "#e49c11"
                    text: qsTr("PITCH")
                    font.pointSize: 25
                    font.bold: true
                    z: 2
                    font.family: fontSystem.name
                }

                Text {
                    id: txtPitchAngle
                    x: 395
                    y: 71
                    width: 130
                    height: 55
                    color: "#259df4"
                    text: BodyPitch.toFixed(1) +  "°"
                    scale: 1
                    horizontalAlignment: Text.AlignLeft

                    layer.enabled: true
                    font.pixelSize: 45
                    wrapMode: Text.WordWrap
                    verticalAlignment: Text.AlignTop
                    z: 0
                    rotation: 0
                    font.family: numericFont.name
                }

                Text {
                    id: lblCo4
                    x: 373
                    y: 35
                    width: 18
                    height: 41
                    color: Qt.hsla(0.57,0.0,1,0.8)
                    text: ":"
                    scale: 1
                    horizontalAlignment: Text.AlignLeft
                    style: Text.Normal
                    layer.enabled: true
                    font.pixelSize: 35
                    wrapMode: Text.NoWrap
                    verticalAlignment: Text.AlignTop
                    z: 0
                    rotation: 0
                    font.family: textFont.name
                }

                Text {
                    id: lblCo5
                    x: 373
                    y: 80
                    width: 23
                    height: 37
                    color: Qt.hsla(0.57,0.0,1,0.8)
                    text: ":"
                    scale: 1
                    horizontalAlignment: Text.AlignLeft
                    style: Text.Normal
                    layer.enabled: true
                    font.pixelSize: 35
                    wrapMode: Text.NoWrap
                    verticalAlignment: Text.AlignTop
                    z: 0
                    rotation: 0
                    font.family: textFont.name
                }

                     Text {
                         id: lblFlipperFL
                         x: 318
                         y: 140
                         width: 29
                         height: 20
                         color: "#5fa5b4"
                         text: qsTr("FL :")
                         font.bold: true
                         z: 2
                         font.family: fontSystem.name
                         font.pointSize: 10
                     }

                     Text {
                         id: lblFlipperFR
                         x: 318
                         y: 160
                         width: 29
                         height: 20
                         color: "#5fa5b4"
                         text: qsTr("FR :")
                         font.bold: true
                         z: 2
                         font.family: fontSystem.name
                         font.pointSize: 10
                     }

                     Text {
                         id: lblFlipperBL
                         x: 318
                         y: 181
                         width: 29
                         height: 20
                         color: "#5fa5b4"
                         text: qsTr("BL :")
                         font.bold: true
                         z: 2
                         font.family: fontSystem.name
                         font.pointSize: 10
                     }

                     Text {
                         id: lblFlipperBR
                         x: 318
                         y: 201
                         width: 29
                         height: 20
                         color: "#5fa5b4"
                         text: qsTr("BR :")
                         font.bold: true
                         z: 2
                         font.family: fontSystem.name
                         font.pointSize: 10
                     }

                     Text {
                         id: txtFlAngle
                         x: 356
                         y: 140
                         width: 58
                         height: 20
                         color: "#259df4"
                         text: FLangle.toFixed(1) +  "°"
                         scale: 1
                         z: 0
                         wrapMode: Text.WordWrap
                         rotation: 0
                         layer.enabled: true
                         font.family: numericFont.name

                         horizontalAlignment: Text.AlignLeft
                         verticalAlignment: Text.AlignTop
                         font.pixelSize: 15
                     }

                     Text {
                         id: txtFRAngle
                         x: 356
                         y: 160
                         width: 58
                         height: 20
                         color: "#259df4"
                         text: FRangle.toFixed(1) +  "°"
                         scale: 1
                         z: 0
                         wrapMode: Text.WordWrap
                         rotation: 0
                         layer.enabled: true
                         font.family: numericFont.name

                         verticalAlignment: Text.AlignTop
                         horizontalAlignment: Text.AlignLeft
                         font.pixelSize: 15
                     }

                     Text {
                         id: txtBLAngle
                         x: 356
                         y: 181
                         width: 58
                         height: 20
                         color: "#259df4"
                         text: BLangle.toFixed(1) +  "°"
                         scale: 1
                         z: 0
                         wrapMode: Text.WordWrap
                         rotation: 0
                         layer.enabled: true
                         font.family: numericFont.name

                         verticalAlignment: Text.AlignTop
                         horizontalAlignment: Text.AlignLeft
                         font.pixelSize: 15
                     }

                     Text {
                         id: txtBRAngle
                         x: 356
                         y: 201
                         width: 58
                         height: 20
                         color: "#259df4"
                         text: BRangle.toFixed(1) +  "°"
                         scale: 1
                         z: 0
                         wrapMode: Text.WordWrap
                         rotation: 0
                         layer.enabled: true
                         font.family: numericFont.name

                         horizontalAlignment: Text.AlignLeft
                         verticalAlignment: Text.AlignTop
                         font.pixelSize: 15
                     }

                     Text {
                         id: lblManiJ1
                         x: 413
                         y: 140
                         width: 29
                         height: 20
                         color: "#5fa5b4"
                         text: qsTr("J1 :")
                         font.bold: true
                         z: 2
                         font.family: fontSystem.name
                         font.pointSize: 10
                     }

                     Text {
                         id: lblManiJ2
                         x: 413
                         y: 160
                         width: 29
                         height: 20
                         color: "#5fa5b4"
                         text: qsTr("J2 :")
                         font.bold: true
                         z: 2
                         font.family: fontSystem.name
                         font.pointSize: 10
                     }

                     Text {
                         id: lblManiJ3
                         x: 413
                         y: 181
                         width: 29
                         height: 20
                         color: "#5fa5b4"
                         text: qsTr("J3 :")
                         font.bold: true
                         z: 2
                         font.family: fontSystem.name
                         font.pointSize: 10
                     }

                     Text {
                         id: lblManiJ4
                         x: 413
                         y: 201
                         width: 29
                         height: 20
                         color: "#5fa5b4"
                         text: qsTr("J4 :")
                         font.bold: true
                         z: 2
                         font.family: fontSystem.name
                         font.pointSize: 10
                     }

                     Text {
                         id: txtJ1Angle
                         x: 448
                         y: 140
                         width: 58
                         height: 20
                         color: "#259df4"
                         text: J1angle.toFixed(1) + "°"
                         scale: 1
                         z: 0
                         wrapMode: Text.WordWrap
                         rotation: 0
                         layer.enabled: true
                         font.family: numericFont.name

                         verticalAlignment: Text.AlignTop
                         horizontalAlignment: Text.AlignLeft
                         font.pixelSize: 15
                     }

                     Text {
                         id: txtJ2Angle
                         x: 448
                         y: 160
                         width: 58
                         height: 20
                         color: "#259df4"
                         text: J2angle.toFixed(1) + "°"
                         scale: 1
                         z: 0
                         wrapMode: Text.WordWrap
                         rotation: 0
                         layer.enabled: true
                         font.family: numericFont.name

                         horizontalAlignment: Text.AlignLeft
                         verticalAlignment: Text.AlignTop
                         font.pixelSize: 15
                     }

                     Text {
                         id: txtJ3Angle
                         x: 448
                         y: 181
                         width: 58
                         height: 20
                         color: "#259df4"
                         text: J3angle.toFixed(1) + "°"
                         scale: 1
                         z: 0
                         wrapMode: Text.WordWrap
                         rotation: 0
                         layer.enabled: true
                         font.family: numericFont.name

                         horizontalAlignment: Text.AlignLeft
                         verticalAlignment: Text.AlignTop
                         font.pixelSize: 15
                     }

                     Text {
                         id: txtJ4Angle
                         x: 448
                         y: 201
                         width: 58
                         height: 20
                         color: "#259df4"
                         text: J4angle.toFixed(1) + "°"
                         scale: 1
                         z: 0
                         wrapMode: Text.WordWrap
                         rotation: 0
                         layer.enabled: true
                         font.family: numericFont.name

                         verticalAlignment: Text.AlignTop
                         horizontalAlignment: Text.AlignLeft
                         font.pixelSize: 15
                     }
                     Text {
                         id: lblHokuyo
                         x: 429
                         y: 227
                         width: 70
                         height: 20
                         color: "#5fa5b4"
                         text: qsTr("HOKUYO :")
                         font.family: fontSystem.name
                         font.pointSize: 10
                         z: 2
                         font.bold: true
                     }

                     Text {
                         id: lblHokuyoRoll
                         x: 406
                         y: 253
                         width: 42
                         height: 20
                         color: "#5fa5b4"
                         text: qsTr("Roll   :")
                         font.family: fontSystem.name
                         font.pointSize: 10
                         z: 2
                         font.bold: true
                     }

                     Text {
                         id: lblHokuyoPitch
                         x: 406
                         y: 274
                         width: 43
                         height: 20
                         color: "#5fa5b4"
                         text: qsTr("Pitch :")
                         font.family: fontSystem.name
                         font.pointSize: 10
                         z: 2
                         font.bold: true
                     }

                     Text {
                         id: lblHokuyoYaw
                         x: 406
                         y: 294
                         width: 42
                         height: 20
                         color: "#5fa5b4"
                         text: qsTr("Yaw  :")
                         font.family: fontSystem.name
                         font.pointSize: 10
                         z: 2
                         font.bold: true
                     }

                     Text {
                         id: txtHokuyoRoll
                         x: 454
                         y: 253
                         width: 58
                         height: 20
                         color: "#259df4"
                         text: Number(15.2).toFixed(1) + "°"
                         font.family: numericFont.name
                         z: 0
                         wrapMode: Text.WordWrap
                         verticalAlignment: Text.AlignTop
                         horizontalAlignment: Text.AlignLeft
                         rotation: 0
                         font.pixelSize: 15

                         layer.enabled: true
                         scale: 1
                     }

                     Text {
                         id: txtHokuyoPitch
                         x: 454
                         y: 274
                         width: 58
                         height: 20
                         color: "#259df4"
                         text: Number(35.2).toFixed(1) + "°"
                         font.family: numericFont.name
                         z: 0
                         wrapMode: Text.WordWrap
                         horizontalAlignment: Text.AlignLeft
                         verticalAlignment: Text.AlignTop
                         rotation: 0
                         font.pixelSize: 15

                         layer.enabled: true
                         scale: 1
                     }

                     Text {
                         id: txtHokuyoYaw
                         x: 454
                         y: 294
                         width: 58
                         height: 20
                         color: "#259df4"
                         text: Number(45.2).toFixed(1) + "°"
                         font.family: numericFont.name
                         z: 0
                         wrapMode: Text.WordWrap
                         horizontalAlignment: Text.AlignLeft
                         verticalAlignment: Text.AlignTop
                         rotation: 0
                         font.pixelSize: 15

                         layer.enabled: true
                          scale: 1
                      }

            }// item_robotstatus



             Text {
                 id: txtTeleOpLogo
                 x: 163
                 y: 10
                 width: 350
                 height: 55
                 color: Qt.hsla(0.57,0.0,1,0.8)
                 text: "TELE-OP VI"

                 anchors.verticalCenterOffset: -346
                 anchors.horizontalCenterOffset: -345
                 font.bold: false
                 font.family: textFont.name
                 font.pixelSize: 60
             }

             Text {
                 id: txtTeleOpLogo1
                 x: 200
                 y: 71
                 width: 276
                 height: 33
                 color: Qt.hsla(0.57,0.0,1,0.8)
                 text: "OPERATION CONTROL UNIT"
                 font.pixelSize: 20
                 font.family: textFont.name
                 font.bold: false
                 anchors.verticalCenterOffset: -296
                 anchors.horizontalCenterOffset: -345
             }


            Image {
                id: robotBody
                x: 1087
                y: 461
                width: 149
                height: 60
                z : 0
                source: "/home/chot/catkin_ws/src/testqt5_create/qml/body02.png"

                    Rectangle{
                        id:originpoint_body
                        x: robotBody.width/2
                        y: robotBody.height/2

                    width: 12
                    height: 10
                    color: "#00000000"

                    }

                transform: Rotation { origin.x: originpoint_body.x ; origin.y: originpoint_body.y; axis { x: 0; y: 0; z: 1 } angle: BodyPitch }
                Image {
                    id: robotManiBase
                    x: 28
                    y: -17
                    z : 0
                    width: 37
                    height: 21
                    fillMode: Image.PreserveAspectFit

                    clip: false

                    rotation: 0
                    source: "/home/chot/catkin_ws/src/testqt5_create/qml/base.png"
                    opacity: 1

                    visible: true
                }

                Image {
                    id: robotHokuyoBack
                    x: 108
                    y: -93
                    width: 52
                    height: 50
                    scale: 0.5
                    fillMode: Image.PreserveAspectFit
                    visible: true
                    clip: false
                    opacity: 1
                    z: 1
                    source: "/home/chot/catkin_ws/src/testqt5_create/qml/hokuyo_side.png"

                    Rectangle{
                        id:originpoint_hokuyo
                        x: 25
                        y: 28

                    width: 1
                    height: 1
                    border.width: 2
                    border.color: "red"
                    color: "#00000000"
                    visible: false

                    }

                 transform: Rotation { origin.x: originpoint_hokuyo.x ; origin.y: originpoint_hokuyo.y; axis { x: 0; y: 0; z: 1 } angle: 0}

                }




                Image {
                    id: robotFlipperFrontR
                    x: -60
                    y: -2
                    width: 115
                    height: 65
                    fillMode: Image.PreserveAspectFit
                    visible: true
                    clip: false
                    opacity: 0.5
                    z: -1
                    source: "/home/chot/catkin_ws/src/testqt5_create/qml/flipper_r_opacity50.png"

                    Rectangle{
                        id:originpoint_fr
                        x: 86
                        y: 32

                    width: 1
                    height: 1
                    border.width: 2
                    border.color: "red"
                    color: "#00000000"
                    visible: false

                    }

                 transform: Rotation { origin.x: originpoint_fr.x ; origin.y: originpoint_fr.y; axis { x: 0; y: 0; z: -1 } angle: FRangle -90 }

                }

                Image {
                    id: robotFlipperBackR
                    x: 34
                    y: -2
                    width: 115
                    height: 65
                    fillMode: Image.PreserveAspectFit
                    visible: true
                    clip: false
                    opacity: 0.5
                    z: -1
                    source: "/home/chot/catkin_ws/src/testqt5_create/qml/flipper_r_opacity50.png"

                    Rectangle{
                        id:originpoint_br
                        x: 86
                        y: 32

                    width: 1
                    height: 1
                    border.width: 2
                    border.color: "red"
                    color: "#00000000"
                    visible: false

                    }

                 transform: Rotation { origin.x: originpoint_br.x ; origin.y: originpoint_br.y; axis { x: 0; y: 0; z: 1 } angle: BRangle -270  }

                }


                Image {
                    id: robotFlipperFront
                    x: -60
                    y: -2
                    width: 115
                    height: 65
                    fillMode: Image.PreserveAspectFit
                    visible: true
                    clip: false
                    opacity: 1
                    z: 2
                    source: "/home/chot/catkin_ws/src/testqt5_create/qml/flipper.png"

                    Rectangle{
                        id:originpoint_fl
                        x: 86
                        y: 32

                    width: 1
                    height: 1
                    border.width: 2
                    border.color: "red"
                    color: "#00000000"
                    visible: false
                    z: 1

                    }

                 transform: Rotation { origin.x: originpoint_fl.x ; origin.y: originpoint_fl.y; axis { x: 0; y: 0; z: -1 } angle: FLangle -90 }

                }

                Image {
                    id: robotFlipperBack
                    x: 34
                    y: -2
                    width: 115
                    height: 65
                    rotation: 0
                    clip: false
                    opacity: 100
                    visible: true
                    Rectangle {
                        id: originpoint_bl
                        x: 87
                        y: 32
                        width: 1
                        height: 1
                        color: "#000000"
                        visible: false
                        border.width: 2
                        border.color: "#ff0000"
                        z: 1
                    }

                    z: 2
                    source: "/home/chot/catkin_ws/src/testqt5_create/qml/flipper.png"
                    fillMode: Image.PreserveAspectFit

                transform: Rotation { origin.x: originpoint_bl.x ; origin.y: originpoint_bl.y; axis { x: 0; y: 0; z: 1 } angle: BLangle - 270}
                }

                    Image
                    {
                       id: robotManiLink1
                       x: 42
                       y: -17
                       width: 99
                       height: 16
                       visible: true
                       z: 0

                       source: "/home/chot/catkin_ws/src/testqt5_create/qml/link1.png"
                       Rectangle{
                           id:originpoint_link1
                           x: 0
                           y: 7

                       width: 1
                       height: 1
                       color: "#00000000"

                       }

                   transform: Rotation { origin.x: originpoint_link1.x ; origin.y: originpoint_link1.y; axis { x: 0; y: 0; z: -1 } angle: J2angle}

                   Image {
                       id: robotManiLink2
                       x: 0
                       y: 3
                       width: 99
                       height: 9
                       z: 0
                       source: "/home/chot/catkin_ws/src/testqt5_create/qml/link2.png"
                       Rectangle{
                           id:originpoint_link2
                           x: 92
                           y: 4
                       width: 1
                       height: 1
                       color: "#00ffffff"

                       }

                   transform: Rotation { origin.x: originpoint_link2.x ; origin.y: originpoint_link2.y; axis { x: 0; y: 0; z: 1 } angle: J3angle}

                    Image {
                        id: robotFrontCam
                        x: -23
                        y: -6
                        width: 37
                        height: 21
                        z: 2
                        source: "/home/chot/catkin_ws/src/testqt5_create/qml/front_cam.png"
                        Rectangle{
                            id:originpoint_FrontCam
                            x: 30
                            y: 10
                        width: 1
                        height: 1
                        color: "#00ffffff"

                        }

                    transform: Rotation { origin.x: originpoint_FrontCam.x ; origin.y: originpoint_FrontCam.y; axis { x: 0; y: 0; z: 1 } angle: J4angle}
                    }
                   }
            }

            }//robotBody


            Image {
                id: robotBackView
                x: 876
                y: 459
                width: 115
                height: 65
                rotation: 0
                fillMode: Image.PreserveAspectFit
                visible: true
                clip: false
                opacity: 100
                z: 1
                source: "/home/chot/catkin_ws/src/testqt5_create/qml/body_back.png"

                Rectangle{
                    id:originpoint_back
                    x: 57
                    y: 32

                width: 1
                height: 1
                border.width: 2
                border.color: "red"
                color: "#00000000"
                visible: false

                }

             transform: Rotation { origin.x: originpoint_back.x ; origin.y: originpoint_back.y; axis { x: 0; y: 0; z: 1 } angle: BodyRoll }

            }

             Item{
                 id:item_FrontCAM_panel
                 x: 18
                 y: 100
                 width: 640+20
                 height: 480+ 20

                 // Frame
                 Rectangle {
                     id: rectangleFrontCam
                     width: 640+ 20
                     height: 480 + 20
                     color: "#00000000"
                     radius: 25
                     z: 1
                     border.width: 10
                     //border.color: "#409ae3"
                     border.color: "grey"
                     layer.enabled: true
                     layer.effect: Glow {
                         color: "grey"
                         //color : "white"
                         samples: 20
                         transparentBorder: true
                     }
                 }

                // Front CAM & IR CAM
                Rectangle
                 {
                    id: rectangle2
                     Rectangle {
                         x: 10
                         y: 10
                         width: image.width
                         height: image.height
                         Image {
                             id: image
                             z: 0
                             source: "image://videoCapture/hoge"
                         }
                         Timer {
                                 property int cnt: 0
                                 interval: 32
                                 running: true
                                 repeat: true
                                 onTriggered:
                                 {
                                     if (image.status === Image.Ready) {
                                         image.source = "image://videoCapture/" + cnt;
                                         ++cnt;
                                     }
                                 }
                             }//timer

                     }
                }

                 Text {
                     id: txtCAMStatus
                     x: 17
                     y: 30

                     width: 239
                     height: 33
                     color: Qt.hsla(0.57,0.0,1,0.8)
                     text: "FRONT CAM"
                     scale: 1
                     horizontalAlignment: Text.AlignLeft
                     z: 0
                     verticalAlignment: Text.AlignTop
                     font.family: textFont.name
                     font.pixelSize: 25
                     wrapMode: Text.WordWrap
                     rotation: 0
                 }
                 Text {
                     id: lblTemp
                     x: 347
                     y: 30

                     width: 101
                     height: 33
                     color: Qt.hsla(0.57,0.0,1,0.8)
                     text: "TEMP :"
                     z: 0
                     verticalAlignment: Text.AlignTop
                     wrapMode: Text.WordWrap
                     horizontalAlignment: Text.AlignLeft
                     font.pixelSize: 25
                     rotation: 0
                     scale: 1
                     font.family: textFont.name

                 }

                 Text
                 {
                     id:txtCo2Value


                    x: 460
                    y: 69
                    text: Co2.toFixed(0)                                       // CO2 value
                    font.family: numericFont.name
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignLeft
                    scale: 1
                    rotation: 0
                    z: 0
                    width: 109
                    height: 46
                    wrapMode: Text.WordWrap
                    font { pixelSize: 44 }
                    color: "#259df4"

                    layer.enabled: true
                    layer.effect: Glow
                     {
                         anchors.fill: txtCo2Value
                         radius: 3
                         samples: 10
                         color: "#2598f4"
                         transparentBorder: true
                    }

                }


                Text {
                    id: lblCo2
                    x: 360
                    y: 78

                    width: 88
                    height: 37
                    color: Qt.hsla(0.57,0.0,1,0.8)
                    text: "CO    :"
                    style: Text.Normal

                    z: 0
                    verticalAlignment: Text.AlignTop
                    layer.enabled: true
                    horizontalAlignment: Text.AlignLeft
                    wrapMode: Text.NoWrap
                    font.pixelSize: 25
                    scale: 1
                    rotation: 0
                    font.family: textFont.name
                }

                Text {
                    id: lblco22
                    x: 397
                    y: 104

                    width: 45
                    height: 36
                    color: Qt.hsla(0.57,0.0,1,0.8)
                    text: "2"
                    horizontalAlignment: Text.AlignLeft
                    scale: 1
                    layer.enabled: true
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.WordWrap
                    rotation: 0
                    font.family: localFont.name
                    font.pixelSize: 15
                    z: 0

                }

                Text {
                    id: txtVictimTemp
                    x: 460
                    y: 16

                    width: 109
                    height: 47
                    color: "#259df4"

                    layer.enabled: true
                    layer.effect: Glow
                     {
                         anchors.fill: txtVictimTemp
                         radius: 3
                         samples: 15
                         color: "#2598f4"
                         transparentBorder: true
                    }

                    text: victemp.toFixed(1)                                    // Victim Temp.
                    horizontalAlignment: Text.AlignLeft
                    scale: 1
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.WordWrap
                    rotation: 0
                    font.family: numericFont.name
                    font.pixelSize: 44
                    z: 0



                }

                Text {
                    id: lblCelciusUnit
                    x: 570
                    y: 30

                    width: 31
                    height: 34
                    color: Qt.hsla(0.57,0.0,1,0.8)
                    text: "°C"
                    horizontalAlignment: Text.AlignLeft
                    scale: 1
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.WordWrap
                    rotation: 0
                    font.family: textFont.name
                    font.pixelSize: 30
                    z: 0
                }

                Text {
                    id: lblPPM
                    x: 562
                    y: 83

                    width: 65
                    height: 32
                    color: Qt.hsla(0.57,0.0,1,0.8)
                    text: "PPM"
                    horizontalAlignment: Text.AlignLeft
                    scale: 1
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.WordWrap
                    rotation: 0
                    font.family: textFont.name
                    font.pixelSize: 30
                    z: 0
                }

             }// Item front_cam & IR



       /*     Rectangle {
                id: rectangle3
                x: 1063
                y: 547
                width: 561
                height: 477
                color: "#26000000"
                radius: 15
                border.width: 3
                border.color: "#409fe3"
            }*/




/*
            Text {
                id: txtRollAngle
                x: 1495
                y: 580
                width: 104
                height: 55
                color: "#259df4"
                text: Number(0.0).toFixed(1) +  "°"
                scale: 1
                horizontalAlignment: Text.AlignLeft

                layer.effect: Glow {
                    color: "#2598f4"
                    samples: 6
                    transparentBorder: true
                }

                layer.enabled: true
                font.pixelSize: 45
                verticalAlignment: Text.AlignTop
                wrapMode: Text.WordWrap
                z: 0
                rotation: 0
                font.family: numericFont.name
            }

            Text {
                id: lblPitch
                x: 1371
                y: 639
                width: 116
                height: 41
                color: "#e49c11"
                text: qsTr("PITCH")
                font.pointSize: 25
                font.bold: true
                z: 2
                font.family: fontSystem.name
            }

            Text {
                id: txtPitchAngle
                x: 1495
                y: 627
                width: 104
                height: 55
                color: "#259df4"
                text: "0.0" + "°"
                scale: 1
                horizontalAlignment: Text.AlignLeft
                layer.effect: Glow {
                    color: "#2598f4"
                    samples: 6
                    transparentBorder: true
                }
                layer.enabled: true
                font.pixelSize: 45
                wrapMode: Text.WordWrap
                verticalAlignment: Text.AlignTop
                z: 0
                rotation: 0
                font.family: numericFont.name
            }

            Text {
                id: lblCo3
                x: 1360
                y: 415
                width: 23
                height: 37
                color: Qt.hsla(0.57,0.0,1,0.8)
                text: ":"
                scale: 1
                horizontalAlignment: Text.AlignLeft
                style: Text.Normal
                layer.enabled: true
                font.pixelSize: 35
                verticalAlignment: Text.AlignTop
                wrapMode: Text.NoWrap
                z: 0
                rotation: 0
                font.family: textFont.name
            }

            Text {
                id: lblCo4
                x: 1475
                y: 589
                width: 23
                height: 37
                color: Qt.hsla(0.57,0.0,1,0.8)
                text: ":"
                scale: 1
                horizontalAlignment: Text.AlignLeft
                style: Text.Normal
                layer.enabled: true
                font.pixelSize: 35
                wrapMode: Text.NoWrap
                verticalAlignment: Text.AlignTop
                z: 0
                rotation: 0
                font.family: textFont.name
            }

            Text {
                id: lblCo5
                x: 1475
                y: 635
                width: 23
                height: 37
                color: Qt.hsla(0.57,0.0,1,0.8)
                text: ":"
                scale: 1
                horizontalAlignment: Text.AlignLeft
                style: Text.Normal
                layer.enabled: true
                font.pixelSize: 35
                wrapMode: Text.NoWrap
                verticalAlignment: Text.AlignTop
                z: 0
                rotation: 0
                font.family: textFont.name
            }*/

            Item{
                id:item_spdPanel
                x: 664
                y: 263
                width : 169
                height : 334
                Text {
                id: lblSpdPanel
                x: 21
                y: 0

                width: 128
                height: 44
                color: Qt.hsla(0.57,0.0,1,0.8)
                text: "SPEED"
                font.bold: true
                scale: 1
                z: 0
                wrapMode: Text.WordWrap
                rotation: 0
                font.family: textFont.name
                verticalAlignment: Text.AlignTop
                horizontalAlignment: Text.AlignLeft
                font.pixelSize: 35
            }
            Text {
                id: lblMLSpdPanel
                x: 25
                y: 50
                width: 54
                height: 44
                color: Qt.hsla(0.57,0.0,1,0.8)
                text: "ML"
                wrapMode: Text.WordWrap
                rotation: 0
                font.bold: true
                font.pixelSize: 35
                z: 0
                font.family: textFont.name
                horizontalAlignment: Text.AlignLeft
                scale: 1
                verticalAlignment: Text.AlignTop
            }

            Text {
                id: txtMlSpdSetL
                objectName: "MlSpdSet"
                x: 21
                y: 79

                width: 62
                height: 59
                color: "#259df4"
                text: (speed_slider.value*100).toFixed(0)
                property int ml_spdSet:speed_slider.value*100                  // txt speed set
                scale: 1
                z: 0
                wrapMode: Text.WordWrap
                font.family: numericFont.name
                rotation: 0
                verticalAlignment: Text.AlignTop
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 55

                layer.enabled: true
                layer.effect: Glow {
                    color: "#2598f4"
                    samples: 6
                    transparentBorder: true
                }

            }


            // Slider
            Item {
            id:speed_slider
            property real value: bar.x / (foo.width - bar.width)
            x: -19
            y: 197

            width: 150
            height: 34
            rotation: 270
            Item {
                id: foo
                width: parent.width - 4
                height: 6
                anchors.centerIn: parent

                Rectangle
                {
                    height: parent.height
                    anchors.left: parent.left
                    anchors.right: bar.horizontalCenter
                    layer.enabled: true
                    layer.effect: Glow
                    {
                        color: "#2598f4"
                        samples: 15
                        transparentBorder: true
                    }
                    color: "#259df4"
                    radius: 3
                }

                // Bar
                Rectangle {
                    id:gray_bar
                    height: parent.height
                    anchors.left: bar.horizontalCenter
                    anchors.right: parent.right
                    color: "gray"
                    radius: 3
                }
                Rectangle {
                    anchors.fill: parent
                    color: "transparent"
                    radius: 3
                    border.width: 0
                }


                    Rectangle
                    {
                        anchors.fill: red_bar_bar
                        layer.enabled: true
                        layer.effect: Glow
                        {
                            color: "orange"
                            samples: 15
                            transparentBorder: true
                        }
                        color: "#ffa800"
                        radius: 3
                    }

                    // Bar
                    Rectangle
                    {
                        id : red_bar_bar
                        width: MLSpeed*1.5  // current value       // Bar motor left value
                        height: 6
                        color: "#ffa800"
                        radius: 3
                    }
                    Rectangle
                    {
                        color: "transparent"
                        radius: 3
                        anchors.rightMargin: 0
                        anchors.bottomMargin: 0
                        anchors.leftMargin: 0
                        anchors.topMargin: 0
                        border.width: 0
                    }


                // Circle button
                Rectangle {
                    id: bar
                    y: -7
                    width: 20
                    height: 20
                    radius: 15
                    color: Qt.hsla(0.57,0.0,1,1.0)

                    MouseArea {
                        anchors.fill: parent
                        drag.target: parent
                        drag.axis: Drag.XAxis
                        drag.minimumX: 0
                        drag.maximumX: (foo.width - parent.width)-1


                    }
                }


            }

                Text {
                    id: txtMlSpdActual
                    x: -53
                    y: 5

                    width: 40
                    height: 20
                    color: "#259df4"
                    text: MLSpeed.toFixed(0)                                  // Motor left actual speed
                    wrapMode: Text.WordWrap
                    rotation: 90
                    font.pixelSize: 18
                    z: 0
                    font.family: numericFont.name
                    horizontalAlignment: Text.AlignHCenter
                    scale: 1

                    layer.enabled: true
                    layer.effect: Glow
                     {
                         anchors.fill: txtMlSpdActual
                         radius: 2
                         samples: 5
                         color: "#2598f4"
                         transparentBorder: true
                    }
                    verticalAlignment: Text.AlignTop
                }

                Text {
                    id: lblMLRPM
                    x: -39
                    y: 7

                    width: 50
                    height: 20
                    color: "#5fa5b4"
                    text: qsTr("RPM")
                    rotation: 90
                    font.pointSize: 15
                    font.bold: true
                    z: 2
                    font.family: fontSystem.name
                }
            }

            Text {
            id: txtMlSpdSetR
            x: 99
            y: 79

            width: 62
            height: 59
            color: "#259df4"
            text: (speed_slider1.value*100).toFixed(0)
            property int mr_spdSet:speed_slider1.value*100                                        // motor right speed set
            wrapMode: Text.WordWrap
            rotation: 0
            font.pixelSize: 55
            z: 0
            font.family: numericFont.name
            horizontalAlignment: Text.AlignHCenter
            scale: 1
            layer.effect: Glow {
            color: "#2598f4"
            samples: 6
            transparentBorder: true
            }
            layer.enabled: true
            verticalAlignment: Text.AlignTop
            }

            // Motor right
            Item {
            id: speed_slider1
            property real value: bar1.x / (foo1.width - bar1.width)
            x: 46
            y: 197

            width: 150
            height: 34

            Item {
            id: foo1
            width: parent.width - 4
            height: 6
            Rectangle {
                height: parent.height
                color: "#259df4"
                radius: 3
                anchors.right: bar1.horizontalCenter
                anchors.left: parent.left
                layer.effect: Glow {
                    color: "#2598f4"
                    samples: 15
                    transparentBorder: true
                }
                layer.enabled: true
            }

            Rectangle {
                id: gray_bar1
                height: parent.height
                color: "#808080"
                radius: 3
                anchors.right: parent.right
                anchors.left: bar1.horizontalCenter
            }

            Rectangle {
                color: "#00000000"
                radius: 3
                border.width: 0
                anchors.fill: parent
            }

            Rectangle {
                color: "#ffa800"
                radius: 3
                anchors.fill: red_bar_bar1
                layer.effect: Glow {
                    color: "#ffa500"
                    samples: 15
                    transparentBorder: true
                }
                layer.enabled: true
            }

            Rectangle {
                id: red_bar_bar1
                //width: valueSource.robot_speedR*1.5             // Bar motor right value
                width: MRSpeed * 1.5                                   // Bar motor right value
                height: 6
                color: "#ffa800"
                radius: 3
            }

            Rectangle {
                color: "#00000000"
                radius: 3
                border.width: 0
                anchors.topMargin: 0
                anchors.leftMargin: 0
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
            }

            Rectangle {
                id: bar1
                y: -7
                width: 20
                height: 20
                color: Qt.hsla(0.57,0.0,1,1.0)
                radius: 15
                MouseArea {
                    drag.target: parent
                    anchors.fill: parent
                    drag.maximumX: (foo1.width - parent.width)-1
                    drag.axis: Drag.XAxis
                    drag.minimumX: 0
                }
            }
            anchors.centerIn: parent
            }

            Text {
            id: txtMlSpdActual1
            x: -53
            y: 5

            width: 40
            height: 20
            color: "#259df4"
            text: MRSpeed.toFixed(0)                                  // Motor Left speed actual
            wrapMode: Text.WordWrap
            rotation: 90
            font.pixelSize: 18
            z: 0
            font.family: numericFont.name
            horizontalAlignment: Text.AlignHCenter
            scale: 1
            layer.enabled: true
            layer.effect: Glow
             {
                 anchors.fill: txtMlSpdActual1
                 radius: 2
                 samples: 5
                 color: "#2598f4"
                 transparentBorder: true
            }


            verticalAlignment: Text.AlignTop
            }

            Text {
            id: lblMRRPM
            x: -39
            y: 7

            width: 50
            height: 20
            color: "#5fa5b4"
            text: qsTr("RPM")
            font.pointSize: 15
            rotation: 90
            font.bold: true
            z: 2
            font.family: fontSystem.name
            }
            rotation: 270
            }

            Text {
            id: lblMRSpdPanel
            x: 93
            y: 50

            width: 56
            height: 44
            color: Qt.hsla(0.57,0.0,1,0.8)
            text: "MR"
            wrapMode: Text.WordWrap
            rotation: 0
            font.bold: true
            font.pixelSize: 35
            z: 0
            font.family: textFont.name
            horizontalAlignment: Text.AlignLeft
            scale: 1
            verticalAlignment: Text.AlignTop
            }

            } // ItemSpdPanel


        Item {
            id: blLogo
            x: 18
            y: 655
            width: 359
            height: 105
            transformOrigin: Item.Center

            Image {
                id: image2
                x: 0
                y: 8
                width: 86
                height: 100
                source: "/home/chot/catkin_ws/src/testqt5_create/qml/BL logo.png"
            }

            Text {
                id: txtSystem15
                x: 65
                y: 41
                width: 152
                height: 35
                color: "#ffffff"
                text: qsTr("BARTLAB")
                z: 2
                font.pointSize: 22
                font.family: fontSystem.name
                font.bold: true
            }

            Text {
                id: txtSystem2
                x: 65
                y: 74
                width: 297
                height: 34
                color: "#ffffff"
                text: qsTr("Center for Biomedical and Robotics Technology\nFaculty of Engineering, Mahidol University")
                z: 2
                font.pointSize: 10
                font.family: fontSystem.name
                font.bold: true
            }
        }

            Item{
                id: item_robotCMD
                x: 383
                y: 603
                 width: 458
                 height: 166

            Rectangle {
                id: rectangleRobotCMD
                x: 0
                y: 0
                width: 458
                height: 166
                color: "#1a1d28"
                radius: 25
                z: 0
                border.width: 3
                border.color: "#409fe3"
                opacity: 0.2
            }

            Text {
                id: txtMission1
                x: 139
                y: 8
                width: 182
                height: 35
                color: "#8fb9c2"
                text: qsTr("ROBOT CMD")
                z: 0
                font.family: fontSystem.name
                font.bold: true
                font.pointSize: 22
            }

            Rectangle {
                id: btnReset
                x: 310
                y: 69
                width: 125
                height: 45
                color: "red"
                radius: 10
                border.color: "red"

                MouseArea
                {
                    id: mouseAutMode3
                    width: 125
                    height: 45
                    onDoubleClicked:
                    {

                    }
                }


                Text {
                    id: txtAutMode3
                    x: 37
                    y: 12
                    width: 51
                    height: 21
                    color: "#000000"
                    text: qsTr("RESET")
                    z: 2
                    font.family: textFont.name
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: true
                    font.pointSize: 13
                    verticalAlignment: Text.AlignVCenter
                }
                layer.enabled: true
                layer.effect: Glow {
                    color: "red"
                    samples: 20
                    transparentBorder: true
                }
            }

         Rectangle {
             id: btnStart
             x: 18
             y: 69
             width: 125
             height: 45
             color: getStartStatus()
             radius: 10
             border.color: getStartStatus()

             MouseArea
             {
                 id: mouseStart
                 width: 125
                 height: 45
                 onClicked:
                 {
                    timer_countdown.start()
                    time_status=1
                 }
             }


             Text {
                 id: txtStart
                 x: 37
                 y: 12
                 width: 51
                 height: 21
                 color: "#000000"
                 text: qsTr("START")
                 z: 2
                 font.family: textFont.name
                 horizontalAlignment: Text.AlignHCenter
                 font.bold: true
                 font.pointSize: 13
                 verticalAlignment: Text.AlignVCenter
             }
             layer.enabled: true
             layer.effect: Glow {
                 color: "green"
                 samples: getStartGlow()
                 transparentBorder: true
             }
         }
         Rectangle {
             id: btnPause
             x: 167
             y: 69
             width: 125
             height: 45
             color: getPauseStatus()
             radius: 10
             border.color: getPauseStatus()

             MouseArea
             {
                 id: mousePause
                 width: 125
                 height: 45
                 //onDoubleClicked:
                 onClicked:
                 {
                    timer_countdown.stop()
                    time_status=0
                 }
             }


             Text {
                 id: txtPause
                 x: 37
                 y: 12
                 width: 51
                 height: 21
                 color: "#000000"
                 text: qsTr("PAUSE")
                 z: 2
                 font.family: textFont.name
                 horizontalAlignment: Text.AlignHCenter
                 font.bold: true
                 font.pointSize: 13
                 verticalAlignment: Text.AlignVCenter
             }
             layer.enabled: true
             layer.effect: Glow {
                 color: "orange"
                 samples: getPauseGlow()
                 transparentBorder: true
             }
         }

        }//item_robotCMD

        // Mission
        Item {
            id: itemMode
            x: 839
            y: 602
            width: 527
            height: 166
            z: 2
            Rectangle {
                id: rectangleMission

                width: 527
                height: 166
                color: "#191d28"
                radius: 25
                opacity: 0.2
                border.width: 3
                z: 0
                border.color: "#409ae3"

            }

            Text {
                id: txtMission
                x: 201
                y: 8

                width: 125
                height: 35
                color: "#8fb9c2"
                text: qsTr("MISSION")
                font.bold: true
                font.pointSize: 22
                z: 0
                font.family: fontSystem.name
            }
        Rectangle {
        id: btnAutMode
        x: 70
        y: 49
        width: 125
        height: 45
        color: getBtnAutStatus()
        radius: 10

        layer.enabled: getBtnAutStatus()
        layer.effect: Glow {
            color: "#2dc2f0"
            samples: getAutGlowMode()
            transparentBorder: true
        }

        MouseArea {
            id: mouseAutMode
            width: 125
            height: 45
            onClicked: {
                valueSource.man_status = 0
                valueSource.aut_status = 1
                btnManMode.layer.enabled = false
                btnAutMode.layer.enabled = true
                txtModeShow.text = "MANUAL"
            }
        }

        Text {
            id: txtAutMode
            x: 37
            y: 12
            width: 51
            height: 21
            color:  "#000000"
            text: qsTr("TELEOP")
            font.bold: true
            font.pointSize: 13
            z: 2
            horizontalAlignment: Text.AlignHCenter
            font.family: textFont.name
            verticalAlignment: Text.AlignVCenter
        }
        border.color: "#00000000"
        }
        // TeleOp Button
        Rectangle
        {
            id: btnManMode
            x: 70
            y: 100

            width: 125
            height: 45
            color: getBtnManStatus()
            radius: 10
            border.width: 5
            border.color: "#00000000"
            layer.enabled: getBtnManStatus()
            layer.effect: Glow {
                color: "#2dc2f0"
                samples: getManGlowMode()
                transparentBorder: true
            }

            Text {
                id: txtManualMode
                x: 37
                y: 13
                width: 51
                height: 20
                color: "#000000"
                text: qsTr("AUTO")
                font.bold: true
                font.pointSize: 13
                z: 2
                font.family: textFont.name

            }

            MouseArea {
                id: mouseManMode
                width: 125
                height: 45
                onClicked: {
                valueSource.man_status = 1
                valueSource.aut_status = 0
                btnAutMode.layer.enabled = false
                btnManMode.layer.enabled = true
                txtModeShow.text = "AUTO"
                }
            }

        }

        // Mission01
        Rectangle
        {
            id: btnMsn3
            x: 201
            y: 49
            width: 125
            height: 45
            color: getBtnMsn1Status()
            radius: 10
            layer.effect: Glow {
                color: "#2dc2f0"
                samples: getMsn1GlowMode()
                transparentBorder: true
            }
            layer.enabled: getBtnMsn1Status()
            border.color: "#00000000"
            MouseArea {
                id: mouseAutMode1
                width: 125
                height: 45
            }

            Text {
                id: txtAutMode1
                x: 37
                y: 12
                width: 51
                height: 21
                color: "#000000"
                text: qsTr("#MSN01")
                font.bold: true
                font.family: textFont.name
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 13
                verticalAlignment: Text.AlignVCenter
                z: 2
            }
        }

        Rectangle {
            id: btnMsn4
            x: 201
            y: 100
            width: 125
            height: 45
            color: getBtnManStatus()
            radius: 10
            layer.effect: Glow {
                color: "#2dc2f0"
                samples: getManGlowMode()
                transparentBorder: true
            }
            layer.enabled: getBtnManStatus()
            border.width: 5
            border.color: "#00000000"
            Text {
                id: txtManualMode1
                x: 23
                y: 13
                width: 80
                height: 20
                color: "#000000"
                text: qsTr("#MSN02")
                font.bold: true
                font.family: textFont.name
                font.pointSize: 13
                z: 2
            }

            MouseArea {
                id: mouseManMode1
                width: 125
                height: 45
            }
        }

        Rectangle
        {
            id: btnMsn6
            x: 332
            y: 100
            width: 125
            height: 45
            color: getBtnManStatus()
            radius: 10
            layer.effect: Glow {
                color: "#2dc2f0"
                samples: getManGlowMode()
                transparentBorder: true
            }
            layer.enabled: getBtnManStatus()
            border.color: "#00000000"
            MouseArea {
                id: mouseAutMode2
                width: 125
                height: 45
            }

            Text {
                id: txtAutMode2
                x: 37
                y: 12
                width: 51
                height: 21
                color: "#000000"
                text: qsTr("#MSN04")
                font.bold: true
                font.family: textFont.name
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 13
                z: 2
            }
        }

        Rectangle {
            id: btnMsn5
            x: 332
            y: 49
            width: 125
            height: 45
            color: getBtnManStatus()
            radius: 10
            layer.effect: Glow {
                color: "#2dc2f0"
                samples: getManGlowMode()
                transparentBorder: true
            }
            layer.enabled: getBtnManStatus()
            border.width: 5
            border.color: "#00000000"
            Text {
                id: txtManualMode2
                x: 23
                y: 13
                width: 80
                height: 20
                color: "#000000"
                text: qsTr("#MSN03")
                font.bold: true
                font.family: textFont.name
                font.pointSize: 13
                z: 2
            }

            MouseArea {
                id: mouseManMode2
                width: 125
                height: 45
            }
        }


        }




    }// background image

}// window

