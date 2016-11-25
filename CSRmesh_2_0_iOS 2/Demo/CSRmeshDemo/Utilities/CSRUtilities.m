//
// Copyright 2015 Qualcomm Technologies International, Ltd.
//


#import "CSRUtilities.h"
#import "CSRConstants.h"

@implementation CSRUtilities

#pragma mark - String utility methods

+ (BOOL)isStringEmpty:(NSString *)stringToCheck
{
    if (stringToCheck == nil) {
        return YES;
    }
    
    if ((NSNull *)stringToCheck == [NSNull null]) {
        return YES;
    }
    
    if ([stringToCheck length] == 0) {
        return YES;
    }
    
    if ([stringToCheck isEqualToString:@""]) {
        return YES;
    }
    
    if ([[stringToCheck stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@""]) {
        return YES;
    }
    
    return NO;
}

+ (BOOL)isString:(NSString *)stringToCheck containsCharacters:(NSString *)characters
{
    NSRange range = [stringToCheck rangeOfString:characters];
    
    if (range.location == NSNotFound) {
        return NO;
    } else {
        return YES;
    }
    
    return NO;
}

+ (BOOL)isStringContainsValidHexCharacters:(NSString *)stringToCheck
{
    
    NSCharacterSet *nonHexCharacterSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789ABCDEF"] invertedSet];
    NSRange nonHexCharacters = [[stringToCheck uppercaseString] rangeOfCharacterFromSet:nonHexCharacterSet];
    
    if (nonHexCharacters.location == NSNotFound) {
        
        return YES;
    
    } else {
        
        return NO;
        
    }
    
    return NO;
    
}

#pragma mark - Date time utility methods

+ (NSString *)createDateTimeString:(NSDate *)date skipMiliSeconds:(BOOL)skipMiliSeconds
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd-MM-yy"];
    
    NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
    
    if (skipMiliSeconds) {
        [timeFormat setDateFormat:@"HH:mm:ss"];
    } else {
        [timeFormat setDateFormat:@"HH:mm:ss.SSS"];
    }
    
    
    NSString *dateString = [dateFormat stringFromDate:date];
    NSString *timeString = [timeFormat stringFromDate:date];
    
    NSString *retVal;
    
    if (skipMiliSeconds) {
        retVal = [NSString stringWithFormat:@"%@ %@",dateString, timeString];
    } else {
        retVal = [NSString stringWithFormat:@"%@ %@ : ",dateString, timeString];
    }
    
    return retVal;
}

+ (NSString *)createUnixTimestampFromDate:(NSDate *)date
{
    int timestamp = [date timeIntervalSince1970];
    return [NSString stringWithFormat:@"%d",timestamp];
}

+ (NSDate *)createDateFromUnixTimestamp:(NSString *)unixTimestamp
{
    NSTimeInterval timestampInterval = [unixTimestamp doubleValue];
    return [NSDate dateWithTimeIntervalSince1970:timestampInterval];
}

+ (NSDate *)createDateFromString:(NSString *)dateString withFormat:(NSString *)dateFormat
{
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:dateFormat];
    
    return [dateFormatter dateFromString:dateString];
}

+ (NSString *)formatDate:(NSDate *)date withFormatString:(NSString *)formatString
{
    //format example: @"dd MMM yyyy HH:mm:ss"
    
    NSDateFormatter *dateFormatter;
    dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatString];
    
    return [NSString stringWithFormat:@"%@",[dateFormatter stringFromDate:date]];
}

+ (NSString *)formatUnixTimestamp:(NSString *)unixTimestamp withFormatString:(NSString *)formatString
{
    NSTimeInterval timestampInterval = [unixTimestamp doubleValue];
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:timestampInterval];
    
    NSDateFormatter *dateFormatter;
    dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatString];
    
    return [NSString stringWithFormat:@"%@",[dateFormatter stringFromDate:date]];
}

+ (NSString *)getSecondsDigit
{
    NSDate *date = [NSDate date];
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateStyle = NSDateFormatterMediumStyle;
    [df setDateFormat:@"SSS"];
    
    NSString * secondsString = [NSString stringWithFormat:@"%@", [df stringFromDate:date]];
    
    NSLog(@"getSecondsDigit: %@", [secondsString substringFromIndex:[secondsString length] - 1]);
    
    return [secondsString substringFromIndex:[secondsString length] - 1];
}

#pragma mark - Data utility methods

+ (NSData *)dataFromHexString:(NSString *)string
{
    string = [string lowercaseString];
    
    NSMutableData *data = [NSMutableData new];
    
    unsigned char whole_byte;
    char byte_chars[3] = {'\0','\0','\0'};
    int i = 0;
    int length = (int) string.length;
    
    while (i < length-1) {
        char c = [string characterAtIndex:i++];
        if (c < '0' || (c > '9' && c < 'a') || c > 'f')
            continue;
        byte_chars[0] = c;
        byte_chars[1] = [string characterAtIndex:i++];
        whole_byte = strtol(byte_chars, NULL, 16);
        [data appendBytes:&whole_byte length:1];
    }
    
    return data;
}

+ (NSData *)scanDataString:(NSString *)string
{
    
    NSData *data;
    
    if (string.length) {
        if ([string characterAtIndex:0] != '"') {
            
            data = [CSRUtilities dataFromHexString:string];
            
        } else {
            
            string = [string substringFromIndex:1];
            data = [[NSData alloc] initWithData:[string dataUsingEncoding:NSASCIIStringEncoding]];
            
        }
    }
    
    return data;
}

+ (NSString *)hexStringFromData:(NSData *)data
{
    if (data == nil) {
        return nil; //@""
    }
    
    const unsigned char *bytes = [data bytes];
    
    NSMutableString *hexString = [NSMutableString stringWithCapacity:(data.length*2)];
    
    for (int loop=0; loop<(data.length); loop++) {
        
        [hexString appendFormat:@"%02X", *bytes];
        bytes++;
        
    }
    return hexString;
}

+ (NSData *)UUIDDataFromHexString:(NSString *)string
{
    // The input string should be of the format 01234567-89AB-CDEF-0123-456789ABCDEF
    if ([string length] != 36)
        return (nil);
    
    const char *convertedString = [string UTF8String];
    NSMutableData *UUID = [NSMutableData data];
    
    while (*convertedString) {
        char upper = *convertedString++;
        if (upper=='-')
            continue;
        
        if (!*convertedString)
            return (nil);
        char lower = *convertedString++;
        
        uint8_t lowerData = lower-'0';
        if (lowerData>9)
            lowerData = (lower-'A')+10;
        
        uint8_t upperData = upper-'0';
        if (upperData>9)
            upperData = (upper-'A')+10;
        
        upperData <<= 4;
        upperData |= lowerData;
        
        [UUID appendBytes:&upperData length:sizeof(upperData)];
    }
    
    return (UUID);
}

+ (NSMutableData *)reverseData:(NSData *)data
{
    NSMutableData *reversedData = [NSMutableData data];
    
    uint8_t *byte = (uint8_t *) [data bytes];
    
    for (int i=(int)data.length; i>0; i--) {
        
        [reversedData appendBytes:&byte[i-1] length:1];
        
    }
    
    return reversedData;
}

+ (NSData *)hexStringToUUID:(NSString *)string
{
    
    if ([string length] != 36) {
        
        return nil;
    }
    
    const char *encodedString = [string UTF8String];
    NSMutableData *UUIDData = [NSMutableData data];
    
    while (*encodedString) {
        
        char upper = *encodedString++;
        
        if (upper=='-') {
            continue;
        }
        
        if (!*encodedString) {
            return (nil);
        }
        
        char lower = *encodedString++;
        
        uint8_t lowerData = lower-'0';
        
        if (lowerData>9) {
            lowerData = (lower-'A')+10;
        }
        
        uint8_t upperData = upper-'0';
        
        if (upperData>9) {
            upperData = (upper-'A')+10;
        }
        
        upperData <<= 4;
        upperData |= lowerData;
        
        [UUIDData appendBytes:&upperData length:sizeof(upperData)];
    }
    
    return UUIDData;
}

//New ones

+ (NSData *)IntToNSData:(NSInteger)data
{
    NSData * result = [NSData dataWithBytes:&data length:4];
    
    return result;
}

+ (NSInteger)NSDataToInt:(NSData *)data
{
    unsigned char bytes[4];
    [data getBytes:bytes length:4];
    NSInteger n = (int)bytes[0] << 24;
    n |= (int)bytes[1] << 16;
    n |= (int)bytes[2] << 8;
    n |= (int)bytes[3];
    return n;
}


#pragma mark - Number utility methods

+ (NSNumber *)scanHexString:(NSString *)string
{
    NSScanner *scanner = [NSScanner scannerWithString:string];
    NSNumber *hexNSNumber;
    
    if (string == nil || string.length < 1) {
        return nil;
    }
    
    if ([string characterAtIndex:0] != '0') {
        
        uint hexValue;
        
        if ([scanner scanHexInt:&hexValue]) {
            hexNSNumber = [NSNumber numberWithInt:hexValue];
        }
        
    } else {
        
        int value;
        
        if ([scanner scanInt:&value]) {
            hexNSNumber = [NSNumber numberWithInt:value];
        }
    }
    
    return (hexNSNumber);
}

+ (NSNumber *)scanBoolString:(NSString *)string
{
    BOOL state = NO;
    
    if ([string isEqualToString:@"YES"]) {
        state = YES;
    }
    
    NSNumber *stateNumber = [NSNumber numberWithBool:state];
    
    return stateNumber;
}

+ (NSNumber *)scanIntString:(NSString *)string
{
    NSScanner *scanner = [NSScanner scannerWithString:string];
    NSNumber *number;
    
    NSInteger intValue;
    
    if ([scanner scanInteger:&intValue]) {
        number = [NSNumber numberWithInt:(int)intValue];
    }
    
    return (number);
}

#pragma mark - Label utility methods

+ (CGFloat)calculateLabelHeightForText:(NSString *)text usingFont:(UIFont *)font maxWidth:(CGFloat)width
{
    NSAttributedString *attributedText = [[NSAttributedString alloc] initWithString:text attributes:@{ NSFontAttributeName: font }];
    CGRect rect = [attributedText boundingRectWithSize:(CGSize){width, CGFLOAT_MAX} options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    return rect.size.height;
    
    //return [text sizeWithFont:font constrainedToSize:CGSizeMake(width, 99999) lineBreakMode:NSLineBreakByWordWrapping].height;
}

+ (CGFloat)calculateLabelWidthForText:(NSString *)text usingFont:(UIFont *)font maxWidth:(CGFloat)width
{
    NSAttributedString *attributedText = [[NSAttributedString alloc] initWithString:text attributes:@{ NSFontAttributeName: font }];
    CGRect rect = [attributedText boundingRectWithSize:(CGSize){width, CGFLOAT_MAX} options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    return rect.size.width;
    
    //return [text sizeWithFont:font constrainedToSize:CGSizeMake(width, 99999) lineBreakMode:NSLineBreakByWordWrapping].width;
}

#pragma mark - View utility methods

+ (BOOL)iterateSubviewsOfUIView:(UIView*)view toDepth:(NSInteger)depth toFindView:(NSString *)targetView
{
    BOOL found = NO;
    
    for (UIView *item in view.subviews) {
        
        if ([[NSString stringWithFormat:@"%@", [item class]] isEqualToString:targetView]) {
            found = YES;
        } else if ([item.subviews count] > 0) {
            found = [self iterateSubviewsOfUIView:item toDepth:depth + 1 toFindView:targetView];
        }
        
        if (found) break;
        
    }
    
    return found;
}


#pragma mark - Documents directory utility methods

+ (NSString*)documentsDirectoryPath
{
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
}

+ (NSURL*)documentsDirectoryPathURL
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

+ (NSArray*)getFilesAtPath:(NSString *)path
{
    int count;
    
    NSArray *directoryContent = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:NULL];
    NSLog(@"[getFilesAtPath] files count: %lu", (unsigned long)[directoryContent count]);
    
    for (count = 0; count < (int)[directoryContent count]; count++) {
        
        NSLog(@"[getFilesAtPath] file #%d: %@", (count + 1), [directoryContent objectAtIndex:(NSUInteger)count]);
        
    }
    
    return directoryContent;
}

#pragma mark - Color utility methods

+ (UIColor*)colorFromRGB:(NSInteger)rgbValue
{
    return [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.f
                           green:((float)((rgbValue & 0x00FF00) >> 8))/255.f
                            blue:((float)(rgbValue & 0x0000FF))/255.f alpha:1.f];
}

+ (UIColor*)colorFromHex:(NSString *)hex
{
    NSString *colorString = [[hex uppercaseString]
                             stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if ([colorString length] < 6) {
        return [UIColor grayColor];
    }
    
    if ([colorString hasPrefix:@"0X"]) {
        colorString = [colorString substringFromIndex:2];
    } else if ([colorString hasPrefix:@"#"]) {
        colorString = [colorString substringFromIndex:1];
    } else if ([colorString length] != 6) {
        return  [UIColor grayColor];
    }
    
    NSString *rString = [colorString substringWithRange:NSMakeRange(0, 2)];
    NSString *gString = [colorString substringWithRange:NSMakeRange(2, 2)];
    NSString *bString = [colorString substringWithRange:NSMakeRange(4, 2)];
    
    unsigned int red, green, blue;
    
    [[NSScanner scannerWithString:rString] scanHexInt:&red];
    [[NSScanner scannerWithString:gString] scanHexInt:&green];
    [[NSScanner scannerWithString:bString] scanHexInt:&blue];
    
    return [UIColor colorWithRed:((float) red / 255.0f)
                           green:((float) green / 255.0f)
                            blue:((float) blue / 255.0f)
                           alpha:1.0f];
}

+ (UIColor*)colorFromActualRed:(float)red green:(float)green blue:(float)blue alpha:(float)alpha
{
    return [UIColor colorWithRed:red/255.f green:green/255.f blue:blue/255.f alpha:alpha];
}

+ (NSString *)hexFromRGB:(NSInteger)rgbValue
{
    NSLog(@"%li",(long)rgbValue);
    
    int red, green, blue;
    red = (rgbValue & 0xFF0000) >> 16;
    green = (rgbValue & 0x00FF00) >> 8;
    blue = rgbValue & 0x0000FF;
    
    NSString *hex = [NSString stringWithFormat:@"%2X%2X%2X", red, green, blue];
    
//    NSLog(@"hex: %@", hex);
//    
//    NSScanner *scanner = [NSScanner scannerWithString:hex];
//    [scanner scanHexInt:&hexInteger];
    
    return hex;
}

+ (NSString *)colorNameForRGB:(NSInteger)rgbValue
{
//    NSLog(@"%li",(long)rgbValue);
    
    __block NSString *colorName;
    
    int red, green, blue;
    red = (rgbValue & 0xFF0000) >> 16;
    green = (rgbValue & 0x00FF00) >> 8;
    blue = rgbValue & 0x0000FF;
    
//    NSString *givenColor = [NSString stringWithFormat:@"%2X%2X%2X", red, green, blue];
    
//    NSLog(@"Substrings: %@(%i), %@(%i), %@(%i)", [givenColor substringToIndex:2], red, [[givenColor substringFromIndex:2] substringToIndex:2], green, [givenColor substringFromIndex:4], blue);
    
    __block int minCSPR = INT_MAX;
    
    [kColorNames enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        NSDictionary *colorDict = obj;
        
        unsigned int colorHexValue;
        NSScanner *scanner = [NSScanner scannerWithString:colorDict[@"hexValue"]];
        [scanner scanHexInt:&colorHexValue];
        
        int cRed, cBlue, cGreen;
        cRed = (colorHexValue & 0xFF0000) >> 16;
        cGreen = (colorHexValue & 0x00FF00) >> 8;
        cBlue = colorHexValue & 0x0000FF;
        
        int cspr =  (((cRed - red) * (cRed - red) + (cGreen - green) * (cGreen - green) + (cBlue - blue) * (cBlue - blue)) / 3);
        
        if (cspr < minCSPR) {
            minCSPR = cspr;
            colorName = colorDict[@"colorName"];
        }
           
    }];
    
    if (![self isStringEmpty:colorName]) {
//        NSLog(@"%@",colorName);
        return colorName;
    }
    
    return @"No matching color found.";
}

+ (UIColor *)colorFromImageAtPoint:(CGPoint *)point frameWidth:(float)width frameHeight:(float)height
{
    
    float x = (*point).x - (width / 2);
    float y = (*point).y - (height / 2);
    
    float radius = sqrtf( (x*x) + (y*y));
    
    float angleRad = atan2(y, x);
    float angleDeg = (angleRad / M_PI*180) + (angleRad > 0 ? 0 : 360);
    
    // Hue is zero at the horizontal so adjust for this
    float hue = angleDeg / 360.0;
    float saturation = radius / (width / 2);
    
    // Modify touch point to edge of circle
    if (radius > (width / 2)) {
        x = ((width / 2) / radius) * x;
        y = ((height / 2) / radius) * y;
        (*point).x = x + (width / 2);
        (*point).y = y + (height / 2);
        radius = (width / 2);
    }
    
    return (UIColor *)[UIColor colorWithHue:hue saturation:saturation brightness:1.0 alpha:1.0];
}

+ (UIColor *)multiplyIntensityOfColor:(UIColor *)color withIntensityMultiplier:(CGFloat)intensityMultiplier
{
    CGFloat red, green, blue, alpha;
    
    if ([color getRed:&red green:&green blue:&blue alpha:&alpha]) {
        
        red = red * intensityMultiplier;
        green = green * intensityMultiplier;
        blue = blue * intensityMultiplier;
        UIColor *newColor = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
        
        return (newColor);
        
    }
    
    return nil;
}

+ (NSInteger)rgbFromColor:(UIColor *)color
{
    if (color && CGColorGetNumberOfComponents(color.CGColor) == 4) {
        
        int red, green, blue, alpha;
        red = round(CGColorGetComponents(color.CGColor)[0] * 255.0);
        green = round(CGColorGetComponents(color.CGColor)[1] * 255.0);
        blue = round(CGColorGetComponents(color.CGColor)[2] * 255.0);
        alpha = round(CGColorGetComponents(color.CGColor)[3] * 255.0);
        
        return (((int)alpha << 24) + ((int)red << 16) + ((int)green << 8) + (int)blue);
    }
    
    return 0;
}

+ (NSString *)hexFromColor:(UIColor *)color
{
    
    if (color && CGColorGetNumberOfComponents(color.CGColor) == 4) {
        
        CGFloat red, green, blue;
        red = roundf(CGColorGetComponents(color.CGColor)[0] * 255.0);
        green = roundf(CGColorGetComponents(color.CGColor)[1] * 255.0);
        blue = roundf(CGColorGetComponents(color.CGColor)[2] * 255.0);
        
        // Convert with %02x (use 02 to always get two chars)
        return [[NSString alloc]initWithFormat:@"%02x%02x%02x", (int)red, (int)green, (int)blue];
    }
    
    return nil;
}

#pragma mark - Image utility methods

+ (UIImage*)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
    
}

+ (UIImage*)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize
{
    //UIGraphicsBeginImageContext(newSize);
    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
    // Pass 1.0 to force exact pixel size.
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


#pragma mark - JSON utility methods

+ (NSString*)createJSONstringFromDictionary:(NSDictionary *)dictionary
{
    NSError *writeError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary options:NSJSONWritingPrettyPrinted error:&writeError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

#pragma mark - NSUserDefaults utility methods

+ (id)getValueFromDefaultsForKey:(NSString *)key
{
    return [[NSUserDefaults standardUserDefaults] valueForKey:key];
}

+ (BOOL)saveObject:(id)object toDefaultsWithKey:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] setObject:object forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
    return YES;
}

+ (NSString *)stringFromData:(NSData *)data
{
    char lastByte;
    [data getBytes:&lastByte range:NSMakeRange([data length]-1, 1)];
    
    NSString *str;
    
    if (lastByte == 0x0) {
        //string is null-terminated
        str = [NSString stringWithUTF8String:[data bytes]];
    } else {
        //string is not null-terminated
        str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    
    return str;
}


@end
