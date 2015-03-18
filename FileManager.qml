import QtQuick 2.0
import Qt.labs.folderlistmodel 2.1

ListView {
   anchors.fill: parent
   FolderListModel {
       id: folderList
       nameFilters: ["*"]
       showDirsFirst: true
       showDotAndDotDot : true
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
              onClicked: {
                  if (folderList.isFolder(index)) {
                      folderList.folder = folderList.get(index, "fileURL");
                  } else {
                      fileClicked(folderList.get(index, "fileURL"));
                  }
              }
          }
       }
   }
   model: folderList
   delegate: fileDelegate

   signal fileClicked (string fileURL)
}

