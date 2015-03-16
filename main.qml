import QtQuick 2.3
import QtQuick.Window 2.2
import Qt.labs.folderlistmodel 2.1

Window {
    visible: true
    width: 400
    height: 500

    ListView {
       anchors.fill: parent
       FolderListModel {
           id: folderList
           nameFilters: ["*"]
           folder: "file:///home/kuklin_m"
       }
       Component {
           id: fileDelegate
           Rectangle {
               id: fileItem
               height: 30
               width: parent.width
               color: "lightblue"
               Text {
                   text: fileName
                   anchors.verticalCenter: parent.verticalCenter
               }
              MouseArea {
                  anchors.fill: parent
                  hoverEnabled: true
                  onEntered: {
                      parent.color = "green"
                  }
                  onExited: {
                      parent.color = "lightblue"
                  }
              }
           }
       }
       model: folderList
       delegate: fileDelegate
    }
}
