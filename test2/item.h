#ifndef ITEM_H
#define ITEM_H
#include<QObject>
#include<QTimer>
#include<QDebug>
class item:public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool active READ active WRITE setActive NOTIFY activeChanged)
    Q_PROPERTY(bool disable READ disable WRITE setDisable NOTIFY disableChanged)
    Q_PROPERTY(QString name READ name)
private:
    bool _active = false;
    bool _disable = true;
    bool temp_active;
    QString _name;
    QTimer timer;
public:
    item(QString name);
    bool active() const;
    Q_INVOKABLE void setActive(bool value);
    bool disable() const;
    Q_INVOKABLE void setDisable(bool value);
    QString name() const;
    void setName(const QString &value);
signals:
    void activeChanged();
    void disableChanged();
public slots:
    void activation();
};

#endif // ITEM_H
