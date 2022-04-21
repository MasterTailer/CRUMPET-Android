/*
 *   Copyright 2020 Dan Leinir Turthra Jensen <admin@leinir.dk>
 *   This file based on sample code from Kirigami
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU Library General Public License as
 *   published by the Free Software Foundation; either version 3, or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU Library General Public License for more details
 *
 *   You should have received a copy of the GNU Library General Public License
 *   along with this program; if not, see <https://www.gnu.org/licenses/>
 */

import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.4 as QQC2
import org.kde.kirigami 2.13 as Kirigami

Kirigami.ScrollablePage {
    objectName: "earPoses";
    title: i18nc("Title for the page for selecting a pose for the EarGear", "Ear Poses");
    actions {
        main: Kirigami.Action {
            text: i18nc("Button for returning the EarGear to the home position, on the page for selecting a pose for the EarGear", "Home Position");
            icon.name: "go-home";
            onTriggered: {
                BTConnectionManager.sendMessage("TAILHM", []);
            }
        }
    }
    BaseMovesComponent {
        infoText: i18nc("Description for the page for selecting a pose for the EarGear", "The list below shows all the poses available to your gear. Tap any of them to send them off to any of your connected devices!");
        infoFooter: RowLayout {
            QQC2.Button {
                text: i18nc("Label for the button for setting EarGear moves to run more slowly", "Be Calm")
                Layout.fillWidth: true
                Layout.preferredWidth: Kirigami.Units.gridUnit * 10
                onClicked: {
                    BTConnectionManager.sendMessage("SPEED SLOW", []);
                }
            }
            QQC2.Button {
                text: i18nc("Label for the button for setting EarGear moves to run faster", "Be Excited")
                Layout.fillWidth: true
                Layout.preferredWidth: Kirigami.Units.gridUnit * 10
                onClicked: {
                    BTConnectionManager.sendMessage("SPEED FAST", []);
                }
            }
        }
        onCommandActivated: {
            CommandQueue.clear("");
            CommandQueue.pushCommand(command, destinations);
        }
        categoriesModel: [
            {
                name: i18nc("Heading for the list of poses, on the page for selecting a pose for the EarGear", "Poses"),
                category: "eargearposes",
                color: "#93cee9",
            }
        ]
    }
}
