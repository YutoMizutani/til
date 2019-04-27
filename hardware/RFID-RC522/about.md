## RFID-RC522

![](https://dotstud.io/img/blog/162/circuit1.png)

```ino
/*
 * --------------------------------------------------------------------------------------------------------------------
 * Example sketch/program showing how to read data from a PICC to serial.
 * --------------------------------------------------------------------------------------------------------------------
 * This is a MFRC522 library example; for further details and other examples see: https://github.com/miguelbalboa/rfid
 *
 * Example sketch/program showing how to read data from a PICC (that is: a RFID Tag or Card) using a MFRC522 based RFID
 * Reader on the Arduino SPI interface.
 *
 * When the Arduino and the MFRC522 module are connected (see the pin layout below), load this sketch into Arduino IDE
 * then verify/compile and upload it. To see the output: use Tools, Serial Monitor of the IDE (hit Ctrl+Shft+M). When
 * you present a PICC (that is: a RFID Tag or Card) at reading distance of the MFRC522 Reader/PCD, the serial output
 * will show the ID/UID, type and any data blocks it can read. Note: you may see "Timeout in communication" messages
 * when removing the PICC from reading distance too early.
 *
 * If your reader supports it, this sketch/program will read all the PICCs presented (that is: multiple tag reading).
 * So if you stack two or more PICCs on top of each other and present them to the reader, it will first output all
 * details of the first and then the next PICC. Note that this may take some time as all data blocks are dumped, so
 * keep the PICCs at reading distance until complete.
 *
 * @license Released into the public domain.
 *
 * Typical pin layout used:
 * -----------------------------------------------------------------------------------------
 *             MFRC522      Arduino       Arduino   Arduino    Arduino          Arduino
 *             Reader/PCD   Uno/101       Mega      Nano v3    Leonardo/Micro   Pro Micro
 * Signal      Pin          Pin           Pin       Pin        Pin              Pin
 * -----------------------------------------------------------------------------------------
 * RST/Reset   RST          9             5         D9         RESET/ICSP-5     RST
 * SPI SS      SDA(SS)      10            53        D10        10               10
 * SPI MOSI    MOSI         11 / ICSP-4   51        D11        ICSP-4           16
 * SPI MISO    MISO         12 / ICSP-1   50        D12        ICSP-1           14
 * SPI SCK     SCK          13 / ICSP-3   52        D13        ICSP-3           15
 */

#include <SPI.h>
#include <MFRC522.h>

#define RST_PIN         9          // Configurable, see typical pin layout above
#define SS_PIN          10         // Configurable, see typical pin layout above

MFRC522 mfrc522(SS_PIN, RST_PIN);  // Create MFRC522 instance

void setup() {
	Serial.begin(9600);		// Initialize serial communications with the PC
	while (!Serial);		// Do nothing if no serial port is opened (added for Arduinos based on ATMEGA32U4)
	SPI.begin();			// Init SPI bus
	mfrc522.PCD_Init();		// Init MFRC522
	mfrc522.PCD_DumpVersionToSerial();	// Show details of PCD - MFRC522 Card Reader details
	Serial.println(F("Scan PICC to see UID, SAK, type, and data blocks..."));
}

void loop() {
	// Reset the loop if no new card present on the sensor/reader. This saves the entire process when idle.
	if ( ! mfrc522.PICC_IsNewCardPresent()) {
		return;
	}

	// Select one of the cards
	if ( ! mfrc522.PICC_ReadCardSerial()) {
		return;
	}

	// Dump debug info about the card; PICC_HaltA() is automatically called
	mfrc522.PICC_DumpToSerial(&(mfrc522.uid));
}
```

```ino
#include <MFRC522.h>

const uint8_t RST_PIN = 9;  //リセットピン定義
const uint8_t SS_PIN = 10;  //SPI通信のスレーブセレクトピン定義

MFRC522 mfrc522(SS_PIN,RST_PIN);  //MFRC522クラスの実体(オブジェクト)を作成

byte uid[4] = {0x0B, 0x5D, 0x47, 0x0C};  //比較したいuid

void setup()
{
    Serial.begin(9600);  //シリアルバンドを9600に設定
    SPI.begin();  //SPIホスト初期化
    mfrc522.PCD_Init();  //MFRCチップを初期化
    mfrc522.PCD_DumpVersionToSerial();  //カードのバージョンをシリアルアウト
}

void loop()
{
    if (mfrc522.PICC_IsNewCardPresent() == false) {  //新しいカードが感知されるまで待機
        return;
    }

    if (mfrc522.PICC_ReadCardSerial() == false) {  //カードが読み取られるまで待機
        return;
    }

     if (mfrc522.uid.uidByte[0] == uid[0] && //それぞれ読んだカードの値と比較したい16進数の値を比較
     mfrc522.uid.uidByte[1] == uid[1] &&
    mfrc522.uid.uidByte[2] == uid[2] &&
     mfrc522.uid.uidByte[3] == uid[3] ) {
     Serial.println("This card is Corret!");  //全て一致したら、正しいカードとシリアル表示
}
else {
    Serial.println("This card is NOT Corret!");  //一致しなければ、誤ったカードとシリアル表示
}

}
```

[RFID-RC522 をArduinoで使い複数のタグを区別](https://teratail.com/questions/161696)
[Arduinoで近距離無線通信 RFID-RC522 NFC](https://bokunimo.net/arduino/rfid.html)
[rfid/examples/DumpInfo/DumpInfo.ino](https://github.com/miguelbalboa/rfid/blob/master/examples/DumpInfo/DumpInfo.ino)
[miguelbalboa/rfid](https://github.com/miguelbalboa/rfid)
[非接触ICタグで遊ぼう！ArduinoでRFIDリーダRC522を使う方法](https://dotstud.io/blog/arduino-use-rfid-reader/)
[Arduinoで近距離無線通信 RFID-RC522 NFC](https://bokunimo.net/arduino/rfid.html)
