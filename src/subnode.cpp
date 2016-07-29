    #include "subnode.h"  
      
    MyCounter::MyCounter(QObject *parent) : QObject(parent)  
    {  
        this->counter = 0;  
        engine = new QQmlApplicationEngine();  
        engine->rootContext()->setContextProperty("counter", counter);  
        engine->load(QUrl(QStringLiteral("qrc:/main.qml")));  
        timer = new QTimer(this);  
        QObject::connect(timer, SIGNAL(timeout()), this, SLOT(countUp()));  
    }  
      
    void MyCounter::strat()  
    {  
        timer->start(1000);  
    }  
      
    void MyCounter::countUp(void)  
    {  
        this->counter++;  
        engine->rootContext()->setContextProperty("counter", counter);  
    } 
