//
// Copyright 2015 Qualcomm Technologies International, Ltd.
//

/*!
 * @header CSRMeshApi Class is the base class for the Model Api classes.
 */

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import "CSRMeshUserManager.h"
#import "CSRRestConsts.h"

// Error Keys
#define kCSRMESH_ERROR_DOMAIN       [[NSBundle mainBundle] bundleIdentifier]
#define kMeshRequestId              @"MeshRequestId"
#define kTwoOpCodes                     0x80
#define kAckToken                       0x8A08

// Light Model Opcodes
#define kCSR_LIGHT_SET_LEVEL_NO_ACK         0x008A
#define kCSR_LIGHT_SET_LEVEL                0x018A
#define kCSR_LIGHT_SET_RGB_NO_ACK           0x028A
#define kCSR_LIGHT_SET_RGB                  0x038A
#define kCSR_LIGHT_SET_POWER_LEVEL_NO_ACK   0x048A
#define kCSR_LIGHT_SET_POWER_LEVEL          0x058A
#define kCSR_LIGHT_SET_COLOR_TEMP           0x068A
#define kCSR_LIGHT_GET_STATE                0x078A
#define kCSR_LIGHT_STATE                    0x088A

// Config Model Opcodes
#define kCSR_CONFIG_SET_DEVICE_IDENTIFIER   0x05
#define kCSR_CONFIG_SET_PARAMETERS          0x06
#define kCSR_CONFIG_GET_PARAMETERS          0x07
#define kCSR_CONFIG_PARAMETERS              0x08
#define kCSR_CONFIG_DISCOVER_DEVICE         0x09
#define kCSR_CONFIG_DEVICE_IDENTIFIER       0x0A

// power Model Opcodes
#define kCSR_POWER_TOGGLESTATE_NO_ACK       0x0289
#define kCSR_POWER_TOGGLESTATE              0x0389


// Error codes
enum {
    CSRMESH_MESSAGE_TIMED_OUT = 1000,
    CSRMESH_MESSAGE_ALREADY_IN_ASSOCIATION
};


@interface CSRmeshApi : NSObject


// init
/*!
 * @brief sharedInstance. Creates singleton on first use.
 * @return id - The id of the singleton object.
 */
+ (instancetype) sharedInstance;

/*!
 * @brief handleRespnose Decode the data returned from the response characteristic
 * Child classes must override this method to decode responses
 * @param data The content of the characteristics
 * @param deviceId The source device id
 * @param offset The offset to the payload data (excludes the opcode data at the start).
 */
- (void)handleResponse:(NSData *)data deviceId:(NSNumber *)deviceId payloadOffset:(NSInteger)offset;

/*!
 * @brief cleanBlocks Remove handlers after method completion
 * @param meshRequestId The request to clean up
 */
- (void)cleanBlocks:(NSNumber *)meshRequestId;

/*!
 * @brief createPacket Convienience method for creating a CSRmesh packet.
 * @param deviceId The device id
 * @param modelCode The model the packet is from
 * @param opCode The operation being requested
 */
- (NSMutableData *)createPacket:(NSNumber *)deviceId
                         opcode:(uint16_t)opcode
                     opcodeSize:(int)opcodeSize;

@end


@interface CSRmeshApi ()

typedef  void (^CSRmeshAppearance)(NSData *deviceHash, NSNumber *appearanceValue, NSData *shortName);
typedef  void (^CSRmeshUUID)(CBUUID *uuid, NSNumber *rssi);
typedef  void (^FailureBlock)(NSError *error);


// Success/Failure block dictionary
// Key is the meshRequestId
@property   (strong, nonatomic)     NSMutableDictionary *successBlocks;
@property   (strong, nonatomic)     NSMutableDictionary *failureBlocks;
@property   (strong, nonatomic)     NSMutableDictionary *asynchBlocks;

@property   (strong, nonatomic)     CSRmeshAppearance   appearanceBlock;
@property   (strong, nonatomic)     CSRmeshUUID         uuidBlock;

@property   BOOL    cloudBearer;
@property   BOOL    bluetoothBearer;

@property   (strong, nonatomic)     NSNumber    *repeats;

@end

