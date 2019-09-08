#include "model.h"

model::model()
{

}
QHash<int, QByteArray> model::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[CheckedRole] = "checked";
    roles[DisableRole] = "disable";
    return roles;
}
QVariant model::data(const QModelIndex &index, int role) const
{
    if((index.row() >= this->listsong.length())||(index.row()<0)){
        return QVariant();
    }
    item *song = item[index.row()];
}
