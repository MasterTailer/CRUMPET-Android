/*
 *   Copyright 2019 Ildar Gilmanov <gil.ildar@gmail.com>
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

import QtQuick
import QtQuick.Controls as QQC2
import org.kde.kirigami as Kirigami
import QtQuick.Layouts
import QtMultimedia

Kirigami.ScrollablePage {
    objectName: "developerModePage";
    title: i18nc("Header for the Developer Mode page", "Developer Mode");

    Column {
        width: root.width - Kirigami.Units.largeSpacing * 4;
        spacing: Kirigami.Units.largeSpacing;

        QQC2.Button {
            text: i18nc("Button with a sound effect for the Developer Mode Page", "MAX GLASH");

            Layout.fillWidth: true;

            MediaPlayer {
                id: playSound
                source: "qrc:/audio/Sparkle-sound-effect.mp3"
            }

            onClicked: {
                playSound.play()
            }
        }
    }
}
