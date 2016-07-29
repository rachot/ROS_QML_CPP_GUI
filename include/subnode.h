#include <QObject>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QTimer>
#include <QtQuick/QQuickView>
#include <QPixmap>

class RescueRobotTeleOp : public QObject
{
Q_OBJECT
public:
    explicit RescueRobotTeleOp(QObject *parent = 0);
    void timeSet(void);
private:
    int counter;
    QQmlApplicationEngine *engine;
    QQuickView *view;
    QTimer *timer;
    QObject *GetDataobj;

signals:

public slots:
    void updataDat(void);

};
