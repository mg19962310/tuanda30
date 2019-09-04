import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.0
Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    property int  index_r:-1
    property int indexDrop
    property real y_c
    property real tempY
    ListModel{
        id:myModel
        ListElement{name:"Tuan"}
        ListElement{name:"Tung"}
        ListElement{name:"Khang"}
        ListElement{name:"Thi"}
        ListElement{name:"Vu"}
    }
    ListView{
        id:listview
        width: 320
        height: parent.height
        model: myModel
        spacing: 1
        interactive: false
        delegate: Rectangle{
            id:rec
            height: 50
            z:-1
            width: parent.width
            border.width: 1
            onYChanged: {
               if(index_r==index) {
                   y_c  = rec.y
               }
            }
            Text {
                anchors.centerIn: parent
                text: name +":"+index
                font.pixelSize: 30
            }
            Loader{
                anchors.fill: parent
                sourceComponent: (index_r!=index)? droparea:undefined
            }
            Drag.active:dragArea.drag.active
            Drag.hotSpot.y:25
            Component{
                id:droparea
                DropArea{
                    onEntered: {
                        var y_up = rec.y - height/2
                        var y_down = rec.y + height/2
                        if(y_c <= y_up) {
                            indexDrop += 1
                            animation.to = rec.y - 51
                        }
                        if(y_c >= y_down) {
                            indexDrop -= 1
                            animation.to = rec.y + 51
                        }
                        animation.start()
                    }
                }
            }
            NumberAnimation{
                id:animation
                target:rec
                from:rec.y
                properties: "y"
                duration: 200
            }
            MouseArea{
                id:dragArea
                anchors.fill: parent
                drag.target: rec
                drag.axis:Drag.YAxis
                onPressed:{
                    index_r = index
                    indexDrop = index_r
                    tempY = rec.y
                    rec.z = 0
                }
                onReleased: {
                    if(index_r != indexDrop) listview.model.move(index_r,indexDrop,1)
                    else rec.y = tempY
                    index_r = -1
                    rec.z = -1
                }
            }
        }
    }
}
