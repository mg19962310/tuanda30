import QtQuick 2.0

Item {
    id:button
    property alias source: img.source
    signal clicked()
    Rectangle{
        id: rec
        width: parent.width
        height: parent.height
        Image {
            id: img
            anchors.fill:parent
        }
        MouseArea{
            anchors.fill: parent
            onClicked: button.clicked()
        }
    }
}
