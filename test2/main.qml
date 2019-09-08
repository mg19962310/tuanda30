import QtQuick 2.12
import QtQuick.Window 2.12
Window {
    property int name: 0
    visible: true
    width: 960
    height: 290
    title: qsTr("Hello World")
    ListModel{
        id:mymodel
        ListElement{name:"Head-Up Display";disable:true}
        ListElement{name:"Drive Assitance";disable:true}
        ListElement{name:"Drive Mode";disable:false}
        ListElement{name:"Climate";disable:true}
        ListElement{name:"Lights";disable:true}
        ListElement{name:"Door/Trunk";disable:true}
        ListElement{name:"Digital Key";disable:true}
        ListElement{name:"Convieniene";disable:true}
        ListElement{name:"Cluster";disable:true}
        ListElement{name:"Reset";disable:true}
        ListElement{name:"Seat/Steering Wheel";disable:true}
    }
    ListView{
        id:list
        model: mymodel
        width: 320
        height: parent.height
        spacing: 1
        delegate: Button{
            width: parent.width
            height: 50
            text: name
            enabled:disable
            selectHighlight:(list.currentIndex===index)? true:false
            textSize: 25
            onClicked: list.currentIndex = index
        }
    }
    Slider{
       id:slider
       anchors.left: list.right
       height: parent.height
       from: 0
       to:270
       value: list.contentY
    }
    ListView{
        id:list1
        model: myList
        width: 320
        anchors.left: list.right
        anchors.leftMargin: 10
        height: 240
        spacing: 1
        delegate: CheckButton{
            width: parent.width
            height: 50
            text: name
            enabled:disable
            checked: active
            selectHighlight:(list1.currentIndex===index)? true:false
            textSize: 25
            onClicked:{
                list1.currentIndex = index
                if(active==true) myList[index].setActive(false)
                else myList[index].setActive(true)
            }
        }
    }
    ListView{
        id:list2
        model: myList1
        width: 320
        anchors.left: list1.right
        anchors.leftMargin: 10
        height: 240
        spacing: 1
        delegate: RadioButton{
            width: parent.width
            height: 50
            text: name
            enabled:disable
            checked: (list2.currentIndex===index)? active:false
            selectHighlight:(list2.currentIndex===index)? true:false
            textSize: 25
            onClicked:{
                list2.currentIndex = index
                myList1[index].setActive(true)
            }
        }
    }
}
