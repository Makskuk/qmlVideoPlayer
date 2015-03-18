import QtQuick 2.3
import QtQuick.Window 2.2
import QtMultimedia 5.0

Window {
    visible: true
    width: 400
    height: 500

    Rectangle {
        id: fileBtn
        width: 80
        height: 40
        radius: 20
        color: "lightblue"
        Text {
            text: qsTr("File")
            anchors.centerIn: parent
        }
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: { parent.color = "blue" }
            onExited: { parent.color = "lightblue" }
            onClicked: { fileManager.visible = true; fileBtn.visible = false }
        }
    }

    Rectangle {
        width: parent.width
        height: parent.height - fileBtn.height
        anchors.bottom: parent.bottom
        color: "black"

        MediaPlayer {
                id: player
                source: ""
                autoPlay: true
            }

            VideoOutput {
                id: videoOutput
                source: player
                anchors.fill: parent
            }
    }

    FileManager {
        id: fileManager
        visible: false
        onFileClicked: {
            player.source = fileURL;
            this.visible = false;
            fileBtn.visible = true;
        }
    }
}
