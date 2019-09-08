import QtQuick 2.0

Item {
    id:button
    property string text
    property int  textSize
    property bool selectHighlight: false
    signal clicked()
    Rectangle{
        id: rec
        anchors.fill: parent
        Image {
            id: img
            anchors.centerIn: parent
            width: (img.source=="qrc:/images.png")? parent.width-5:parent.width
            height: (img.source=="qrc:/images.png")? parent.height-5:parent.height
            source:{
               if(mouse.pressed===true&&enabled==true) return "images.png"
               if(selectHighlight==true&&enabled==true) return "woof.png"
               if(selectHighlight==false&&enabled==true) return ""
            }
            Rectangle{
               id:vien
               anchors.fill: parent
               border.width: (img.source=="qrc:/images.png")? 2:0
               color: "transparent"
            }
        }
        Text {
            text: button.text
            anchors.centerIn: parent
            color:(enabled==true)? "black":"silver"
            font.pixelSize: (img.source=="qrc:/images.png")? button.textSize-1:button.textSize
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }
    }
    MouseArea{
        id:mouse
        anchors.fill: parent
        onClicked:button.clicked()
    }
}
