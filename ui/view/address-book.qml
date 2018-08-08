import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.0
import QtQuick.Controls.Styles 1.2
import "controls"

ColumnLayout {
    id: addressRoot
    width: 800
    height: 600
    anchors.fill: parent
    state: "own"
	SFText {
        Layout.minimumHeight: 40
        Layout.maximumHeight: 40
        font.pixelSize: 36
        color: Style.white
        text: qsTr("Address book")
    }

	Dialog {
		id: createAddress
		modal: true
		width: 520
		height: 454
		x: (parent.width - width) / 2
		y: (parent.height - height) / 2
		visible: false
		focus: true
		background: null

		Rectangle {
			radius: 10
            color: Style.dark_slate_blue

            anchors.fill: parent

			ColumnLayout {
				id: createAddressLayout
				anchors.fill: parent
				anchors.margins: 30
				state: "own"

				Item {
					Layout.minimumHeight: 21
					Layout.maximumHeight: 21
					Layout.fillWidth: true;

					SFText {
						anchors.centerIn: parent
						font {
							pixelSize: 18
							weight: Font.Bold
						}
						color: Style.white
						text: qsTr("Create new address")
					}
				}

				Item {
					Layout.topMargin: 30
					Layout.fillWidth: true
					Layout.minimumHeight: 14
					Layout.maximumHeight: 14

					RowLayout {
						anchors.centerIn: parent
						Layout.minimumHeight: 14
						Layout.maximumHeight: 14
					
						TxFilter{
							id: ownFilterDlg
							label: qsTr("OWN ADDRESSES")
							onClicked: createAddressLayout.state = "own"
						}

						TxFilter{
							id: peersFilterDlg
							Layout.leftMargin: 40
							label: qsTr("PEERS ADDRESSES")
							onClicked: createAddressLayout.state = "peers"
						}
					}
				}

				ColumnLayout {
					id: createPeersAddressView
					Layout.fillWidth: true
					Layout.fillHeight: true
					Layout.topMargin: 30
					visible: false
					
					ColumnLayout {
						Layout.fillWidth: true
						Layout.fillHeight: true

						SFText {
							text: qsTr("Address ID")
							Layout.fillWidth: true
							font {
								pixelSize: 12
								weight: Font.Bold
							}
							color: Style.white
						}

						SFTextInput {
							id: addressID
							Layout.fillWidth: true
							Layout.minimumHeight: 14
							Layout.maximumHeight: 14
							font.pixelSize: 12
							color: Style.white
							text: addressBookViewModel.newPeerAddress.walletID
						}

						Binding {
							target: addressBookViewModel.newPeerAddress
							property: "walletID"
							value: addressID.text
						}

						Rectangle {
							Layout.fillWidth: true
							height: 1

							color: Style.separator_color
						}
					}

					ColumnLayout {
						Layout.fillWidth: true
						Layout.fillHeight: true
						Layout.topMargin: 30
						SFText {
							Layout.fillWidth: true
							Layout.fillHeight: true
							text: qsTr("Name")
							font {
								pixelSize: 12
								weight: Font.Bold
							}
							color: Style.white
						}
						SFTextInput {
							Layout.fillWidth: true
							Layout.fillHeight: true
							id: nameAddress
							font.pixelSize: 12
							color: Style.white
							height: 14
							text: addressBookViewModel.newPeerAddress.name
						}
						Binding {
							target: addressBookViewModel.newPeerAddress
							property: "name"
							value: nameAddress.text
						}
						Rectangle {
							Layout.fillWidth: true
							height: 1

							color: Style.separator_color
						}
					}

					ColumnLayout {
						Layout.fillWidth: true
						Layout.fillHeight: true
						Layout.topMargin: 30
						SFText {
							Layout.fillWidth: true
							Layout.fillHeight: true
							text: qsTr("Category")
							font {
								pixelSize: 12
								weight: Font.Bold
							}
							color: Style.white
						}
						SFTextInput {
							Layout.fillWidth: true
							Layout.fillHeight: true
							id: categoryAddress
							font.pixelSize: 12
							color: Style.white
							height: 14
							text: addressBookViewModel.newPeerAddress.category
						}
						Binding {
							target: addressBookViewModel.newPeerAddress
							property: "category"
							value: categoryAddress.text
						}
						Rectangle {
							Layout.fillWidth: true
							height: 1

							color: Style.separator_color
						}
					}
				}

				ColumnLayout {
					id: createOwnAddressView
					Layout.fillWidth: true
					Layout.fillHeight: true
					Layout.topMargin: 30
					visible: false

					ColumnLayout {
						Layout.fillWidth: true

						SFText {
							text: qsTr("Address ID")
							Layout.fillWidth: true
							font {
								pixelSize: 12
								weight: Font.Bold
							}
							color: Style.white
						}

						SFTextInput {
							id: ownAddressID
							Layout.fillWidth: true
							font.pixelSize: 12
							color: Style.disable_text_color
							readOnly: true
							text: addressBookViewModel.newOwnAddress.walletID
						}
					}

					ColumnLayout {
						Layout.fillWidth: true
						Layout.topMargin: 30
						SFText {
							Layout.fillWidth: true
							text: qsTr("Name")
							font {
								pixelSize: 12
								weight: Font.Bold
							}
							color: Style.white
						}
						SFTextInput {
							Layout.fillWidth: true
							id: nameOwnAddress
							font.pixelSize: 12
							color: Style.white
							height: 14
							text: addressBookViewModel.newOwnAddress.name
						}
						Binding {
							target: addressBookViewModel.newOwnAddress
							property: "name"
							value: nameOwnAddress.text
						}
						Rectangle {
							Layout.fillWidth: true
							height: 1
							color: Style.separator_color
						}
					}

					RowLayout {
						Layout.fillWidth: true
						Layout.topMargin: 30
						
						SFText {
							Layout.leftMargin: 22
							text: qsTr("Expiration date")
							font {
								pixelSize: 12
								weight: Font.Bold
							}
							color: Style.white
						}
												
						SFText {
							Layout.leftMargin: 61
							text: "o"
							font.pixelSize: 9
						}


						SFText {
							Layout.leftMargin: 13
							text: qsTr("Single use")
							font {
								pixelSize: 12
								weight: Font.Bold
							}
							color: Style.white
						}

						SFText {
						
						}
					}

					ColumnLayout {
						Layout.fillWidth: true
						Layout.topMargin: 30
						SFText {
							Layout.fillWidth: true
							text: qsTr("Category")
							font {
								pixelSize: 12
								weight: Font.Bold
							}
							color: Style.white
						}

						SFTextInput {
							Layout.fillWidth: true
							id: categoryOwnAddress
							font.pixelSize: 12
							color: Style.white
							height: 14
							text: addressBookViewModel.newOwnAddress.category
						}
						Binding {
							target: addressBookViewModel.newOwnAddress
							property: "category"
							value: categoryOwnAddress.text
						}

						Rectangle {
							Layout.fillWidth: true
							height: 1

							color: Style.separator_color
						}
					}
				}

				Item {
					Layout.fillWidth: true
					Layout.minimumHeight: 38
					Layout.maximumHeight: 38
					Layout.topMargin: 30

					RowLayout {
						Layout.minimumHeight: 38
						Layout.maximumHeight: 38
						anchors.centerIn: parent
						
						Rectangle {
							radius: 50
							color: Style.separator_color
							width: 122
							height: 38

							SFText {
								anchors.verticalCenter: parent.verticalCenter
								anchors.horizontalCenter: parent.horizontalCenter

								font.pixelSize: 14
								font.weight: Font.Bold

								color: Style.white

								text: qsTr("cancel")
							}

							MouseArea{
								anchors.fill: parent
								cursorShape: Qt.PointingHandCursor
								onClicked: {
									createAddress.close()
								}
							}
						}

						Rectangle {
							radius: 50
							color: Style.bright_teal
							Layout.leftMargin: 31
							width: 166
							height: 38

							SFText {
								anchors.verticalCenter: parent.verticalCenter
								anchors.horizontalCenter: parent.horizontalCenter

								font.pixelSize: 14
								font.weight: Font.Bold
								color: Style.marine

								text: qsTr("create address")
							}

							MouseArea{
								anchors.fill: parent
								cursorShape: Qt.PointingHandCursor
								onClicked: {
									if (createAddressLayout.state == "own") {
										addressBookViewModel.createNewOwnAddress();
									} else {
										addressBookViewModel.createNewPeerAddress();
									}
									createAddress.close();
								}
							}
						}
					}
				}

				states: [
					State {
						name: "own"
						PropertyChanges {target: ownFilterDlg; state: "active"}
						PropertyChanges {
							target: createOwnAddressView
							visible: true							
						}

						PropertyChanges {
							target: createAddress
							height: 493
						}

						PropertyChanges {
							target: createPeersAddressView
							visible: false
						}
					},
					State {
						name: "peers"
						PropertyChanges {target: peersFilterDlg; state: "active"}

						PropertyChanges {
							target: createOwnAddressView
							visible: false
						}

						PropertyChanges {
							target: createAddress
							height: 454
						}

						PropertyChanges {
							target: createPeersAddressView
							visible: true
						}
					}
				]
			}
		}		
	}

    RowLayout {
        Layout.fillWidth: true
        Layout.minimumHeight: 40
        Layout.maximumHeight: 40
        spacing: 40
        TxFilter{
            id: ownFilter
            Layout.leftMargin: 20
            label: qsTr("OWN ADDRESSES")
            onClicked: addressRoot.state = "own"
        }

        TxFilter{
            id: peersFilter
            label: qsTr("PEERS ADDRESSES")
            onClicked: addressRoot.state = "peers"
        }

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Button {
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                text: "+ create new address"
				onClicked: {
					addressBookViewModel.generateNewEmptyAddress()
					createAddressLayout.state = addressRoot.state
					createAddress.open();
				}
            }
        }
    }

    Item {
        Layout.fillWidth: true
        Layout.fillHeight: true

        TableView {
            id: peersView
            anchors.fill: parent

            frameVisible: false
            selectionMode: SelectionMode.SingleSelection
            backgroundVisible: false
            model: addressBookViewModel.peerAddresses
            visible: false

            TableViewColumn {
                role: "walletID"
                title: qsTr("Address ID")
                width: 300

                movable: false
            }

            TableViewColumn {
                role: "name"
                title: qsTr("Name")
                width: 200

                movable: false
            }

            TableViewColumn {
                role: "category"
                title: qsTr("Category")
                movable: false
            }

            headerDelegate: Rectangle {
                height: 46

                color: Style.dark_slate_blue

                Text {
                    anchors.verticalCenter: parent.verticalCenter
					anchors.left: parent.left
                    anchors.leftMargin: 20
                    font.pixelSize: 12
                    color: Style.bluey_grey

                    text: styleData.value
                }
            }

            ContextMenu {
                id: peersContextMenu
                property int peerIndex;
                MenuItem {
                    text: qsTr('Send to...')
                    onTriggered: {
                        var peerAddress = addressBookViewModel.getPeerAddress(peersContextMenu.peerInde);
                        main.updateItem(1);
                    }
                }
            }

            rowDelegate: Item {

                height: 69

                anchors.left: parent.left
                anchors.right: parent.right

                Rectangle {
                    anchors.fill: parent

                    color: Style.light_navy
                    visible: styleData.alternate
                }

                MouseArea {
                    anchors.fill: parent
                    acceptedButtons: Qt.RightButton
                    onClicked: {
                        if (mouse.button === Qt.RightButton && styleData.row !== undefined)
                        {
                            peersContextMenu.peerIndex = styleData.row;
                            peersContextMenu.popup();
                        }
                    }
                }

            }

            itemDelegate: TableItem {
                text: styleData.value
            }
        }

		TableView {
            id: ownAddressesView
            anchors.fill: parent

            frameVisible: false
            selectionMode: SelectionMode.SingleSelection
            backgroundVisible: false
            model: addressBookViewModel.ownAddresses

            TableViewColumn {
                role: "walletID"
                title: qsTr("Address ID")
                width: 300

                movable: false
            }

            TableViewColumn {
                role: "name"
                title: qsTr("Name")
                width: 200

                movable: false
            }

            TableViewColumn {
                role: "category"
                title: qsTr("Category")
                movable: false
            }

            TableViewColumn {
                role: "expirationDate"
                title: qsTr("Expiration date")
                movable: false
            }

            TableViewColumn {
                role: "createDate"
                title: qsTr("Created")
                movable: false
            }


            headerDelegate: Rectangle {
                height: 46

                color: Style.dark_slate_blue

                Text {
                    anchors.verticalCenter: parent.verticalCenter
					anchors.left: parent.left
                    anchors.leftMargin: 20
                    font.pixelSize: 12
                    color: Style.bluey_grey

                    text: styleData.value
                }
            }

            rowDelegate: Item {

                height: 69

                anchors.left: parent.left
                anchors.right: parent.right

                Rectangle {
                    anchors.fill: parent

                    color: Style.light_navy
                    visible: styleData.alternate
                }
            }

            itemDelegate: TableItem {
                text: styleData.value
            }
        }
    }

    states: [
        State {
            name: "own"
            PropertyChanges {target: ownFilter; state: "active"}
            PropertyChanges {
                target: ownAddressesView
                visible: true
            }

            PropertyChanges {
                target: peersView
                visible: false
            }
        },
        State {
            name: "peers"
            PropertyChanges {target: peersFilter; state: "active"}

            PropertyChanges {
                target: ownAddressesView
                visible: false
            }

            PropertyChanges {
                target: peersView
                visible: true
            }
        }
    ]

}