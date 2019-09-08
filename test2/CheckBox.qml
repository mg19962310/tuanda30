import QtQuick 2.0

Rectangle{
    id:rec
    property bool checked:false
    width:25
    height:25
    border.width: 2
    Image {
        id: img
        anchors.fill: parent
        source:(checked==true)? "check1.png":""
    }
}
