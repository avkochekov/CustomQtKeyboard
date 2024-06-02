import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.VirtualKeyboard 2.14
import QtQuick.VirtualKeyboard.Settings 2.2
import QtQuick.VirtualKeyboard.Styles 2.15

Window {
    id: window
    visible: true
    width: 1920
    height: 1080
    title: qsTr("Hello World")

    component TE : Rectangle{
        property alias inputMethodHints: te.inputMethodHints
        height: 20;
        width: parent.width;
        border.width: 1;
        border.color: te.activeFocus ? "green" : "red";
        TextEdit{
            id: te
            anchors{
                fill: parent
                margins: 3
            }
        }
    }

    Flickable {
        width: parent.width
        height: inputPanel.y
        contentWidth: width
        contentHeight: col.height
        Column {
            id: col
            width: parent.width
            spacing: 2
            TE {
                inputMethodHints: Qt.ImhHiddenText
            }
            TE {
                inputMethodHints: Qt.ImhSensitiveData
            }
            TE {
                inputMethodHints: Qt.ImhNoAutoUppercase
            }
            TE {
                inputMethodHints: Qt.ImhPreferNumbers
            }
            TE {
                inputMethodHints: Qt.ImhPreferUppercase
            }
            TE {
                inputMethodHints: Qt.ImhPreferLowercase
            }
            TE {
                inputMethodHints: Qt.ImhNoPredictiveText
            }
            TE {
                inputMethodHints: Qt.ImhDate
            }
            TE {
                inputMethodHints: Qt.ImhTime
            }
            TE {
                inputMethodHints: Qt.ImhDate | Qt.ImhTime
            }
            TE {
                inputMethodHints: Qt.ImhDigitsOnly
            }
            TE {
                inputMethodHints: Qt.ImhFormattedNumbersOnly
            }
            TE {
                inputMethodHints: Qt.ImhUppercaseOnly
            }
            TE {
                inputMethodHints: Qt.ImhLowercaseOnly
            }
            TE {
                inputMethodHints: Qt.ImhDialableCharactersOnly
            }
            TE {
                inputMethodHints: Qt.ImhEmailCharactersOnly
            }
            TE {
                inputMethodHints: Qt.ImhUrlCharactersOnly
            }
            TE {
                inputMethodHints: Qt.ImhExclusiveInputMask
            }
        }
    }

    Rectangle {
        x: 0
        y: inputPanel.y
        z: inputPanel.z - 1
        width: parent.width
        height: inputPanel.height
        color: "#001F24"
    }

    InputPanel {
        id: inputPanel
        z: 99
        x: (window.width - width) / 2
        y: window.height
        width: 840*1.5
        states: State {
            name: "visible"
            when: inputPanel.active
            PropertyChanges {
                target: inputPanel
                y: window.height - inputPanel.height
            }
        }
        transitions: Transition {
            from: ""
            to: "visible"
            reversible: true
            ParallelAnimation {
                NumberAnimation {
                    properties: "y"
                    duration: 250
                    easing.type: Easing.InOutQuad
                }
            }
        }
    }
    Binding {
        target: VirtualKeyboardSettings
        property: "activeLocales"
        value: ["ru_RU", "en_US"]
    }
    Binding {
        target: VirtualKeyboardSettings
        property: "keyboardBackgroundColor"
        value: "black"
    }
    Binding {
        target: VirtualKeyboardSettings
        property: "locale"
        value: "ru_RU"
    }
}
