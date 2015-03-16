import QtQuick 2.3
import QtQuick.Window 2.2
import Qt.labs.folderlistmodel 2.1

Window {
    visible: true
    width: 360
    height: 360

    Rectangle {
        id: main
        anchors.fill: parent

        ListView {
            width: 360
            height: 360
           FolderListModel {
               id: folderList
               nameFilters: ["*"]
               folder: "file:///home/kuklin_m"
           }
           Component {
               id: fileDelegate
               Text { text: fileName }
           }
           model: folderList
           delegate: fileDelegate
        }
        Text {
            id: lable
            text: folderList.count
            y: main.height - lable.height
        }
   }
}
