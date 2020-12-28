/* Haptics Micro-controller Library
 * UHH HCI 2015 -->> HapRing
 * ariza@informatik.uni-hamburg.de
 */

#ifndef __HCI_HAPTICS_SERVICE_H__
#define __HCI_HAPTICS_SERVICE_H__

Serial pc(USBTX, USBRX);
DigitalOut led1(LED1);

#include "BLEDevice.h"
#include "GattAttribute.h"
#include "TindieIMUHelper.h"

#include "DRV2605.h"

PwmOut     out1(D2);
DigitalOut irLed(D3);
DigitalIn  joystickUp(D5);
DigitalIn  joystickLeft(A5);
DigitalIn  joystickDown(D6);
DigitalIn  joystickRight(D4);
DigitalIn  joystickButton(D7);

Adafruit_DRV2605 drv(pc);

class HCIHapticServiceService 
{
public:
    uint16_t handleC1;
    uint16_t handleCLed;
    uint16_t handleCIMU;
    
    HCIHapticServiceService
    (
        BLEDevice  &_ble,
        const char *manufacturersName = NULL,
        const char *modelNumber       = NULL,
        const char *serialNumber      = NULL,
        const char *hardwareRevision  = NULL,
        const char *firmwareRevision  = NULL,
        const char *softwareRevision  = NULL
    )   :
        ble(_ble),
        manufacturersNameStringCharacteristic
        (
            GattCharacteristic::UUID_MANUFACTURER_NAME_STRING_CHAR,
            (uint8_t *)manufacturersName,
            (manufacturersName != NULL) ? strlen(manufacturersName) : 0, /* minLength */
            (manufacturersName != NULL) ? strlen(manufacturersName) : 0, /* maxLength */
            GattCharacteristic::BLE_GATT_CHAR_PROPERTIES_READ
        ),
        modelNumberStringCharacteristic
        (
            GattCharacteristic::UUID_MODEL_NUMBER_STRING_CHAR,
            (uint8_t *)modelNumber,
            (modelNumber != NULL) ? strlen(modelNumber) : 0, /* minLength */
            (modelNumber != NULL) ? strlen(modelNumber) : 0, /* maxLength */
            GattCharacteristic::BLE_GATT_CHAR_PROPERTIES_READ
        ),
        serialNumberStringCharacteristic
        (
            GattCharacteristic::UUID_SERIAL_NUMBER_STRING_CHAR,
            (uint8_t *)serialNumber,
            (serialNumber != NULL) ? strlen(serialNumber) : 0, /* minLength */
            (serialNumber != NULL) ? strlen(serialNumber) : 0, /* maxLength */
            GattCharacteristic::BLE_GATT_CHAR_PROPERTIES_READ
        ),
        hardwareRevisionStringCharacteristic
        (
            GattCharacteristic::UUID_HARDWARE_REVISION_STRING_CHAR,
            (uint8_t *)hardwareRevision,
            (hardwareRevision != NULL) ? strlen(hardwareRevision) : 0, /* minLength */
            (hardwareRevision != NULL) ? strlen(hardwareRevision) : 0, /* maxLength */
            GattCharacteristic::BLE_GATT_CHAR_PROPERTIES_READ
        ),
        firmwareRevisionStringCharacteristic
        (
            GattCharacteristic::UUID_FIRMWARE_REVISION_STRING_CHAR,
            (uint8_t *)firmwareRevision,
            (firmwareRevision != NULL) ? strlen(firmwareRevision) : 0, /* minLength */
            (firmwareRevision != NULL) ? strlen(firmwareRevision) : 0, /* maxLength */
            GattCharacteristic::BLE_GATT_CHAR_PROPERTIES_READ
        ),
        softwareRevisionStringCharacteristic
        (
            GattCharacteristic::UUID_SOFTWARE_REVISION_STRING_CHAR,
            (uint8_t *)softwareRevision,
            (softwareRevision != NULL) ? strlen(softwareRevision) : 0, /* minLength */
            (softwareRevision != NULL) ? strlen(softwareRevision) : 0, /* maxLength */
            GattCharacteristic::BLE_GATT_CHAR_PROPERTIES_READ
        ),

        WritableCharValue1(0),
        WritableChar1
        (
            0xFFFB, 
            (uint8_t *)&WritableCharValue1,
            sizeof(WritableCharValue1), 
            sizeof(WritableCharValue1), 
            GattCharacteristic::BLE_GATT_CHAR_PROPERTIES_WRITE_WITHOUT_RESPONSE | GattCharacteristic::BLE_GATT_CHAR_PROPERTIES_WRITE
        ),
        WritableCharValueLed(0),
        WritableCharLed
        (
            0xFFFC, 
            (uint8_t *)&WritableCharValueLed,
            sizeof(WritableCharValueLed), 
            sizeof(WritableCharValueLed), 
            GattCharacteristic::BLE_GATT_CHAR_PROPERTIES_WRITE_WITHOUT_RESPONSE | GattCharacteristic::BLE_GATT_CHAR_PROPERTIES_WRITE
        ),
        WritableCharValueIMUStatus(0),
        WritableCharIMUStatus
        (
            0xFFFD, 
            (uint8_t *)&WritableCharValueIMUStatus,
            sizeof(WritableCharValueIMUStatus), 
            sizeof(WritableCharValueIMUStatus), 
            GattCharacteristic::BLE_GATT_CHAR_PROPERTIES_WRITE_WITHOUT_RESPONSE | GattCharacteristic::BLE_GATT_CHAR_PROPERTIES_WRITE
        ),
        
        joystickUpValue(0),
        lastJoystickUpValue(1),
        joystickUpCharacteristic
        (
            0xFFF1, 
            (uint8_t *)&joystickUpValue, 
            sizeof(joystickUpValue), 
            sizeof(joystickUpValue),
            GattCharacteristic::BLE_GATT_CHAR_PROPERTIES_NOTIFY
        ),
        joystickLeftValue(0),
        lastJoystickLeftValue(1),
        joystickLeftCharacteristic
        (
            0xFFF2, 
            (uint8_t *)&joystickLeftValue, 
            sizeof(joystickLeftValue), 
            sizeof(joystickLeftValue),
            GattCharacteristic::BLE_GATT_CHAR_PROPERTIES_NOTIFY
        ),
        joystickDownValue(0),
        lastJoystickDownValue(1),
        joystickDownCharacteristic
        (
            0xFFF3, 
            (uint8_t *)&joystickDownValue, 
            sizeof(joystickDownValue), 
            sizeof(joystickDownValue),
            GattCharacteristic::BLE_GATT_CHAR_PROPERTIES_NOTIFY
        ),
        joystickRightValue(0),
        lastJoystickRightValue(1),
        joystickRightCharacteristic
        (
            0xFFF4, 
            (uint8_t *)&joystickRightValue, 
            sizeof(joystickRightValue), 
            sizeof(joystickRightValue),
            GattCharacteristic::BLE_GATT_CHAR_PROPERTIES_NOTIFY
        ),
        joystickButtonValue(0),
        lastJoystickButtonValue(1),
        joystickButtonCharacteristic
        (
            0xFFF5, 
            (uint8_t *)&joystickButtonValue, 
            sizeof(joystickButtonValue), 
            sizeof(joystickButtonValue),
            GattCharacteristic::BLE_GATT_CHAR_PROPERTIES_NOTIFY
        ),
        IMUCharacteristic(0xFFA1, (uint8_t *)&IMUValues, sizeof(IMUValues), sizeof(IMUValues), GattCharacteristic::BLE_GATT_CHAR_PROPERTIES_NOTIFY)
    {
        for(int i = 0; i < 15; i++)
        {
            IMUValues[i]= 0;
        }

        setupService();
        handleC1   = WritableChar1.getValueAttribute().getHandle();
        handleCLed = WritableCharLed.getValueAttribute().getHandle();
        handleCIMU = WritableCharIMUStatus.getValueAttribute().getHandle();
        
        pc.baud(9600);
        pc.printf("Initializing HapRing...\r\n");
        
        drv.begin();
        
        initializeIMU();

        status = false;
        out1 = 0;
    }
    
    void processInputs() 
    {
        joystickUpValue = joystickUp;
        if(joystickUpValue != lastJoystickUpValue)
        {
            ble.updateCharacteristicValue
            (
                joystickUpCharacteristic.getValueAttribute().getHandle(), 
                &joystickUpValue, 
                sizeof(joystickUpValue)
            );
            lastJoystickUpValue = joystickUpValue;
        }
        
        joystickLeftValue = joystickLeft;
        if(joystickLeftValue != lastJoystickLeftValue)
        {
            ble.updateCharacteristicValue
            (
                joystickLeftCharacteristic.getValueAttribute().getHandle(), 
                &joystickLeftValue, 
                sizeof(joystickLeftValue)
            );
            lastJoystickLeftValue = joystickLeftValue;
        }
        
        joystickDownValue = joystickDown;
        if(joystickDownValue != lastJoystickDownValue)
        {
            ble.updateCharacteristicValue
            (
                joystickDownCharacteristic.getValueAttribute().getHandle(), 
                &joystickDownValue, 
                sizeof(joystickDownValue)
            );
            lastJoystickDownValue = joystickDownValue;
        }
        
        joystickRightValue = joystickRight;
        if(joystickRightValue != lastJoystickRightValue)
        {
            ble.updateCharacteristicValue
            (
                joystickRightCharacteristic.getValueAttribute().getHandle(), 
                &joystickRightValue, 
                sizeof(joystickRightValue)
            );
            lastJoystickRightValue = joystickRightValue;
        }
        
        joystickButtonValue = joystickButton;
        if(joystickButtonValue != lastJoystickButtonValue)
        {
            ble.updateCharacteristicValue
            (
                joystickButtonCharacteristic.getValueAttribute().getHandle(), 
                &joystickButtonValue, 
                sizeof(joystickButtonValue)
            );
            lastJoystickButtonValue = joystickButtonValue;
        }
        
        if(IMUStatus == true) 
        {
            getIMUData(IMUValues);
            ble.updateCharacteristicValue(IMUCharacteristic.getValueAttribute().getHandle(), IMUValues, sizeof(IMUValues));
        }
        
    }
    
private:
    void setupService(void) 
    {
        static bool serviceAdded = false; 
        if (serviceAdded) 
        {
            return;
        }

        GattCharacteristic *charTable[] = 
        {
            &manufacturersNameStringCharacteristic,
            &modelNumberStringCharacteristic,
            &serialNumberStringCharacteristic,
            &hardwareRevisionStringCharacteristic,
            &firmwareRevisionStringCharacteristic,
            &softwareRevisionStringCharacteristic,
            &joystickUpCharacteristic,
            &joystickLeftCharacteristic,
            &joystickDownCharacteristic,
            &joystickRightCharacteristic,
            &joystickButtonCharacteristic, 
            &WritableChar1,
            &WritableCharLed,
            &WritableCharIMUStatus,
            &IMUCharacteristic
        };
        
        GattService service
        (
            GattService::UUID_DEVICE_INFORMATION_SERVICE, 
            charTable,
            sizeof(charTable) / sizeof(GattCharacteristic *)
        );

        ble.addService(service);

        serviceAdded = true;
        
        ble.onDataWritten(this, &HCIHapticServiceService::onDataWritten);
    }
    
    virtual void onDataWritten(const GattCharacteristicWriteCBParams *params) 
    {
        if (params->charHandle == handleC1) 
        {
            WritableCharValue1 = (*params->data);
            
            if(WritableCharValue1 == 0)
            {
                drv.stop();
                status = false;
            }
            else
            {
                if(status == false){drv.play(); status = true; }
                out1 = (float)WritableCharValue1 / 255.0f;
            }
            
            ///uint8_t effect = 1;
            ///drv.setWaveform(0, effect);  // play effect 
            ///drv.setWaveform(1, 0);       // end waveform
            ///drv.go();
            ///pc.printf("Vibration command 2...\r\n");
        }
        else if (params->charHandle == handleCLed)
        {
            WritableCharValueLed = (*params->data);
            irLed = (int)WritableCharValueLed;
            ((int)WritableCharValueLed > 0) ? led1 = 0 : led1 = 1;
        }
        else if (params->charHandle == handleCIMU)
        {
            WritableCharValueIMUStatus = (*params->data);
            if((int)WritableCharValueIMUStatus > 0) 
            {
                IMUStatus = true;
                wakeupIMU();
            }
            else
            {
                IMUStatus = false;
                standbyIMU();
            }
        }
    }
    
    bool status;

    BLEDevice &ble;
    
    GattCharacteristic  manufacturersNameStringCharacteristic;
    GattCharacteristic  modelNumberStringCharacteristic;
    GattCharacteristic  serialNumberStringCharacteristic;
    GattCharacteristic  hardwareRevisionStringCharacteristic;
    GattCharacteristic  firmwareRevisionStringCharacteristic;
    GattCharacteristic  softwareRevisionStringCharacteristic;
    
    uint8_t WritableCharValue1;
    GattCharacteristic WritableChar1;
    uint8_t WritableCharValueLed;
    GattCharacteristic WritableCharLed;
    
    uint8_t WritableCharValueIMUStatus;
    GattCharacteristic WritableCharIMUStatus;
    GattCharacteristic IMUCharacteristic;
    uint8_t IMUValues[16];
    bool IMUStatus;
    
    uint8_t joystickUpValue;
    uint8_t lastJoystickUpValue;
    GattCharacteristic joystickUpCharacteristic;
    uint8_t joystickLeftValue;
    uint8_t lastJoystickLeftValue;
    GattCharacteristic joystickLeftCharacteristic;
    uint8_t joystickDownValue;
    uint8_t lastJoystickDownValue;
    GattCharacteristic joystickDownCharacteristic;
    uint8_t joystickRightValue;
    uint8_t lastJoystickRightValue;
    GattCharacteristic joystickRightCharacteristic;
    uint8_t joystickButtonValue;
    uint8_t lastJoystickButtonValue;
    GattCharacteristic joystickButtonCharacteristic;
};

#endif /* #ifndef __HCI_HAPTICS_SERVICE_H__*/