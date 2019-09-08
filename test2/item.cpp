#include "item.h"

bool item::active() const
{
    return _active;
}

void item::setActive(bool value)
{
    temp_active = value;
    timer.start(1500);
}
bool item::disable() const
{
    return _disable;
}

void item::setDisable(bool value)
{
    _disable = value;
}

void item::activation()
{
    _active = temp_active;
    emit activeChanged();
    timer.stop();
}

QString item::name() const
{
    return _name;
}

void item::setName(const QString &value)
{
    _name = value;
}

item::item(QString name)
{
    this->_name = name;
    connect(&timer,SIGNAL(timeout()),this,SLOT(activation()));
}
