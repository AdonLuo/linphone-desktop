import QtQuick 2.7
import QtQuick.Layouts 1.3

import Common 1.0
import Linphone.Styles 1.0

// =============================================================================

Column {
  property alias model: view.model

  // ---------------------------------------------------------------------------
  // Header.
  // ---------------------------------------------------------------------------

  Row {
    anchors {
      left: parent.left
      leftMargin: CodecsViewerStyle.leftMargin
      right: parent.right
    }

    height: CodecsViewerStyle.legend.height
    spacing: CodecsViewerStyle.column.spacing

    CodecLegend {
      Layout.preferredWidth: CodecsViewerStyle.column.mimeWidth
      text: qsTr('codecMime')
    }

    CodecLegend {
      Layout.preferredWidth: CodecsViewerStyle.column.encoderDescriptionWidth
      text: qsTr('codecEncoderDescription')
    }

    CodecLegend {
      Layout.preferredWidth: CodecsViewerStyle.column.clockRateWidth
      text: qsTr('codecEncoderClockRate')
    }

    CodecLegend {
      Layout.preferredWidth: CodecsViewerStyle.column.bitrateWidth
      text: qsTr('codecBitrate')
    }

    CodecLegend {
      Layout.preferredWidth: CodecsViewerStyle.column.recvFmtpWidth
      text: qsTr('codecRecvFmtp')
    }

    CodecLegend {
      text: qsTr('codecStatus')
    }
  }

  // ---------------------------------------------------------------------------
  // Codecs.
  // ---------------------------------------------------------------------------

  ListView {
    id: view

    boundsBehavior: Flickable.StopAtBounds
    clip: true
    spacing: 0

    anchors {
      left: parent.left
      leftMargin: CodecsViewerStyle.leftMargin
      right: parent.right
    }

    height: count * CodecsViewerStyle.attribute.height

    delegate: Rectangle {
      color: 'transparent'

      height: CodecsViewerStyle.attribute.height
      width: parent.width

      RowLayout {
        anchors.fill: parent
        spacing: CodecsViewerStyle.column.spacing

        CodecAttribute {
          Layout.preferredWidth: CodecsViewerStyle.column.mimeWidth
          text: $codec.mime
        }

        CodecAttribute {
          Layout.preferredWidth: CodecsViewerStyle.column.encoderDescriptionWidth
          text: $codec.encoderDescription
        }

        CodecAttribute {
          Layout.preferredWidth: CodecsViewerStyle.column.clockRateWidth
          text: $codec.clockRate
        }

        CodecAttribute {
          Layout.preferredWidth: CodecsViewerStyle.column.bitrateWidth
          text: $codec.bitrate
        }

        TextField {
          Layout.preferredWidth: CodecsViewerStyle.column.recvFmtpWidth
          text: $codec.recvFmtp
        }

        Switch {
          checked: $codec.enabled

          onClicked: view.model.enableCodec(index, !checked)
        }
      }

      MouseArea {
        id: mouseArea

        anchors.fill: parent
      }
    }
  }
}