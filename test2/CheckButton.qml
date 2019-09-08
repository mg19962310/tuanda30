import QtQuick 2.0
Button {
    id:checkbutton
    property bool checked
    CheckBox{
        id:checkbox
        anchors.left: parent.left
        anchors.leftMargin: 10
        checked: checkbutton.checked
        y:(parent.height-checkbox.width)/2
    }
}
