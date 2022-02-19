/*
 *   Copyright 2019 Dan Leinir Turthra Jensen <admin@leinir.dk>
 *   Copyright 2019 Ildar Gilmanov <gil.ildar@gmail.com>
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
import QtQuick.Controls 2.0

import org.kde.kirigami 2.13 as Kirigami
import org.thetailcompany.digitail 1.0

Column {
    id: batteryLayout
    enabled: visible;
    visible: height > 0;
    height: batteryRep.count * Kirigami.Units.iconSizes.small;
    Repeater {
        id: batteryRep;
        model: FilterProxyModel {
            id: deviceFilterProxy;
            sourceModel: DeviceModel;
            filterRole: 262; // the isConnected role
            filterBoolean: true;
        }
        Item {
            id: batteryDelegate
            height: Kirigami.Units.iconSizes.small + Kirigami.Units.smallSpacing * 3;
            width: batteryLayout.width
            property int batteryLevel: model.batteryLevel !== undefined ? model.batteryLevel : 0
            Label {
                id: batteryLabel;
                anchors {
                    top: parent.top;
                    bottom: parent.bottom;
                }
                width: paintedWidth
                verticalAlignment: Text.AlignVCenter
                text: typeof model.name !== "undefined" ? model.name : ""
            }
            Label {
                id: commandLabel;
                anchors {
                    left: batteryLabel.right;
                    leftMargin: Kirigami.Units.smallSpacing;
                    top: parent.top;
                    bottom: parent.bottom;
                }
                width: paintedWidth
                verticalAlignment: Text.AlignVCenter
                text: typeof model.activeCommandTitles !== "undefined" ? model.activeCommandTitles : ""
                opacity: text === "" ? 0 : 0.5
                Behavior on opacity { NumberAnimation { duration: Kirigami.Units.longDuration; } }
            }

            Rectangle {
                anchors.right: parent.right;
                height: Kirigami.Units.iconSizes.small + Kirigami.Units.smallSpacing * 2;
                width: Kirigami.Units.iconSizes.small * 4 + Kirigami.Units.smallSpacing * 5;
                color: "transparent";

                border {
                    width: 2;
                    color: batteryDelegate.batteryLevel <= 1 ? "red" : "black";
                }
                radius: Kirigami.Units.smallSpacing;
                Row {
                    spacing: Kirigami.Units.smallSpacing;
                    anchors {
                        fill: parent;
                        margins: Kirigami.Units.smallSpacing;
                    }

                    Repeater {
                        model: 4;

                        Rectangle {
                            visible: modelData < batteryDelegate.batteryLevel;
                            height: Kirigami.Units.iconSizes.small
                            width: height;
                            radius: Kirigami.Units.smallSpacing / 2;
                            color: batteryDelegate.batteryLevel <= 1 ? "red" : "black";
                        }
                    }
                }
                Rectangle {
                    anchors {
                        top: parent.top;
                        left: parent.right;
                        bottom: parent.bottom;
                        topMargin: parent.height / 3;
                        bottomMargin: parent.height / 3;
                    }
                    width: 2
                    color: batteryDelegate.batteryLevel <= 1 ? "red" : "black";
                }
            }
        }
    }
}
