//
// Copyright 2014 - 2015 Qualcomm Technologies International, Ltd.
//

#import <Foundation/Foundation.h>
#import "CSRmeshApi.h"

/*!
 * @header ConfigModelApi is a part of the CSRmesh Api and provides a set of methods related to the Config Model.
 */

#define kCSR_UUID_LOW               @"CSR_UUID_LOW"
#define kCSR_UUID_HIGH              @"CSR_UUID_HIGH"
#define kCSR_MODEL_LOW              @"CSR_MODEL_LOW"
#define kCSR_MODEL_HIGH             @"CSR_MODEL_HIGH"
#define kCSR_VENDOR_IDENTIFIER      @"CSR_VENDOR_IDENTIFIER"
#define kCSR_PRODUCT_IDENTIFIER     @"CSR_PRODUCT_IDENTIFIER"
#define kCSR_VERSION_NUMBER         @"CSR_VERSION_NUMBER"
#define kCSR_APPEARANCE             @"CSR_APPEARANCE"
#define kCSR_LAST_ETAG              @"CSR_LAST_ETAG"

#define kCSR_ConfigTxInterval       @"kCSR_ConfigTxInterval"
#define kCSR_ConfigTxDuration       @"kCSR_ConfigTxDuration"
#define kCSR_ConfigRxDutyCycle      @"kCSR_ConfigRxDutyCycle"
#define kCSR_ConfigTxPower          @"kCSR_ConfigTxPower"
#define kCSR_ConfigTimeToLive       @"kCSR_ConfigTimeToLive"

enum  {
    CSR_UUID_low = 0,
    CSR_UUID_high,
    CSR_Model_low,
    CSR_Model_high,
    CSR_VID_PID_Version,
    CSR_Appearance,
    CSR_LastETag,
};

@protocol ConfigModelApiDelegate <NSObject>
@optional

/*!
 * @brief didGetDeviceInfo delegate. Invoked by the CSRmesh library upon receiving the request to getInfo
 * @param deviceId - The ID assigned by the library to this device
 * @param info - (NSDictionary *) of the information requested
 * kCSR_UUID_LOW - NSData of lower 64-bits of the UUID
 * kCSR_UUID_HIGH - NSData of the higher 64-bits of the UUID
 * kCSR_MODEL_LOW - NSData of the lower 64-bits of the bit encoded Models
 * kCSR_MODEL_HIGH - NSData of the higher 64-bits of the bit encoded Models
 * kCSR_VENDOR_IDENTIFIER - The VendorIdentifier is a 16-bit unsigned integer. This shall use the same enumerations as the existing Bluetooth SIG Company Identification assigned numbers
 * kCSR_PRODUCT_IDENTIFIER - The ProductIdentifier is a 16-bit unsigned integer allocated by the Vendor
 * kCSR_VERSION_NUMBER - The VersionNumber is a 32-bit unsigned integer allocated per product by the vendor. Each new version of the device shall have a different VersionNumber. A new version is defined as any change to the software, hardware or firmware of a device, even if this change is meant to have no material impact to the behavior of the device.
 * kCSR_APPEARANCE - The Appearance is a 24-bit unsigned integer using the same the Bluetooth SIG GAP Appearance characteristic values.
 * kCSR_LAST_ETAG - The LastETag is a 64-bit unsigned integer that shall be set to a different value each time the device has a change in its configuration. This value is a read only value, and can be used to quickly determine if a device has changed the configuration of a device without another device reading the full configuration. The configuration is defined as any change to the device such that the device behavior changes - for example, changing Groups or the interval for sending Sensor broadcast data
 *
 * @param infoType - (NSNumber *) Unsigned Char encoded with the type of information requested as follows
 */
-(void) didGetDeviceInfo:(NSNumber *)deviceId info:(NSDictionary *)info infoType:(NSNumber *)infoType meshRequestId:(NSNumber *)meshRequestId
__deprecated_msg("use success and failure blocks in the method -(NSNumber *) getInfo:(NSNumber *)deviceId infoType:(NSNumber *)infoType success:(void (^)(NSNumber *deviceId, NSDictionary *info, NSNumber *infoType))success failure:(void (^)(NSError *error))failure");


/*!
 * @brief didResetDevice delegate. Invoked by the CSRmesh library upon successful device reset
 * @param deviceId - The ID assigned by the library to this device
 */
-(void) didResetDevice:(NSNumber *)deviceId deviceHash:(NSData *)deviceHash;

@end


@interface ConfigModelApi : CSRmeshApi

/*!
 * @brief getInfo - Request low level info from device
 * @param deviceId - (NSNumber *) The ID of this device. Refer to the delegate MeshServiceApi.didAssociateDevice
 * @param infoType - The type of Info
 *  0 - UUID_low,
 *  1 - UUID_high,
 *  2 - Model_low,
 *  3 - Model_high,
 *  4 - VID_PID_Version,
 *  5 - Appearance,
 *  6 - LastETag
 *  ff - UnknownInfoType
 * @param success - Block called upon successful execution
 * @param failure - Block called upon error
 * @return meshRequestId - The id of the message.
 */
-(NSNumber *) getInfo:(NSNumber *)deviceId
             infoType:(NSNumber *)infoType
              success:(void (^)(NSNumber *deviceId, NSDictionary *info, NSNumber *infoType))success
              failure:(void (^)(NSError *error))failure;



-(NSNumber *) getInfo:(NSNumber *)deviceId infoType:(NSNumber *)infoType
__deprecated_msg("use -(NSNumber *) getInfo:(NSNumber *)deviceId infoType:(NSNumber *)infoType success:(void (^)(NSNumber *deviceId, NSDictionary *info, NSNumber *infoType))success failure:(void (^)(NSError *error))failure");

/*!
 * @brief resetDevice - Request the device to delete its Association information
 * @param deviceId - (NSNumber *) The ID of this device. Refer to the delegate MeshServiceApi.didAssociateDevice
 */
-(void) resetDevice:(NSNumber *)deviceId;


/*!
 * @brief getParameters - Retrives configuration parameters from the Device
 * @param deviceId - (NSNumber *) The ID of this device. Refer to the delegate MeshServiceApi.didAssociateDevice
 * @param success - Block called upon successful execution
 * @param failure - Block called upon error
 * @return meshRequestId - The id of the message.
 */
- (NSNumber *)getParameters:(NSNumber *)deviceId
                    success:(void (^)(NSNumber *deviceId,
                                      NSNumber *txInterval,
                                      NSNumber *txDuration,
                                      NSNumber *rxDutyCycle,
                                      NSNumber *txPower,
                                      NSNumber *timeToLive))success
                    failure:(void (^)(NSError *error))failure;


/*!
 * @brief setParameters - Retrives configuration parameters from the Device
 * @param deviceId - (NSNumber *) The ID of this device. Refer to the delegate MeshServiceApi.didAssociateDevice
 * @param txInterval - The TxInterval, or transmit interval, field is a 16-bit unsigned integer in milliseconds that determines the interval between transmitting messages.
 * @param txDuration - The TxDuration, or transmit duration, field is a 16-bit unsigned integer in milliseconds that determines the duration of transmission for a single message.
 * @param rxDutyCycle - The RxDutyCycle, or receiver duty cycle, field is an 8-bit unsigned integer that determines how often the devices should be listening for mesh messages as 255ths of fully listening.
 Note: The value 0x00 implies that this device does not listen for mesh messages.
 Note: The value 0xFF implies that a device should continuously listen for mesh messages.
 * @param txPower - The TxPower, or transmit power, field is an 8-bit signed integer in decibels that determines the radio transmit power for a device.
 * @param timeToLive - The TimeToLive field is an 8-bit unsigned integer that determines the default value for the TTL packet field in an MTL packet.
 * @param success - Block called upon successful execution
 * @param failure - Block called upon error
 * @return meshRequestId - The id of the message.
 */
- (NSNumber *)setParameters:(NSNumber *)deviceId
                 txInterval:(NSNumber *)txInterval
                 txDuration:(NSNumber *)txDuration
                rxDutyCycle:(NSNumber *)rxDutyCycle
                    txPower:(NSNumber *)txPower
                 timeToLive:(NSNumber *)timeToLive
                    success:(void (^)(NSNumber *deviceId,
                                      NSNumber *txInterval,
                                      NSNumber *txDuration,
                                      NSNumber *rxDutyCycle,
                                      NSNumber *txPower,
                                      NSNumber *timeToLive))success
                    failure:(void (^)(NSError *error))failure;


/*!
 * @brief discoverDevice - Method can be used to discvoer unknown devices in a mesh network. Message can be directed at a specific deviceId or 0 for all devices.
 * @param deviceId - (NSNumber *) The ID of this device. Refer to the delegate MeshServiceApi.didAssociateDevice. This can be 0 in which case all devices shall respond.
 * @param success - Block called upon successful execution. The DeviceHash field is a 64-bit hash of the DeviceUUID that is used to identify this device.
 * @param failure - Block called upon error
 * @return meshRequestId - The id of the message.
 */
- (NSNumber *)discoverDevice:(NSNumber *)deviceId
                     success:(void (^)(NSNumber *deviceId,
                                       NSData *deviceHash))success
                     failure:(void (^)(NSError *error))failure;



/*!
 * @brief setDeviceId - Upon receiving this message where the device has a DeviceID of 0x0000, and the DeviceHash of the message matches the DeviceHash of this device, then the DeviceID of this device shall be set to the DeviceID field of this message. Use the discoverDevice command to check the new DeviceId has been set. Note: This message should not be necessary in normal operation of a mesh network as the DeviceID is distributed as part of the MASP protocol in the MASP_ID_DISTRIBUTION message.
 * @param deviceId - (NSNumber *) The ID of this device or 0 for all devices. Refer to the delegate MeshServiceApi.didAssociateDevice.
 * @param deviceHash - (NSData *)  The DeviceHash field is a 64-bit hash of the DeviceUUID.
 * @param newDeviceId - (NSNumber *)  The DeviceId to be set
 * @return meshRequestId - The id of the message.
 */
- (NSNumber *)setDeviceId:(NSNumber *)deviceId
               deviceHash:(NSData *)deviceHash
              newDeviceId:(NSNumber *)newDeviceId;

// The Delegate for this object
@property (nonatomic, weak)   id<ConfigModelApiDelegate>  configModelApiDelegate;



@end
