/*!
 Copyright [2015] Qualcomm Technologies International, Ltd.
 
 REVISION:      $Revision: #6 $
 */

#import <Foundation/Foundation.h>

#import "CSRRestFileLogger.h"

/**
 * List of supported server components
*/
typedef NS_OPTIONS(NSInteger, CSRRestServerComponent){
    /*!
     Command and control server
     */
    CSRRestServerComponent_CNC,
    
    /*!
     Configuration server
     */
    CSRRestServerComponent_CONFIG
};

/*!
 Manages global configurations like CNC Server url, port, http request retry interval etc..
 */
@interface CSRRestConfig : NSObject


/*!
 This method must be called upon the first use of the CSRRestConfig as it creates and initialises a singleton object and returns a handle to it so that the same can be used to invoke instance methods and properties.
 
 @return id - The id of the singleton object.
 */
+(id)sharedInstance;

/*!
 Command and control server URL.
 Default value is http://nil/csrmesh/cnc
 */
@property (nonatomic, strong, readonly) NSString *serverUrlCNC;

/*!
 Command and control server URI scheme.
 Default value is http
 */
@property (nonatomic, strong, readonly) NSString *uriSchemeCNC;

/*!
 Command and control server host.
 Default value is nil
 */
@property (nonatomic, strong, readonly) NSString *hostCNC;

/*!
 Command and control server port.
 Default value is 80
 */
@property (nonatomic, strong, readonly) NSString *portCNC;

/*!
 Command and control server base path.
 Default value is /csrmesh/cnc
 */
@property (nonatomic, strong, readonly) NSString *basePathCNC;

/*!
 Config server URL.
 Default value is http://nil/csrmesh/config
 */
@property (nonatomic, strong, readonly) NSString *serverUrlConfig;

/*!
 Config server URI scheme.
 Default value is http
 */
@property (nonatomic, strong, readonly) NSString *uriSchemeConfig;

/*!
 Config server host.
 Default value is nil
 */
@property (nonatomic, strong, readonly) NSString *hostConfig;

/*!
 Config server port.
 Default value is 80
 */
@property (nonatomic, strong, readonly) NSString *portConfig;

/*!
 Command and control server base path.
 Default value is /csrmesh/cnc
 */
@property (nonatomic, strong, readonly) NSString *basePathConfig;

/*!
 Maximum retry attempts required for failed requests.
 Default value is 5.
 */
@property (nonatomic, assign, readwrite) NSInteger maxRetryAttempts;


/*!
 Retry interval between two requests, value is in milli seconds.
 Default value is 12 seconds.
 */
@property (nonatomic, assign, readwrite) NSInteger retryInterval;

/*!
 Config server ssl certificates.
 */
@property (nonatomic, strong, readonly) NSMutableDictionary *certInfo;



/*!
 Set the server base URL of services like Command and Control, config etc.
 
 @param  serverComponent the enum for the requested component's url
 @param  uriScheme  the uri scheme, default is http
 @param  host  the server DNS, default is null
 @param  port the server port, default is 80
 @param  basePath the base scheme
 */
- (void)  setServerUrl:(CSRRestServerComponent)serverComponent uriScheme:(NSString*)uriScheme host:(NSString*) host port:(NSString*) port basePath:(NSString*) basePath;


/*!
 Add own http headers if required
 
 @param value - (NSString*) The new value for the header field. Any existing value for the field is replaced by the new value
 @param key - (NSString*) The name of the header field to set. In keeping with the HTTP RFC, HTTP header field names are case-insensitive
 */
- (void) addExtraHeader:(NSString*)value forKey:(NSString*)key;


/*!
 Add the self signed certificates to support https call.
 We need this API to resolve challange raised from customize HTTPS server trust evaluation, look for a challenge whose protection space has an authentication method of  NSURLAuthenticationMethodServerTrust.
 
 @param  path of the client certificate file located in bundel.
 */
-(BOOL)addSSLCertificate:(NSString *)certPath;


@end
