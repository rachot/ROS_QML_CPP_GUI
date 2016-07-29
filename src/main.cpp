#include "ros/ros.h"
#include "string"
#include "std_msgs/String.h"
#include "std_msgs/Float32.h"
#include "std_msgs/Int16.h"
#include "std_msgs/Int16MultiArray.h"

#include "subnode.h"
#include "camera.h"
#include "rescue_gui.h"

#include <sstream>
#include <iostream>

#include <QtGui>
#include <QGuiApplication>
#include <QApplication>
#include <QtQml>
#include <QQuickView>
#include <QObject>
#include <QQuickItem>
#include <QThread>
#include <QtCore>
#include <QWidget>

#include <QQmlApplicationEngine>

#include <image_transport/image_transport.h>
#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/image_encodings.h>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>

#include <QQuickImageProvider>

#include <boost/format.hpp>
#include <boost/thread.hpp>
#include <boost/filesystem.hpp>


#include <QQmlEngine>
#include <QQmlComponent>
#include <QQmlProperty>


float victim_temp=0;
int co2=0;
int pose_robot[15];
int motor_spd[2];
int motor_spdSet[2];
int counter_min=0;



void RescueRobotTeleOp::timeSet()
{
    timer->start(10); // 10 mS
}


void RescueRobotTeleOp::updataDat(void)
{
    engine->rootContext()->setContextProperty("victemp", victim_temp);
    engine->rootContext()->setContextProperty("Co2", co2);

    engine->rootContext()->setContextProperty("BodyRoll", pose_robot[0]);
    engine->rootContext()->setContextProperty("BodyPitch", pose_robot[1]);
    engine->rootContext()->setContextProperty("BodyYaw", pose_robot[2]);
    engine->rootContext()->setContextProperty("FLangle", pose_robot[3]);
    engine->rootContext()->setContextProperty("FRangle", pose_robot[4]);
    engine->rootContext()->setContextProperty("BLangle", pose_robot[5]);
    engine->rootContext()->setContextProperty("BRangle", pose_robot[6]);
    engine->rootContext()->setContextProperty("J1angle", pose_robot[7]);
    engine->rootContext()->setContextProperty("J2angle", pose_robot[8]);
    engine->rootContext()->setContextProperty("J3angle", pose_robot[9]);
    engine->rootContext()->setContextProperty("J4angle", pose_robot[10]);
    engine->rootContext()->setContextProperty("HokuyoRoll", pose_robot[11]);
    engine->rootContext()->setContextProperty("HokuyoPitch", pose_robot[12]);
    engine->rootContext()->setContextProperty("HokuyoYaw", pose_robot[13]);

    engine->rootContext()->setContextProperty("MLSpeed", motor_spd[0]);
    engine->rootContext()->setContextProperty("MRSpeed", motor_spd[1]);

     motor_spdSet[0] = QQmlProperty::read(GetDataobj, "mlspeed").toInt();
     motor_spdSet[1] = QQmlProperty::read(GetDataobj, "mrspeed").toInt();

     //qDebug() << "ML : "<< motor_spdSet[0] <<  " MR : "<< motor_spdSet[1];
}


RescueRobotTeleOp::RescueRobotTeleOp(QObject *parent) : QObject(parent)
{

    engine = new QQmlApplicationEngine();
    engine->addImageProvider(QLatin1String("videocapture"), new ColorImageProvider);
    //engine->load(QUrl(QStringLiteral("/home/chot/catkin_ws/src/testqt5_create/qml/main.qml")));

    QQmlComponent component(engine, "/home/chot/catkin_ws/src/testqt5_create/qml/main.qml");
    GetDataobj = component.create();


    timer = new QTimer(this);
    QObject::connect(timer, SIGNAL(timeout()), this, SLOT(updataDat()));

}

void TempVictim_Callback(const std_msgs::Float32::ConstPtr& msg)
{
    //qDebug()<<"temp : " << msg->data;
    victim_temp = msg->data;

}

void cO2_Callback(const std_msgs::Int16::ConstPtr& msg)
{
    //qDebug()<<"CO2 : " << msg->data;
    co2 = msg->data;

}

void pose_Callback(const std_msgs::Int16MultiArray::ConstPtr& msg)
{
    pose_robot[0] = msg->data[0];
    pose_robot[1] = msg->data[1];
    pose_robot[2] = msg->data[2];
    pose_robot[3] = msg->data[3];
    pose_robot[4] = msg->data[4];
    pose_robot[5] = msg->data[5];
    pose_robot[6] = msg->data[6];
    pose_robot[7] = msg->data[7];
    pose_robot[8] = msg->data[8];
    pose_robot[9] = msg->data[9];
    pose_robot[10] = msg->data[10];
    pose_robot[11] = msg->data[11];
    pose_robot[12] = msg->data[12];
    pose_robot[13] = msg->data[13];

}

void spd_Callback(const std_msgs::Int16MultiArray::ConstPtr& msg) // Actual Speed
{
    motor_spd[0] = msg->data[0];
    motor_spd[1] = msg->data[1];
}

class ROSThread : public QThread
{
     ros::NodeHandle n;
     ros::Publisher speed_pub = n.advertise<std_msgs::Int16MultiArray>("motor_speedSet", 1);
     ros::Subscriber temp_sub = n.subscribe("temper", 1, TempVictim_Callback);
     ros::Subscriber co2_sub = n.subscribe("co2", 1, cO2_Callback);
     ros::Subscriber pos_sub = n.subscribe("pose_robot", 1, pose_Callback);
     ros::Subscriber spd_sub = n.subscribe("motor_speed", 1, spd_Callback);


private:

    void run()
    {
         ros::Rate loop_rate(25);  // Hz
        //qDebug()<<"From worker ROS Thread: "<<currentThreadId();
         std_msgs::Int16MultiArray motor_spdMsg;
        while(ros::ok())
        {
            motor_spdMsg.data.clear();

           motor_spdMsg.data.push_back(motor_spdSet[0]);
           motor_spdMsg.data.push_back(motor_spdSet[1]);

           speed_pub.publish(motor_spdMsg);



            loop_rate.sleep();
        }
    }
};



int main(int argc, char **argv)
{
    QGuiApplication app(argc, argv);
    ros::init(argc,argv,"rescuerobot_gui");

    ROSThread rosThread;
    rosThread.start();

    RescueRobotTeleOp *rescueBot = new RescueRobotTeleOp();
    rescueBot->timeSet();


    ImageConverter ic;
    ros::spin();

    return app.exec();
}

