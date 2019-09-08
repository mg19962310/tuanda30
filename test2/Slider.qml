import QtQuick 2.0

Item {
    property double to:1
    property double from:0
    property double value:from
    Rectangle{
        id:slider
        width: 5
        height: parent.height
        color: "silver"
        radius: 2
        Rectangle{
            id:dot
            y:{
               if(value>=from&&value<=to) return ((value-from)*(slider.height-50))/(to-from)
               if(value<from) return 0
               if(value>to) return slider.height-50
            }
            color: "black"
            width: parent.width
            height: 50
            MouseArea{
                anchors.fill: parent
                drag.target: dot
                drag.axis: Drag.YAxis
                drag.minimumY: 0
                drag.maximumY: slider.height-50
            }
        }
    }
}
