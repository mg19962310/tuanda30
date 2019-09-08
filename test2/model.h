#ifndef MODEL_H
#define MODEL_H
#include<QObject>
#include<QAbstractListModel>
#include<item.h>
class model:public QAbstractListModel
{
    Q_OBJECT
private:
    QList<item*> list;
public:
    enum ButtonRoles {
        CheckedRole = Qt::UserRole + 1,
        DisableRole,
    };
    model();
    int rowCount(const QModelIndex & parent = QModelIndex()) const;
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;
protected:
    QHash<int, QByteArray> roleNames() const;
};

#endif // MODEL_H
