#include <QQuickImageProvider>
#include <QPixmap>
#include <opencv2/opencv.hpp>
#include "ros/ros.h"
#include <image_transport/image_transport.h>
#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/image_encodings.h>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>


cv_bridge::CvImageConstPtr cv_ptr;
cv::Mat mat;



namespace enc = sensor_msgs::image_encodings;
static const std::string ros_image = "Image from ROS";

class ColorImageProvider : public QQuickImageProvider
{
public:
    ColorImageProvider();
    ~ColorImageProvider();

    QPixmap requestPixmap(const QString &id, QSize *size, const QSize &requestedSize);

private:

};


class ImageConverter
{
  ros::NodeHandle nh_;
  image_transport::ImageTransport it_;
  image_transport::Subscriber image_sub_;
  image_transport::Publisher image_pub_;

public:
  ImageConverter()
    : it_(nh_)
  {
    // Subscrive to input video feed and publish output video feed
    image_sub_ = it_.subscribe("/image_raw", 1,&ImageConverter::imageCb, this);


    cv::namedWindow(ros_image);
  }

  ~ImageConverter()
  {
    cv::destroyWindow(ros_image);
  }


  void imageCb(const sensor_msgs::ImageConstPtr& msg)
  {
       //qDebug()<<"Image Call back";
       try
       {
         if (enc::isColor(msg->encoding))
           cv_ptr = cv_bridge::toCvShare(msg, enc::BGR8);
       }
       catch (cv_bridge::Exception& e)
       {
         ROS_ERROR("cv_bridge exception: %s", e.what());
         return;
       }
           mat = cv_ptr->image;

           // Update GUI Window
           cv::imshow(ros_image, cv_ptr->image);
           cv::waitKey(3);
           cv::destroyWindow(ros_image);
  }
};

ColorImageProvider::ColorImageProvider()
    : QQuickImageProvider(QQuickImageProvider::Pixmap)
{
}
ColorImageProvider::~ColorImageProvider()
{
}

QPixmap ColorImageProvider::requestPixmap(const QString &id, QSize *size, const QSize &requestedSize)
{
     cv::Mat img;
    if(mat.empty())
        img = cv::imread("/home/chot/Pictures/qt-logo.png",1);
    else
        img = mat;

        // resize
        *size = QSize(img.cols, img.rows);
        int width  = requestedSize.width()  > 0 ? requestedSize.width()  : img.rows;
        int height = requestedSize.height() > 0 ? requestedSize.height() : img.cols;
        cv::Mat resized_img(width, height, img.type());
        cv::resize(img, resized_img, resized_img.size(), cv::INTER_CUBIC);

        // BGR -> ARGB
        cv::cvtColor(resized_img, resized_img, CV_BGR2BGRA);
        std::vector<cv::Mat> bgra;
        cv::split(resized_img, bgra);
        std::swap(bgra[0], bgra[3]);
        std::swap(bgra[1], bgra[2]);

        QImage video_img(resized_img.data, resized_img.cols, resized_img.rows, QImage::Format_ARGB32);
        return QPixmap::fromImage(video_img);
}


