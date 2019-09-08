#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDebug>
#include<QQmlContext>
#include<item.h>
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,&app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    QList<QObject*> list;
    list.append(new item("ECO HELLO"));
    list.append(new item("Sport"));
    list.append(new item("Comfort"));
    QList<QObject*> list1;
    list1.append(new item("BATMAN HELLO"));
    list1.append(new item("Sport"));
    list1.append(new item("Comfort"));
    engine.rootContext()->setContextProperty("myList",QVariant::fromValue(list));
    engine.rootContext()->setContextProperty("myList1",QVariant::fromValue(list1));
    engine.load(url);
    return app.exec();
}
