//
// Copyright 2015 Qualcomm Technologies International, Ltd.
//

#import "CSRmeshStyleKit.h"


@implementation CSRmeshStyleKit

#pragma mark Cache

static UIImage* _imageOfActivitiesIcon = nil;
static UIImage* _imageOfAreasIcon = nil;
static UIImage* _imageOfFavouritesIcon = nil;
static UIImage* _imageOfBulbIcon = nil;
static UIImage* _imageOfUsersIcon = nil;
static UIImage* _imageOfHouse = nil;
static UIImage* _imageOfLight_on = nil;
static UIImage* _imageOfLight_off = nil;
static UIImage* _imageOfLock_on = nil;
static UIImage* _imageOfLock_off = nil;
static UIImage* _imageOfTemperature_on = nil;
static UIImage* _imageOfTemperature_off = nil;
static UIImage* _imageOfSearch = nil;
static UIImage* _imageOfCloud = nil;
static UIImage* _imageOfGear = nil;
static UIImage* _imageOfFavourites_off = nil;
static UIImage* _imageOfFavourites_on = nil;
static UIImage* _imageOfPlus = nil;
static UIImage* _imageOfBack_arrow = nil;
static UIImage* _imageOfMenu_arrow_down = nil;
static UIImage* _imageOfMenu_arrow_up = nil;
static UIImage* _imageOfThick_circle = nil;
static UIImage* _imageOfCheckbox_on = nil;
static UIImage* _imageOfCheckbox_off = nil;
static UIImage* _imageOfCheckbox_alt_on = nil;
static UIImage* _imageOfCheckbox_alt_off = nil;
static UIImage* _imageOfIconHouse = nil;
static UIImage* _imageOfIconBoat = nil;
static UIImage* _imageOfIconBuilding = nil;
static UIImage* _imageOfIconCity = nil;
static UIImage* _imageOfIconUni = nil;
static UIImage* _imageOfIconStar = nil;
static UIImage* _imageOfIconParking = nil;
static UIImage* _imageOfIconDining = nil;
static UIImage* _imageOfIconHotel = nil;
static UIImage* _imageOfIconShop = nil;
static UIImage* _imageOfIconTerrain = nil;
static UIImage* _imageOfIconNature = nil;
static UIImage* _imageOfIconPublic = nil;
static UIImage* _imageOfIconSun = nil;
static UIImage* _imageOfIconSuitcase = nil;
static UIImage* _imageOfTrashcan = nil;
static UIImage* _imageOfThick = nil;
static UIImage* _imageOfUpdate = nil;
static UIImage* _imageOfAccessoryGear = nil;
static UIImage* _imageOfSettingsIcon = nil;
static UIImage* _imageOfAboutIcon = nil;
static UIImage* _imageOfShareIcon = nil;
static UIImage* _imageOfDeveloperOptionsIcon = nil;
static UIImage* _imageOfBluetooth_on = nil;
static UIImage* _imageOfBluetooth_off = nil;
static UIImage* _imageOfCloud_on = nil;
static UIImage* _imageOfCloud_off = nil;
static UIImage* _imageOfInlineGear = nil;
static UIImage* _imageOfGateway = nil;
static UIImage* _imageOfGateway_on = nil;
static UIImage* _imageOfGateway_off = nil;
static UIImage* _imageOfIconQRScanOk = nil;
static UIImage* _imageOfIconQRScanFail = nil;
static UIImage* _imageOfArrow_up = nil;
static UIImage* _imageOfArrow_down = nil;
static UIImage* _imageOfSensor = nil;
static UIImage* _imageOfMesh_device = nil;
static UIImage* _imageOfCloud_state_on = nil;
static UIImage* _imageOfCloud_state_off = nil;
static UIImage* _imageOfWarning_state = nil;

#pragma mark Initialization

+ (void)initialize
{
}

#pragma mark Drawing Methods

+ (void)drawActivitiesIcon
{
    //// Color Declarations
    UIColor* fillColor = [UIColor colorWithRed: 0.333 green: 0.333 blue: 0.333 alpha: 1];

    //// grid
    {
        //// Bezier Drawing
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake(10.67, 17.33)];
        [bezierPath addLineToPoint: CGPointMake(17.33, 17.33)];
        [bezierPath addLineToPoint: CGPointMake(17.33, 10.67)];
        [bezierPath addLineToPoint: CGPointMake(10.67, 10.67)];
        [bezierPath addLineToPoint: CGPointMake(10.67, 17.33)];
        [bezierPath closePath];
        [bezierPath moveToPoint: CGPointMake(20.67, 37.33)];
        [bezierPath addLineToPoint: CGPointMake(27.33, 37.33)];
        [bezierPath addLineToPoint: CGPointMake(27.33, 30.67)];
        [bezierPath addLineToPoint: CGPointMake(20.67, 30.67)];
        [bezierPath addLineToPoint: CGPointMake(20.67, 37.33)];
        [bezierPath closePath];
        [bezierPath moveToPoint: CGPointMake(10.67, 37.33)];
        [bezierPath addLineToPoint: CGPointMake(17.33, 37.33)];
        [bezierPath addLineToPoint: CGPointMake(17.33, 30.67)];
        [bezierPath addLineToPoint: CGPointMake(10.67, 30.67)];
        [bezierPath addLineToPoint: CGPointMake(10.67, 37.33)];
        [bezierPath closePath];
        [bezierPath moveToPoint: CGPointMake(10.67, 27.33)];
        [bezierPath addLineToPoint: CGPointMake(17.33, 27.33)];
        [bezierPath addLineToPoint: CGPointMake(17.33, 20.67)];
        [bezierPath addLineToPoint: CGPointMake(10.67, 20.67)];
        [bezierPath addLineToPoint: CGPointMake(10.67, 27.33)];
        [bezierPath closePath];
        [bezierPath moveToPoint: CGPointMake(20.67, 27.33)];
        [bezierPath addLineToPoint: CGPointMake(27.33, 27.33)];
        [bezierPath addLineToPoint: CGPointMake(27.33, 20.67)];
        [bezierPath addLineToPoint: CGPointMake(20.67, 20.67)];
        [bezierPath addLineToPoint: CGPointMake(20.67, 27.33)];
        [bezierPath closePath];
        [bezierPath moveToPoint: CGPointMake(30.67, 10.67)];
        [bezierPath addLineToPoint: CGPointMake(30.67, 17.33)];
        [bezierPath addLineToPoint: CGPointMake(37.33, 17.33)];
        [bezierPath addLineToPoint: CGPointMake(37.33, 10.67)];
        [bezierPath addLineToPoint: CGPointMake(30.67, 10.67)];
        [bezierPath closePath];
        [bezierPath moveToPoint: CGPointMake(20.67, 17.33)];
        [bezierPath addLineToPoint: CGPointMake(27.33, 17.33)];
        [bezierPath addLineToPoint: CGPointMake(27.33, 10.67)];
        [bezierPath addLineToPoint: CGPointMake(20.67, 10.67)];
        [bezierPath addLineToPoint: CGPointMake(20.67, 17.33)];
        [bezierPath closePath];
        [bezierPath moveToPoint: CGPointMake(30.67, 27.33)];
        [bezierPath addLineToPoint: CGPointMake(37.33, 27.33)];
        [bezierPath addLineToPoint: CGPointMake(37.33, 20.67)];
        [bezierPath addLineToPoint: CGPointMake(30.67, 20.67)];
        [bezierPath addLineToPoint: CGPointMake(30.67, 27.33)];
        [bezierPath closePath];
        [bezierPath moveToPoint: CGPointMake(30.67, 37.33)];
        [bezierPath addLineToPoint: CGPointMake(37.33, 37.33)];
        [bezierPath addLineToPoint: CGPointMake(37.33, 30.67)];
        [bezierPath addLineToPoint: CGPointMake(30.67, 30.67)];
        [bezierPath addLineToPoint: CGPointMake(30.67, 37.33)];
        [bezierPath closePath];
        bezierPath.miterLimit = 4;

        [fillColor setFill];
        [bezierPath fill];
    }
}

+ (void)drawAreasIcon
{
    //// Color Declarations
    UIColor* fillColor = [UIColor colorWithRed: 0.333 green: 0.333 blue: 0.333 alpha: 1];

    //// ic_content
    {
        //// Bezier Drawing
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake(32.05, 4)];
        [bezierPath addLineToPoint: CGPointMake(10.58, 4)];
        [bezierPath addCurveToPoint: CGPointMake(7, 7.64) controlPoint1: CGPointMake(8.61, 4) controlPoint2: CGPointMake(7, 5.64)];
        [bezierPath addLineToPoint: CGPointMake(7, 33.09)];
        [bezierPath addLineToPoint: CGPointMake(10.58, 33.09)];
        [bezierPath addLineToPoint: CGPointMake(10.58, 7.64)];
        [bezierPath addLineToPoint: CGPointMake(32.05, 7.64)];
        [bezierPath addLineToPoint: CGPointMake(32.05, 4)];
        [bezierPath closePath];
        [bezierPath moveToPoint: CGPointMake(37.42, 11.27)];
        [bezierPath addLineToPoint: CGPointMake(17.74, 11.27)];
        [bezierPath addCurveToPoint: CGPointMake(14.16, 14.91) controlPoint1: CGPointMake(15.77, 11.27) controlPoint2: CGPointMake(14.16, 12.91)];
        [bezierPath addLineToPoint: CGPointMake(14.16, 40.36)];
        [bezierPath addCurveToPoint: CGPointMake(17.74, 44) controlPoint1: CGPointMake(14.16, 42.36) controlPoint2: CGPointMake(15.77, 44)];
        [bezierPath addLineToPoint: CGPointMake(37.42, 44)];
        [bezierPath addCurveToPoint: CGPointMake(41, 40.36) controlPoint1: CGPointMake(39.39, 44) controlPoint2: CGPointMake(41, 42.36)];
        [bezierPath addLineToPoint: CGPointMake(41, 14.91)];
        [bezierPath addCurveToPoint: CGPointMake(37.42, 11.27) controlPoint1: CGPointMake(41, 12.91) controlPoint2: CGPointMake(39.39, 11.27)];
        [bezierPath closePath];
        [bezierPath moveToPoint: CGPointMake(37.42, 40.36)];
        [bezierPath addLineToPoint: CGPointMake(17.74, 40.36)];
        [bezierPath addLineToPoint: CGPointMake(17.74, 14.91)];
        [bezierPath addLineToPoint: CGPointMake(37.42, 14.91)];
        [bezierPath addLineToPoint: CGPointMake(37.42, 40.36)];
        [bezierPath closePath];
        bezierPath.miterLimit = 4;

        [fillColor setFill];
        [bezierPath fill];
    }
}

+ (void)drawFavouritesIcon
{
    //// Color Declarations
    UIColor* fillColor = [UIColor colorWithRed: 0.333 green: 0.333 blue: 0.333 alpha: 1];

    //// ic_star
    {
        //// Star Drawing
        UIBezierPath* starPath = [UIBezierPath bezierPath];
        [starPath moveToPoint: CGPointMake(24, 4.95)];
        [starPath addLineToPoint: CGPointMake(29.61, 18.27)];
        [starPath addLineToPoint: CGPointMake(44.02, 19.5)];
        [starPath addLineToPoint: CGPointMake(33.08, 28.95)];
        [starPath addLineToPoint: CGPointMake(36.37, 43.03)];
        [starPath addLineToPoint: CGPointMake(24, 35.55)];
        [starPath addLineToPoint: CGPointMake(11.63, 43.03)];
        [starPath addLineToPoint: CGPointMake(14.92, 28.95)];
        [starPath addLineToPoint: CGPointMake(3.98, 19.5)];
        [starPath addLineToPoint: CGPointMake(18.39, 18.27)];
        [starPath closePath];
        [fillColor setFill];
        [starPath fill];
    }
}

+ (void)drawBulbIcon
{
    //// Color Declarations
    UIColor* fillColor = [UIColor colorWithRed: 0.333 green: 0.333 blue: 0.333 alpha: 1];

    //// ic_wb_incandescent
    {
        //// Bezier Drawing
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake(7.1, 37.08)];
        [bezierPath addLineToPoint: CGPointMake(9.92, 39.9)];
        [bezierPath addLineToPoint: CGPointMake(13.5, 36.3)];
        [bezierPath addLineToPoint: CGPointMake(10.68, 33.48)];
        [bezierPath addLineToPoint: CGPointMake(7.1, 37.08)];
        [bezierPath closePath];
        [bezierPath moveToPoint: CGPointMake(22, 44.9)];
        [bezierPath addLineToPoint: CGPointMake(26, 44.9)];
        [bezierPath addLineToPoint: CGPointMake(26, 39)];
        [bezierPath addLineToPoint: CGPointMake(22, 39)];
        [bezierPath addLineToPoint: CGPointMake(22, 44.9)];
        [bezierPath closePath];
        [bezierPath moveToPoint: CGPointMake(8, 21)];
        [bezierPath addLineToPoint: CGPointMake(2, 21)];
        [bezierPath addLineToPoint: CGPointMake(2, 25)];
        [bezierPath addLineToPoint: CGPointMake(8, 25)];
        [bezierPath addLineToPoint: CGPointMake(8, 21)];
        [bezierPath closePath];
        [bezierPath moveToPoint: CGPointMake(30, 12.62)];
        [bezierPath addLineToPoint: CGPointMake(30, 3)];
        [bezierPath addLineToPoint: CGPointMake(18, 3)];
        [bezierPath addLineToPoint: CGPointMake(18, 12.62)];
        [bezierPath addCurveToPoint: CGPointMake(12, 23) controlPoint1: CGPointMake(14.42, 14.7) controlPoint2: CGPointMake(12, 18.56)];
        [bezierPath addCurveToPoint: CGPointMake(24, 35) controlPoint1: CGPointMake(12, 29.62) controlPoint2: CGPointMake(17.38, 35)];
        [bezierPath addCurveToPoint: CGPointMake(36, 23) controlPoint1: CGPointMake(30.62, 35) controlPoint2: CGPointMake(36, 29.62)];
        [bezierPath addCurveToPoint: CGPointMake(30, 12.62) controlPoint1: CGPointMake(36, 18.56) controlPoint2: CGPointMake(33.58, 14.7)];
        [bezierPath closePath];
        [bezierPath moveToPoint: CGPointMake(40, 21)];
        [bezierPath addLineToPoint: CGPointMake(40, 25)];
        [bezierPath addLineToPoint: CGPointMake(46, 25)];
        [bezierPath addLineToPoint: CGPointMake(46, 21)];
        [bezierPath addLineToPoint: CGPointMake(40, 21)];
        [bezierPath closePath];
        [bezierPath moveToPoint: CGPointMake(34.48, 36.32)];
        [bezierPath addLineToPoint: CGPointMake(38.06, 39.92)];
        [bezierPath addLineToPoint: CGPointMake(40.88, 37.1)];
        [bezierPath addLineToPoint: CGPointMake(37.28, 33.52)];
        [bezierPath addLineToPoint: CGPointMake(34.48, 36.32)];
        [bezierPath closePath];
        bezierPath.miterLimit = 4;

        [fillColor setFill];
        [bezierPath fill];
    }
}

+ (void)drawUsersIcon
{
    //// Color Declarations
    UIColor* fillColor = [UIColor colorWithRed: 0.333 green: 0.333 blue: 0.333 alpha: 1];

    //// ic_group
    {
        //// Bezier Drawing
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake(32, 22)];
        [bezierPath addCurveToPoint: CGPointMake(37.98, 16) controlPoint1: CGPointMake(35.32, 22) controlPoint2: CGPointMake(37.98, 19.32)];
        [bezierPath addCurveToPoint: CGPointMake(32, 10) controlPoint1: CGPointMake(37.98, 12.68) controlPoint2: CGPointMake(35.32, 10)];
        [bezierPath addCurveToPoint: CGPointMake(26, 16) controlPoint1: CGPointMake(28.68, 10) controlPoint2: CGPointMake(26, 12.68)];
        [bezierPath addCurveToPoint: CGPointMake(32, 22) controlPoint1: CGPointMake(26, 19.32) controlPoint2: CGPointMake(28.68, 22)];
        [bezierPath closePath];
        [bezierPath moveToPoint: CGPointMake(16, 22)];
        [bezierPath addCurveToPoint: CGPointMake(21.98, 16) controlPoint1: CGPointMake(19.32, 22) controlPoint2: CGPointMake(21.98, 19.32)];
        [bezierPath addCurveToPoint: CGPointMake(16, 10) controlPoint1: CGPointMake(21.98, 12.68) controlPoint2: CGPointMake(19.32, 10)];
        [bezierPath addCurveToPoint: CGPointMake(10, 16) controlPoint1: CGPointMake(12.68, 10) controlPoint2: CGPointMake(10, 12.68)];
        [bezierPath addCurveToPoint: CGPointMake(16, 22) controlPoint1: CGPointMake(10, 19.32) controlPoint2: CGPointMake(12.68, 22)];
        [bezierPath closePath];
        [bezierPath moveToPoint: CGPointMake(16, 26)];
        [bezierPath addCurveToPoint: CGPointMake(2, 33) controlPoint1: CGPointMake(11.34, 26) controlPoint2: CGPointMake(2, 28.34)];
        [bezierPath addLineToPoint: CGPointMake(2, 38)];
        [bezierPath addLineToPoint: CGPointMake(30, 38)];
        [bezierPath addLineToPoint: CGPointMake(30, 33)];
        [bezierPath addCurveToPoint: CGPointMake(16, 26) controlPoint1: CGPointMake(30, 28.34) controlPoint2: CGPointMake(20.66, 26)];
        [bezierPath closePath];
        [bezierPath moveToPoint: CGPointMake(32, 26)];
        [bezierPath addCurveToPoint: CGPointMake(30.06, 26.1) controlPoint1: CGPointMake(31.42, 26) controlPoint2: CGPointMake(30.76, 26.04)];
        [bezierPath addCurveToPoint: CGPointMake(34, 33) controlPoint1: CGPointMake(32.38, 27.78) controlPoint2: CGPointMake(34, 30.04)];
        [bezierPath addLineToPoint: CGPointMake(34, 38)];
        [bezierPath addLineToPoint: CGPointMake(46, 38)];
        [bezierPath addLineToPoint: CGPointMake(46, 33)];
        [bezierPath addCurveToPoint: CGPointMake(32, 26) controlPoint1: CGPointMake(46, 28.34) controlPoint2: CGPointMake(36.66, 26)];
        [bezierPath closePath];
        bezierPath.miterLimit = 4;

        [fillColor setFill];
        [bezierPath fill];
    }
}

+ (void)drawHouse
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();

    //// Color Declarations
    UIColor* fillColor2 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];

    //// ic_home
    {
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 74.53, 59.26);



        //// Bezier Drawing
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake(-8.49, -19.91)];
        [bezierPath addCurveToPoint: CGPointMake(9.65, -4.96) controlPoint1: CGPointMake(-2.35, -14.85) controlPoint2: CGPointMake(3.66, -9.91)];
        [bezierPath addCurveToPoint: CGPointMake(29.66, 11.68) controlPoint1: CGPointMake(16.34, 0.57) controlPoint2: CGPointMake(23.04, 6.08)];
        [bezierPath addCurveToPoint: CGPointMake(30.86, 14.21) controlPoint1: CGPointMake(30.32, 12.23) controlPoint2: CGPointMake(30.85, 13.35)];
        [bezierPath addCurveToPoint: CGPointMake(30.91, 45.64) controlPoint1: CGPointMake(30.94, 24.69) controlPoint2: CGPointMake(30.92, 35.16)];
        [bezierPath addCurveToPoint: CGPointMake(26.87, 50.37) controlPoint1: CGPointMake(30.91, 48.37) controlPoint2: CGPointMake(29.46, 50.33)];
        [bezierPath addCurveToPoint: CGPointMake(0.28, 50.42) controlPoint1: CGPointMake(18.09, 50.5) controlPoint2: CGPointMake(9.29, 50.42)];
        [bezierPath addLineToPoint: CGPointMake(0.28, 24.34)];
        [bezierPath addLineToPoint: CGPointMake(-17.2, 24.34)];
        [bezierPath addLineToPoint: CGPointMake(-17.2, 50.46)];
        [bezierPath addCurveToPoint: CGPointMake(-19.38, 50.46) controlPoint1: CGPointMake(-18.07, 50.46) controlPoint2: CGPointMake(-18.73, 50.46)];
        [bezierPath addCurveToPoint: CGPointMake(-42.32, 50.46) controlPoint1: CGPointMake(-27.03, 50.46) controlPoint2: CGPointMake(-34.67, 50.46)];
        [bezierPath addCurveToPoint: CGPointMake(-47.93, 44.9) controlPoint1: CGPointMake(-46.36, 50.45) controlPoint2: CGPointMake(-47.93, 48.91)];
        [bezierPath addCurveToPoint: CGPointMake(-47.9, 14.51) controlPoint1: CGPointMake(-47.94, 34.77) controlPoint2: CGPointMake(-47.96, 24.64)];
        [bezierPath addCurveToPoint: CGPointMake(-47.01, 12) controlPoint1: CGPointMake(-47.89, 13.66) controlPoint2: CGPointMake(-47.6, 12.5)];
        [bezierPath addCurveToPoint: CGPointMake(-8.49, -19.91) controlPoint1: CGPointMake(-34.27, 1.38) controlPoint2: CGPointMake(-21.47, -9.18)];
        [bezierPath closePath];
        [fillColor2 setFill];
        [bezierPath fill];


        //// Bezier 2 Drawing
        UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
        [bezier2Path moveToPoint: CGPointMake(13.27, -22.23)];
        [bezier2Path addCurveToPoint: CGPointMake(13.28, -33.94) controlPoint1: CGPointMake(13.27, -26.42) controlPoint2: CGPointMake(13.26, -30.18)];
        [bezier2Path addCurveToPoint: CGPointMake(16.77, -37.42) controlPoint1: CGPointMake(13.3, -36.86) controlPoint2: CGPointMake(13.88, -37.42)];
        [bezier2Path addCurveToPoint: CGPointMake(28.04, -37.42) controlPoint1: CGPointMake(20.53, -37.43) controlPoint2: CGPointMake(24.28, -37.44)];
        [bezier2Path addCurveToPoint: CGPointMake(30.91, -34.48) controlPoint1: CGPointMake(30.33, -37.41) controlPoint2: CGPointMake(30.91, -36.82)];
        [bezier2Path addCurveToPoint: CGPointMake(30.89, -9.21) controlPoint1: CGPointMake(30.92, -26.05) controlPoint2: CGPointMake(30.94, -17.63)];
        [bezier2Path addCurveToPoint: CGPointMake(32.34, -6.08) controlPoint1: CGPointMake(30.88, -7.85) controlPoint2: CGPointMake(31.26, -6.95)];
        [bezier2Path addCurveToPoint: CGPointMake(45.26, 4.67) controlPoint1: CGPointMake(36.7, -2.56) controlPoint2: CGPointMake(40.97, 1.07)];
        [bezier2Path addCurveToPoint: CGPointMake(45.71, 9.02) controlPoint1: CGPointMake(47.01, 6.15) controlPoint2: CGPointMake(47.12, 7.25)];
        [bezier2Path addCurveToPoint: CGPointMake(42.56, 12.8) controlPoint1: CGPointMake(44.69, 10.3) controlPoint2: CGPointMake(43.65, 11.57)];
        [bezier2Path addCurveToPoint: CGPointMake(38.04, 13.1) controlPoint1: CGPointMake(40.94, 14.62) controlPoint2: CGPointMake(39.93, 14.68)];
        [bezier2Path addCurveToPoint: CGPointMake(13.98, -7) controlPoint1: CGPointMake(30.01, 6.4) controlPoint2: CGPointMake(22, -0.3)];
        [bezier2Path addCurveToPoint: CGPointMake(-6.94, -24.47) controlPoint1: CGPointMake(7, -12.83) controlPoint2: CGPointMake(0.03, -18.65)];
        [bezier2Path addCurveToPoint: CGPointMake(-8.51, -25.72) controlPoint1: CGPointMake(-7.41, -24.86) controlPoint2: CGPointMake(-7.9, -25.23)];
        [bezier2Path addCurveToPoint: CGPointMake(-18.41, -17.45) controlPoint1: CGPointMake(-11.83, -22.95) controlPoint2: CGPointMake(-15.12, -20.2)];
        [bezier2Path addCurveToPoint: CGPointMake(-53.94, 12.26) controlPoint1: CGPointMake(-30.25, -7.55) controlPoint2: CGPointMake(-42.09, 2.36)];
        [bezier2Path addCurveToPoint: CGPointMake(-55.22, 13.28) controlPoint1: CGPointMake(-54.36, 12.61) controlPoint2: CGPointMake(-54.79, 12.95)];
        [bezier2Path addCurveToPoint: CGPointMake(-59.44, 12.9) controlPoint1: CGPointMake(-56.97, 14.62) controlPoint2: CGPointMake(-58.03, 14.54)];
        [bezier2Path addCurveToPoint: CGPointMake(-62.57, 9.11) controlPoint1: CGPointMake(-60.51, 11.66) controlPoint2: CGPointMake(-61.53, 10.38)];
        [bezier2Path addCurveToPoint: CGPointMake(-62.2, 4.64) controlPoint1: CGPointMake(-64.14, 7.18) controlPoint2: CGPointMake(-64.07, 6.21)];
        [bezier2Path addCurveToPoint: CGPointMake(-38.77, -14.95) controlPoint1: CGPointMake(-54.4, -1.89) controlPoint2: CGPointMake(-46.59, -8.42)];
        [bezier2Path addCurveToPoint: CGPointMake(-15.05, -34.83) controlPoint1: CGPointMake(-30.85, -21.56) controlPoint2: CGPointMake(-22.83, -28.05)];
        [bezier2Path addCurveToPoint: CGPointMake(-1.8, -34.75) controlPoint1: CGPointMake(-11.1, -38.28) controlPoint2: CGPointMake(-5.78, -38.42)];
        [bezier2Path addCurveToPoint: CGPointMake(11.96, -23.11) controlPoint1: CGPointMake(2.61, -30.69) controlPoint2: CGPointMake(7.35, -26.97)];
        [bezier2Path addCurveToPoint: CGPointMake(13.27, -22.23) controlPoint1: CGPointMake(12.26, -22.86) controlPoint2: CGPointMake(12.61, -22.67)];
        [bezier2Path closePath];
        [fillColor2 setFill];
        [bezier2Path fill];



        CGContextRestoreGState(context);
    }
}

+ (void)drawLight_on
{
    //// Color Declarations
    UIColor* fillColor3 = [UIColor colorWithRed: 0.961 green: 0.729 blue: 0.283 alpha: 1];

    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(52.51, 53.67)];
    [bezierPath addLineToPoint: CGPointMake(56.61, 57.8)];
    [bezierPath addLineToPoint: CGPointMake(59.84, 54.57)];
    [bezierPath addLineToPoint: CGPointMake(55.72, 50.47)];
    [bezierPath addLineToPoint: CGPointMake(52.51, 53.67)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(58.83, 40.7)];
    [bezierPath addLineToPoint: CGPointMake(65.71, 40.7)];
    [bezierPath addLineToPoint: CGPointMake(65.71, 36.12)];
    [bezierPath addLineToPoint: CGPointMake(58.83, 36.12)];
    [bezierPath addLineToPoint: CGPointMake(58.83, 40.7)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(47.38, 26.52)];
    [bezierPath addLineToPoint: CGPointMake(47.38, 15.49)];
    [bezierPath addLineToPoint: CGPointMake(33.63, 15.49)];
    [bezierPath addLineToPoint: CGPointMake(33.63, 26.52)];
    [bezierPath addCurveToPoint: CGPointMake(26.75, 38.41) controlPoint1: CGPointMake(29.52, 28.9) controlPoint2: CGPointMake(26.75, 33.32)];
    [bezierPath addCurveToPoint: CGPointMake(40.5, 52.16) controlPoint1: CGPointMake(26.75, 46) controlPoint2: CGPointMake(32.91, 52.16)];
    [bezierPath addCurveToPoint: CGPointMake(54.25, 38.41) controlPoint1: CGPointMake(48.09, 52.16) controlPoint2: CGPointMake(54.25, 46)];
    [bezierPath addCurveToPoint: CGPointMake(47.38, 26.52) controlPoint1: CGPointMake(54.25, 33.32) controlPoint2: CGPointMake(51.48, 28.9)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(22.17, 36.12)];
    [bezierPath addLineToPoint: CGPointMake(15.29, 36.12)];
    [bezierPath addLineToPoint: CGPointMake(15.29, 40.7)];
    [bezierPath addLineToPoint: CGPointMake(22.17, 40.7)];
    [bezierPath addLineToPoint: CGPointMake(22.17, 36.12)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(38.21, 63.5)];
    [bezierPath addLineToPoint: CGPointMake(42.79, 63.5)];
    [bezierPath addLineToPoint: CGPointMake(42.79, 56.74)];
    [bezierPath addLineToPoint: CGPointMake(38.21, 56.74)];
    [bezierPath addLineToPoint: CGPointMake(38.21, 63.5)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(21.14, 54.55)];
    [bezierPath addLineToPoint: CGPointMake(24.37, 57.78)];
    [bezierPath addLineToPoint: CGPointMake(28.47, 53.65)];
    [bezierPath addLineToPoint: CGPointMake(25.24, 50.42)];
    [bezierPath addLineToPoint: CGPointMake(21.14, 54.55)];
    [bezierPath closePath];
    [fillColor3 setFill];
    [bezierPath fill];
}

+ (void)drawLight_off
{
    //// Color Declarations
    UIColor* fillColor5 = [UIColor colorWithRed: 0.819 green: 0.817 blue: 0.792 alpha: 1];

    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(52.51, 53.67)];
    [bezierPath addLineToPoint: CGPointMake(56.61, 57.8)];
    [bezierPath addLineToPoint: CGPointMake(59.84, 54.57)];
    [bezierPath addLineToPoint: CGPointMake(55.72, 50.47)];
    [bezierPath addLineToPoint: CGPointMake(52.51, 53.67)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(58.83, 40.7)];
    [bezierPath addLineToPoint: CGPointMake(65.71, 40.7)];
    [bezierPath addLineToPoint: CGPointMake(65.71, 36.12)];
    [bezierPath addLineToPoint: CGPointMake(58.83, 36.12)];
    [bezierPath addLineToPoint: CGPointMake(58.83, 40.7)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(47.38, 26.52)];
    [bezierPath addLineToPoint: CGPointMake(47.38, 15.49)];
    [bezierPath addLineToPoint: CGPointMake(33.63, 15.49)];
    [bezierPath addLineToPoint: CGPointMake(33.63, 26.52)];
    [bezierPath addCurveToPoint: CGPointMake(26.75, 38.41) controlPoint1: CGPointMake(29.52, 28.9) controlPoint2: CGPointMake(26.75, 33.32)];
    [bezierPath addCurveToPoint: CGPointMake(40.5, 52.16) controlPoint1: CGPointMake(26.75, 46) controlPoint2: CGPointMake(32.91, 52.16)];
    [bezierPath addCurveToPoint: CGPointMake(54.25, 38.41) controlPoint1: CGPointMake(48.09, 52.16) controlPoint2: CGPointMake(54.25, 46)];
    [bezierPath addCurveToPoint: CGPointMake(47.38, 26.52) controlPoint1: CGPointMake(54.25, 33.32) controlPoint2: CGPointMake(51.48, 28.9)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(22.17, 36.12)];
    [bezierPath addLineToPoint: CGPointMake(15.29, 36.12)];
    [bezierPath addLineToPoint: CGPointMake(15.29, 40.7)];
    [bezierPath addLineToPoint: CGPointMake(22.17, 40.7)];
    [bezierPath addLineToPoint: CGPointMake(22.17, 36.12)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(38.21, 63.5)];
    [bezierPath addLineToPoint: CGPointMake(42.79, 63.5)];
    [bezierPath addLineToPoint: CGPointMake(42.79, 56.74)];
    [bezierPath addLineToPoint: CGPointMake(38.21, 56.74)];
    [bezierPath addLineToPoint: CGPointMake(38.21, 63.5)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(21.14, 54.55)];
    [bezierPath addLineToPoint: CGPointMake(24.37, 57.78)];
    [bezierPath addLineToPoint: CGPointMake(28.47, 53.65)];
    [bezierPath addLineToPoint: CGPointMake(25.24, 50.42)];
    [bezierPath addLineToPoint: CGPointMake(21.14, 54.55)];
    [bezierPath closePath];
    [fillColor5 setFill];
    [bezierPath fill];
}

+ (void)drawLock_on
{
    //// Color Declarations
    UIColor* fillColor6 = [UIColor colorWithRed: 0.261 green: 0.368 blue: 0.604 alpha: 1];

    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(46.6, 32.48)];
    [bezierPath addLineToPoint: CGPointMake(32.4, 32.48)];
    [bezierPath addLineToPoint: CGPointMake(32.4, 27.9)];
    [bezierPath addCurveToPoint: CGPointMake(39.5, 20.79) controlPoint1: CGPointMake(32.4, 23.98) controlPoint2: CGPointMake(35.58, 20.79)];
    [bezierPath addCurveToPoint: CGPointMake(46.6, 27.9) controlPoint1: CGPointMake(43.42, 20.79) controlPoint2: CGPointMake(46.6, 23.98)];
    [bezierPath addLineToPoint: CGPointMake(46.6, 32.48)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(39.5, 53.1)];
    [bezierPath addCurveToPoint: CGPointMake(34.92, 48.52) controlPoint1: CGPointMake(36.98, 53.1) controlPoint2: CGPointMake(34.92, 51.04)];
    [bezierPath addCurveToPoint: CGPointMake(39.5, 43.94) controlPoint1: CGPointMake(34.92, 46) controlPoint2: CGPointMake(36.98, 43.94)];
    [bezierPath addCurveToPoint: CGPointMake(44.08, 48.52) controlPoint1: CGPointMake(42.02, 43.94) controlPoint2: CGPointMake(44.08, 46)];
    [bezierPath addCurveToPoint: CGPointMake(39.5, 53.1) controlPoint1: CGPointMake(44.08, 51.04) controlPoint2: CGPointMake(42.02, 53.1)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(53.25, 32.48)];
    [bezierPath addLineToPoint: CGPointMake(50.96, 32.48)];
    [bezierPath addLineToPoint: CGPointMake(50.96, 27.9)];
    [bezierPath addCurveToPoint: CGPointMake(39.5, 16.44) controlPoint1: CGPointMake(50.96, 21.57) controlPoint2: CGPointMake(45.83, 16.44)];
    [bezierPath addCurveToPoint: CGPointMake(28.04, 27.9) controlPoint1: CGPointMake(33.18, 16.44) controlPoint2: CGPointMake(28.04, 21.57)];
    [bezierPath addLineToPoint: CGPointMake(28.04, 32.48)];
    [bezierPath addLineToPoint: CGPointMake(25.75, 32.48)];
    [bezierPath addCurveToPoint: CGPointMake(21.17, 37.06) controlPoint1: CGPointMake(23.23, 32.48) controlPoint2: CGPointMake(21.17, 34.54)];
    [bezierPath addLineToPoint: CGPointMake(21.17, 59.98)];
    [bezierPath addCurveToPoint: CGPointMake(25.75, 64.56) controlPoint1: CGPointMake(21.17, 62.5) controlPoint2: CGPointMake(23.23, 64.56)];
    [bezierPath addLineToPoint: CGPointMake(53.25, 64.56)];
    [bezierPath addCurveToPoint: CGPointMake(57.83, 59.98) controlPoint1: CGPointMake(55.77, 64.56) controlPoint2: CGPointMake(57.83, 62.5)];
    [bezierPath addLineToPoint: CGPointMake(57.83, 37.06)];
    [bezierPath addCurveToPoint: CGPointMake(53.25, 32.48) controlPoint1: CGPointMake(57.83, 34.54) controlPoint2: CGPointMake(55.77, 32.48)];
    [bezierPath closePath];
    [fillColor6 setFill];
    [bezierPath fill];
}

+ (void)drawLock_off
{
    //// Color Declarations
    UIColor* fillColor5 = [UIColor colorWithRed: 0.819 green: 0.817 blue: 0.792 alpha: 1];

    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(40.5, 53.1)];
    [bezierPath addCurveToPoint: CGPointMake(35.92, 48.52) controlPoint1: CGPointMake(37.98, 53.1) controlPoint2: CGPointMake(35.92, 51.04)];
    [bezierPath addCurveToPoint: CGPointMake(40.5, 43.94) controlPoint1: CGPointMake(35.92, 46) controlPoint2: CGPointMake(37.98, 43.94)];
    [bezierPath addCurveToPoint: CGPointMake(45.08, 48.52) controlPoint1: CGPointMake(43.02, 43.94) controlPoint2: CGPointMake(45.08, 46)];
    [bezierPath addCurveToPoint: CGPointMake(40.5, 53.1) controlPoint1: CGPointMake(45.08, 51.04) controlPoint2: CGPointMake(43.02, 53.1)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(54.25, 32.48)];
    [bezierPath addLineToPoint: CGPointMake(51.96, 32.48)];
    [bezierPath addLineToPoint: CGPointMake(51.96, 32.19)];
    [bezierPath addLineToPoint: CGPointMake(51.96, 27.9)];
    [bezierPath addCurveToPoint: CGPointMake(40.5, 16.44) controlPoint1: CGPointMake(51.96, 21.57) controlPoint2: CGPointMake(46.83, 16.44)];
    [bezierPath addCurveToPoint: CGPointMake(29.04, 27.9) controlPoint1: CGPointMake(34.17, 16.44) controlPoint2: CGPointMake(29.04, 21.57)];
    [bezierPath addLineToPoint: CGPointMake(33.4, 27.9)];
    [bezierPath addCurveToPoint: CGPointMake(40.5, 20.79) controlPoint1: CGPointMake(33.4, 23.98) controlPoint2: CGPointMake(36.58, 20.79)];
    [bezierPath addCurveToPoint: CGPointMake(47.6, 27.9) controlPoint1: CGPointMake(44.42, 20.79) controlPoint2: CGPointMake(47.6, 23.98)];
    [bezierPath addLineToPoint: CGPointMake(47.6, 32.19)];
    [bezierPath addLineToPoint: CGPointMake(47.6, 32.19)];
    [bezierPath addLineToPoint: CGPointMake(47.6, 32.48)];
    [bezierPath addLineToPoint: CGPointMake(26.75, 32.48)];
    [bezierPath addCurveToPoint: CGPointMake(22.17, 37.06) controlPoint1: CGPointMake(24.23, 32.48) controlPoint2: CGPointMake(22.17, 34.54)];
    [bezierPath addLineToPoint: CGPointMake(22.17, 59.98)];
    [bezierPath addCurveToPoint: CGPointMake(26.75, 64.56) controlPoint1: CGPointMake(22.17, 62.5) controlPoint2: CGPointMake(24.23, 64.56)];
    [bezierPath addLineToPoint: CGPointMake(54.25, 64.56)];
    [bezierPath addCurveToPoint: CGPointMake(58.83, 59.98) controlPoint1: CGPointMake(56.77, 64.56) controlPoint2: CGPointMake(58.83, 62.5)];
    [bezierPath addLineToPoint: CGPointMake(58.83, 37.06)];
    [bezierPath addCurveToPoint: CGPointMake(54.25, 32.48) controlPoint1: CGPointMake(58.83, 34.54) controlPoint2: CGPointMake(56.77, 32.48)];
    [bezierPath closePath];
    [fillColor5 setFill];
    [bezierPath fill];
}

+ (void)drawTemperature_on
{
    //// Color Declarations
    UIColor* fillColor7 = [UIColor colorWithRed: 0.78 green: 0.046 blue: 0.127 alpha: 1];

    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(39.84, 57.07)];
    [bezierPath addCurveToPoint: CGPointMake(32.46, 49.87) controlPoint1: CGPointMake(35.76, 57.07) controlPoint2: CGPointMake(32.46, 53.86)];
    [bezierPath addCurveToPoint: CGPointMake(38.9, 42.72) controlPoint1: CGPointMake(32.46, 46.16) controlPoint2: CGPointMake(34.86, 43.54)];
    [bezierPath addCurveToPoint: CGPointMake(49.48, 36.81) controlPoint1: CGPointMake(42.95, 41.89) controlPoint2: CGPointMake(47.15, 39.95)];
    [bezierPath addCurveToPoint: CGPointMake(50.84, 46.07) controlPoint1: CGPointMake(50.38, 39.76) controlPoint2: CGPointMake(50.84, 42.88)];
    [bezierPath addCurveToPoint: CGPointMake(39.84, 57.07) controlPoint1: CGPointMake(50.84, 52.14) controlPoint2: CGPointMake(45.91, 57.07)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(43.94, 15.06)];
    [bezierPath addCurveToPoint: CGPointMake(45.63, 26.06) controlPoint1: CGPointMake(43.94, 15.06) controlPoint2: CGPointMake(45.63, 21.13)];
    [bezierPath addCurveToPoint: CGPointMake(37.82, 34.61) controlPoint1: CGPointMake(45.63, 30.78) controlPoint2: CGPointMake(42.54, 34.61)];
    [bezierPath addCurveToPoint: CGPointMake(29.5, 26.06) controlPoint1: CGPointMake(33.08, 34.61) controlPoint2: CGPointMake(29.5, 30.78)];
    [bezierPath addLineToPoint: CGPointMake(29.57, 25.23)];
    [bezierPath addCurveToPoint: CGPointMake(22.17, 45.61) controlPoint1: CGPointMake(24.94, 30.73) controlPoint2: CGPointMake(22.17, 37.86)];
    [bezierPath addCurveToPoint: CGPointMake(40.5, 63.94) controlPoint1: CGPointMake(22.17, 55.74) controlPoint2: CGPointMake(30.37, 63.94)];
    [bezierPath addCurveToPoint: CGPointMake(58.83, 45.61) controlPoint1: CGPointMake(50.63, 63.94) controlPoint2: CGPointMake(58.83, 55.74)];
    [bezierPath addCurveToPoint: CGPointMake(43.94, 15.06) controlPoint1: CGPointMake(58.83, 33.26) controlPoint2: CGPointMake(52.9, 22.23)];
    [bezierPath closePath];
    [fillColor7 setFill];
    [bezierPath fill];
}

+ (void)drawTemperature_off
{
    //// Color Declarations
    UIColor* fillColor5 = [UIColor colorWithRed: 0.819 green: 0.817 blue: 0.792 alpha: 1];

    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(39.84, 57.07)];
    [bezierPath addCurveToPoint: CGPointMake(32.46, 49.87) controlPoint1: CGPointMake(35.76, 57.07) controlPoint2: CGPointMake(32.46, 53.86)];
    [bezierPath addCurveToPoint: CGPointMake(38.9, 42.72) controlPoint1: CGPointMake(32.46, 46.16) controlPoint2: CGPointMake(34.86, 43.54)];
    [bezierPath addCurveToPoint: CGPointMake(49.48, 36.81) controlPoint1: CGPointMake(42.95, 41.89) controlPoint2: CGPointMake(47.15, 39.95)];
    [bezierPath addCurveToPoint: CGPointMake(50.84, 46.07) controlPoint1: CGPointMake(50.38, 39.76) controlPoint2: CGPointMake(50.84, 42.88)];
    [bezierPath addCurveToPoint: CGPointMake(39.84, 57.07) controlPoint1: CGPointMake(50.84, 52.14) controlPoint2: CGPointMake(45.91, 57.07)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(43.94, 15.06)];
    [bezierPath addCurveToPoint: CGPointMake(45.63, 26.06) controlPoint1: CGPointMake(43.94, 15.06) controlPoint2: CGPointMake(45.63, 21.13)];
    [bezierPath addCurveToPoint: CGPointMake(37.82, 34.61) controlPoint1: CGPointMake(45.63, 30.78) controlPoint2: CGPointMake(42.54, 34.61)];
    [bezierPath addCurveToPoint: CGPointMake(29.5, 26.06) controlPoint1: CGPointMake(33.08, 34.61) controlPoint2: CGPointMake(29.5, 30.78)];
    [bezierPath addLineToPoint: CGPointMake(29.57, 25.23)];
    [bezierPath addCurveToPoint: CGPointMake(22.17, 45.61) controlPoint1: CGPointMake(24.94, 30.73) controlPoint2: CGPointMake(22.17, 37.86)];
    [bezierPath addCurveToPoint: CGPointMake(40.5, 63.94) controlPoint1: CGPointMake(22.17, 55.74) controlPoint2: CGPointMake(30.37, 63.94)];
    [bezierPath addCurveToPoint: CGPointMake(58.83, 45.61) controlPoint1: CGPointMake(50.63, 63.94) controlPoint2: CGPointMake(58.83, 55.74)];
    [bezierPath addCurveToPoint: CGPointMake(43.94, 15.06) controlPoint1: CGPointMake(58.83, 33.26) controlPoint2: CGPointMake(52.9, 22.23)];
    [bezierPath closePath];
    [fillColor5 setFill];
    [bezierPath fill];
}

+ (void)drawSearch
{
    //// Color Declarations
    UIColor* fillColor8 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];

    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(15.58, 13.58)];
    [bezierPath addLineToPoint: CGPointMake(14.72, 13.58)];
    [bezierPath addLineToPoint: CGPointMake(14.42, 13.27)];
    [bezierPath addCurveToPoint: CGPointMake(16.12, 8.43) controlPoint1: CGPointMake(15.48, 11.97) controlPoint2: CGPointMake(16.12, 10.27)];
    [bezierPath addCurveToPoint: CGPointMake(9.06, 1) controlPoint1: CGPointMake(16.12, 4.33) controlPoint2: CGPointMake(12.96, 1)];
    [bezierPath addCurveToPoint: CGPointMake(2, 8.43) controlPoint1: CGPointMake(5.16, 1) controlPoint2: CGPointMake(2, 4.33)];
    [bezierPath addCurveToPoint: CGPointMake(9.06, 15.87) controlPoint1: CGPointMake(2, 12.54) controlPoint2: CGPointMake(5.16, 15.87)];
    [bezierPath addCurveToPoint: CGPointMake(13.66, 14.07) controlPoint1: CGPointMake(10.81, 15.87) controlPoint2: CGPointMake(12.42, 15.19)];
    [bezierPath addLineToPoint: CGPointMake(13.95, 14.39)];
    [bezierPath addLineToPoint: CGPointMake(13.95, 15.29)];
    [bezierPath addLineToPoint: CGPointMake(19.38, 21)];
    [bezierPath addLineToPoint: CGPointMake(21, 19.3)];
    [bezierPath addLineToPoint: CGPointMake(15.58, 13.58)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(9.06, 13.58)];
    [bezierPath addCurveToPoint: CGPointMake(4.17, 8.43) controlPoint1: CGPointMake(6.36, 13.58) controlPoint2: CGPointMake(4.17, 11.28)];
    [bezierPath addCurveToPoint: CGPointMake(9.06, 3.29) controlPoint1: CGPointMake(4.17, 5.59) controlPoint2: CGPointMake(6.36, 3.29)];
    [bezierPath addCurveToPoint: CGPointMake(13.95, 8.43) controlPoint1: CGPointMake(11.77, 3.29) controlPoint2: CGPointMake(13.95, 5.59)];
    [bezierPath addCurveToPoint: CGPointMake(9.06, 13.58) controlPoint1: CGPointMake(13.95, 11.28) controlPoint2: CGPointMake(11.77, 13.58)];
    [bezierPath closePath];
    [fillColor8 setFill];
    [bezierPath fill];
}

+ (void)drawCloud
{
    //// Color Declarations
    UIColor* fillColor8 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];

    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(17.13, 8.91)];
    [bezierPath addCurveToPoint: CGPointMake(11, 4) controlPoint1: CGPointMake(16.56, 6.1) controlPoint2: CGPointMake(14.03, 4)];
    [bezierPath addCurveToPoint: CGPointMake(5.46, 7.28) controlPoint1: CGPointMake(8.59, 4) controlPoint2: CGPointMake(6.5, 5.33)];
    [bezierPath addCurveToPoint: CGPointMake(1, 12.12) controlPoint1: CGPointMake(2.95, 7.54) controlPoint2: CGPointMake(1, 9.61)];
    [bezierPath addCurveToPoint: CGPointMake(6, 17) controlPoint1: CGPointMake(1, 14.81) controlPoint2: CGPointMake(3.24, 17)];
    [bezierPath addLineToPoint: CGPointMake(16.83, 17)];
    [bezierPath addCurveToPoint: CGPointMake(21, 12.94) controlPoint1: CGPointMake(19.13, 17) controlPoint2: CGPointMake(21, 15.18)];
    [bezierPath addCurveToPoint: CGPointMake(17.13, 8.91) controlPoint1: CGPointMake(21, 10.79) controlPoint2: CGPointMake(19.29, 9.05)];
    [bezierPath closePath];
    [fillColor8 setFill];
    [bezierPath fill];
}

+ (void)drawGear
{
    //// Color Declarations
    UIColor* fillColor9 = [UIColor colorWithRed: 0.687 green: 0.687 blue: 0.687 alpha: 1];

    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(34.55, 21.86)];
    [bezierPath addCurveToPoint: CGPointMake(34.69, 20) controlPoint1: CGPointMake(34.63, 21.25) controlPoint2: CGPointMake(34.69, 20.65)];
    [bezierPath addCurveToPoint: CGPointMake(34.55, 18.14) controlPoint1: CGPointMake(34.69, 19.35) controlPoint2: CGPointMake(34.63, 18.75)];
    [bezierPath addLineToPoint: CGPointMake(38.64, 15)];
    [bezierPath addCurveToPoint: CGPointMake(38.87, 13.79) controlPoint1: CGPointMake(39.01, 14.72) controlPoint2: CGPointMake(39.11, 14.21)];
    [bezierPath addLineToPoint: CGPointMake(35, 7.21)];
    [bezierPath addCurveToPoint: CGPointMake(33.81, 6.79) controlPoint1: CGPointMake(34.76, 6.79) controlPoint2: CGPointMake(34.24, 6.64)];
    [bezierPath addLineToPoint: CGPointMake(28.98, 8.69)];
    [bezierPath addCurveToPoint: CGPointMake(25.71, 6.83) controlPoint1: CGPointMake(27.97, 7.93) controlPoint2: CGPointMake(26.89, 7.31)];
    [bezierPath addLineToPoint: CGPointMake(24.97, 1.8)];
    [bezierPath addCurveToPoint: CGPointMake(24.02, 1) controlPoint1: CGPointMake(24.91, 1.34) controlPoint2: CGPointMake(24.5, 1)];
    [bezierPath addLineToPoint: CGPointMake(16.26, 1)];
    [bezierPath addCurveToPoint: CGPointMake(15.31, 1.8) controlPoint1: CGPointMake(15.78, 1) controlPoint2: CGPointMake(15.37, 1.34)];
    [bezierPath addLineToPoint: CGPointMake(14.57, 6.83)];
    [bezierPath addCurveToPoint: CGPointMake(11.3, 8.69) controlPoint1: CGPointMake(13.39, 7.31) controlPoint2: CGPointMake(12.3, 7.95)];
    [bezierPath addLineToPoint: CGPointMake(6.47, 6.79)];
    [bezierPath addCurveToPoint: CGPointMake(5.28, 7.21) controlPoint1: CGPointMake(6.02, 6.62) controlPoint2: CGPointMake(5.52, 6.79)];
    [bezierPath addLineToPoint: CGPointMake(1.41, 13.79)];
    [bezierPath addCurveToPoint: CGPointMake(1.64, 15) controlPoint1: CGPointMake(1.15, 14.21) controlPoint2: CGPointMake(1.27, 14.72)];
    [bezierPath addLineToPoint: CGPointMake(5.73, 18.14)];
    [bezierPath addCurveToPoint: CGPointMake(5.59, 20) controlPoint1: CGPointMake(5.65, 18.75) controlPoint2: CGPointMake(5.59, 19.37)];
    [bezierPath addCurveToPoint: CGPointMake(5.73, 21.86) controlPoint1: CGPointMake(5.59, 20.63) controlPoint2: CGPointMake(5.65, 21.25)];
    [bezierPath addLineToPoint: CGPointMake(1.64, 25)];
    [bezierPath addCurveToPoint: CGPointMake(1.41, 26.21) controlPoint1: CGPointMake(1.27, 25.28) controlPoint2: CGPointMake(1.17, 25.79)];
    [bezierPath addLineToPoint: CGPointMake(5.28, 32.79)];
    [bezierPath addCurveToPoint: CGPointMake(6.47, 33.21) controlPoint1: CGPointMake(5.52, 33.21) controlPoint2: CGPointMake(6.04, 33.36)];
    [bezierPath addLineToPoint: CGPointMake(11.3, 31.31)];
    [bezierPath addCurveToPoint: CGPointMake(14.57, 33.17) controlPoint1: CGPointMake(12.3, 32.07) controlPoint2: CGPointMake(13.39, 32.69)];
    [bezierPath addLineToPoint: CGPointMake(15.31, 38.2)];
    [bezierPath addCurveToPoint: CGPointMake(16.26, 39) controlPoint1: CGPointMake(15.37, 38.66) controlPoint2: CGPointMake(15.78, 39)];
    [bezierPath addLineToPoint: CGPointMake(24.02, 39)];
    [bezierPath addCurveToPoint: CGPointMake(24.97, 38.2) controlPoint1: CGPointMake(24.5, 39) controlPoint2: CGPointMake(24.91, 38.66)];
    [bezierPath addLineToPoint: CGPointMake(25.71, 33.17)];
    [bezierPath addCurveToPoint: CGPointMake(28.98, 31.31) controlPoint1: CGPointMake(26.89, 32.69) controlPoint2: CGPointMake(27.97, 32.05)];
    [bezierPath addLineToPoint: CGPointMake(33.81, 33.21)];
    [bezierPath addCurveToPoint: CGPointMake(35, 32.79) controlPoint1: CGPointMake(34.26, 33.38) controlPoint2: CGPointMake(34.76, 33.21)];
    [bezierPath addLineToPoint: CGPointMake(38.87, 26.21)];
    [bezierPath addCurveToPoint: CGPointMake(38.64, 25) controlPoint1: CGPointMake(39.11, 25.79) controlPoint2: CGPointMake(39.01, 25.28)];
    [bezierPath addLineToPoint: CGPointMake(34.55, 21.86)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(20.14, 26.65)];
    [bezierPath addCurveToPoint: CGPointMake(13.35, 20) controlPoint1: CGPointMake(16.4, 26.65) controlPoint2: CGPointMake(13.35, 23.67)];
    [bezierPath addCurveToPoint: CGPointMake(20.14, 13.35) controlPoint1: CGPointMake(13.35, 16.33) controlPoint2: CGPointMake(16.4, 13.35)];
    [bezierPath addCurveToPoint: CGPointMake(26.93, 20) controlPoint1: CGPointMake(23.88, 13.35) controlPoint2: CGPointMake(26.93, 16.33)];
    [bezierPath addCurveToPoint: CGPointMake(20.14, 26.65) controlPoint1: CGPointMake(26.93, 23.67) controlPoint2: CGPointMake(23.88, 26.65)];
    [bezierPath closePath];
    [fillColor9 setFill];
    [bezierPath fill];
}

+ (void)drawFavourites_off
{
    //// Color Declarations
    UIColor* fillColor10 = [UIColor colorWithRed: 0.98 green: 0.748 blue: 0.257 alpha: 1];
    UIColor* fillColor11 = [UIColor colorWithRed: 0.981 green: 0.522 blue: 0.121 alpha: 1];

    //// Group 2
    {
        //// Oval Drawing
        UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(2, 2, 100.2, 100.2)];
        [fillColor10 setFill];
        [ovalPath fill];


        //// Bezier 2 Drawing
        UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
        [bezier2Path moveToPoint: CGPointMake(52.1, 41.35)];
        [bezier2Path addLineToPoint: CGPointMake(55.22, 51.02)];
        [bezier2Path addLineToPoint: CGPointMake(64.5, 51.02)];
        [bezier2Path addLineToPoint: CGPointMake(56.9, 56.42)];
        [bezier2Path addLineToPoint: CGPointMake(59.89, 65.6)];
        [bezier2Path addLineToPoint: CGPointMake(52.1, 59.93)];
        [bezier2Path addLineToPoint: CGPointMake(44.31, 65.6)];
        [bezier2Path addLineToPoint: CGPointMake(47.3, 56.42)];
        [bezier2Path addLineToPoint: CGPointMake(39.7, 51.02)];
        [bezier2Path addLineToPoint: CGPointMake(48.98, 51.02)];
        [bezier2Path addLineToPoint: CGPointMake(52.1, 41.35)];
        [bezier2Path closePath];
        [bezier2Path moveToPoint: CGPointMake(52.1, 27.27)];
        [bezier2Path addLineToPoint: CGPointMake(45.84, 46.7)];
        [bezier2Path addLineToPoint: CGPointMake(26.19, 46.7)];
        [bezier2Path addLineToPoint: CGPointMake(42.21, 58.1)];
        [bezier2Path addLineToPoint: CGPointMake(36.08, 76.93)];
        [bezier2Path addLineToPoint: CGPointMake(52.1, 65.27)];
        [bezier2Path addLineToPoint: CGPointMake(68.12, 76.93)];
        [bezier2Path addLineToPoint: CGPointMake(61.99, 58.1)];
        [bezier2Path addLineToPoint: CGPointMake(78.01, 46.7)];
        [bezier2Path addLineToPoint: CGPointMake(58.36, 46.7)];
        [bezier2Path addLineToPoint: CGPointMake(52.1, 27.27)];
        [bezier2Path closePath];
        [fillColor11 setFill];
        [bezier2Path fill];
    }
}

+ (void)drawFavourites_on
{
    //// Color Declarations
    UIColor* fillColor10 = [UIColor colorWithRed: 0.98 green: 0.748 blue: 0.257 alpha: 1];
    UIColor* fillColor11 = [UIColor colorWithRed: 0.981 green: 0.522 blue: 0.121 alpha: 1];

    //// Group 2
    {
        //// Oval Drawing
        UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(2, 2, 100.2, 100.2)];
        [fillColor10 setFill];
        [ovalPath fill];


        //// Bezier Drawing
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake(52.1, 65.27)];
        [bezierPath addLineToPoint: CGPointMake(68.12, 76.93)];
        [bezierPath addLineToPoint: CGPointMake(61.99, 58.1)];
        [bezierPath addLineToPoint: CGPointMake(78.01, 46.7)];
        [bezierPath addLineToPoint: CGPointMake(58.36, 46.7)];
        [bezierPath addLineToPoint: CGPointMake(52.1, 27.27)];
        [bezierPath addLineToPoint: CGPointMake(45.84, 46.7)];
        [bezierPath addLineToPoint: CGPointMake(26.19, 46.7)];
        [bezierPath addLineToPoint: CGPointMake(42.21, 58.1)];
        [bezierPath addLineToPoint: CGPointMake(36.08, 76.93)];
        [bezierPath addLineToPoint: CGPointMake(52.1, 65.27)];
        [bezierPath closePath];
        [fillColor11 setFill];
        [bezierPath fill];
    }
}

+ (void)drawPlus
{
    //// Color Declarations
    UIColor* fillColor12 = [UIColor colorWithRed: 0.948 green: 0.727 blue: 0.277 alpha: 1];
    UIColor* fillColor13 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 0.302];

    //// Group 2
    {
        //// Oval Drawing
        UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(2.25, 2.2, 100.2, 100.2)];
        [fillColor12 setFill];
        [ovalPath fill];


        //// Bezier Drawing
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake(74.95, 55.54)];
        [bezierPath addLineToPoint: CGPointMake(55.52, 55.54)];
        [bezierPath addLineToPoint: CGPointMake(55.52, 74.97)];
        [bezierPath addLineToPoint: CGPointMake(49.04, 74.97)];
        [bezierPath addLineToPoint: CGPointMake(49.04, 55.54)];
        [bezierPath addLineToPoint: CGPointMake(29.6, 55.54)];
        [bezierPath addLineToPoint: CGPointMake(29.6, 49.06)];
        [bezierPath addLineToPoint: CGPointMake(49.04, 49.06)];
        [bezierPath addLineToPoint: CGPointMake(49.04, 29.63)];
        [bezierPath addLineToPoint: CGPointMake(55.52, 29.63)];
        [bezierPath addLineToPoint: CGPointMake(55.52, 49.06)];
        [bezierPath addLineToPoint: CGPointMake(74.95, 49.06)];
        [bezierPath addLineToPoint: CGPointMake(74.95, 55.54)];
        [bezierPath closePath];
        [fillColor13 setFill];
        [bezierPath fill];
    }
}

+ (void)drawBack_arrow
{
    //// Color Declarations
    UIColor* fillColor14 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];

    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(21, 9.66)];
    [bezierPath addLineToPoint: CGPointMake(5.79, 9.66)];
    [bezierPath addLineToPoint: CGPointMake(12.78, 2.75)];
    [bezierPath addLineToPoint: CGPointMake(11, 1)];
    [bezierPath addLineToPoint: CGPointMake(1, 10.9)];
    [bezierPath addLineToPoint: CGPointMake(11, 20.8)];
    [bezierPath addLineToPoint: CGPointMake(12.76, 19.06)];
    [bezierPath addLineToPoint: CGPointMake(5.79, 12.14)];
    [bezierPath addLineToPoint: CGPointMake(21, 12.14)];
    [bezierPath addLineToPoint: CGPointMake(21, 9.66)];
    [bezierPath closePath];
    [fillColor14 setFill];
    [bezierPath fill];
}

+ (void)drawMenu_arrow_down
{
    //// Color Declarations
    UIColor* fillColor8 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];

    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(8, 10)];
    [bezierPath addLineToPoint: CGPointMake(13, 15)];
    [bezierPath addLineToPoint: CGPointMake(18, 10)];
    [bezierPath addLineToPoint: CGPointMake(8, 10)];
    [bezierPath closePath];
    [fillColor8 setFill];
    [bezierPath fill];
}

+ (void)drawMenu_arrow_up
{
    //// Color Declarations
    UIColor* fillColor8 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];

    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(7, 14)];
    [bezierPath addLineToPoint: CGPointMake(12, 9)];
    [bezierPath addLineToPoint: CGPointMake(17, 14)];
    [bezierPath addLineToPoint: CGPointMake(7, 14)];
    [bezierPath closePath];
    [fillColor8 setFill];
    [bezierPath fill];
}

+ (void)drawThick_circle
{
    //// Color Declarations
    UIColor* fillColor14 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* color2 = [UIColor colorWithRed: 1 green: 0.702 blue: 0 alpha: 1];

    //// Group
    {
        //// Bezier 2 Drawing
        UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
        [bezier2Path moveToPoint: CGPointMake(10, 1)];
        [bezier2Path addCurveToPoint: CGPointMake(1, 10) controlPoint1: CGPointMake(5.03, 1) controlPoint2: CGPointMake(1, 5.03)];
        [bezier2Path addCurveToPoint: CGPointMake(10, 19) controlPoint1: CGPointMake(1, 14.97) controlPoint2: CGPointMake(5.03, 19)];
        [bezier2Path addCurveToPoint: CGPointMake(19, 10) controlPoint1: CGPointMake(14.97, 19) controlPoint2: CGPointMake(19, 14.97)];
        [bezier2Path addCurveToPoint: CGPointMake(10, 1) controlPoint1: CGPointMake(19, 5.03) controlPoint2: CGPointMake(14.97, 1)];
        [bezier2Path closePath];
        [color2 setFill];
        [bezier2Path fill];
        [UIColor.whiteColor setStroke];
        bezier2Path.lineWidth = 1.5;
        [bezier2Path stroke];


        //// Bezier Drawing
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake(8.2, 14.5)];
        [bezierPath addLineToPoint: CGPointMake(3.7, 10)];
        [bezierPath addLineToPoint: CGPointMake(4.97, 8.73)];
        [bezierPath addLineToPoint: CGPointMake(8.2, 11.95)];
        [bezierPath addLineToPoint: CGPointMake(15.03, 5.12)];
        [bezierPath addLineToPoint: CGPointMake(16.3, 6.4)];
        [bezierPath addLineToPoint: CGPointMake(8.2, 14.5)];
        [bezierPath closePath];
        [fillColor14 setFill];
        [bezierPath fill];
    }
}

+ (void)drawCheckbox_on
{
    //// Color Declarations
    UIColor* color = [UIColor colorWithRed: 0.5 green: 0.5 blue: 0.5 alpha: 1];

    //// Rectangle Drawing
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(5, 5, 20, 20) cornerRadius: 2];
    [color setStroke];
    rectanglePath.lineWidth = 2;
    [rectanglePath stroke];
}

+ (void)drawCheckbox_off
{
    //// Color Declarations
    UIColor* color2 = [UIColor colorWithRed: 1 green: 0.702 blue: 0 alpha: 1];

    //// Rectangle Drawing
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(5, 5, 20, 20) cornerRadius: 2];
    [color2 setStroke];
    rectanglePath.lineWidth = 2;
    [rectanglePath stroke];


    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(13, 20)];
    [bezierPath addLineToPoint: CGPointMake(8, 15)];
    [bezierPath addLineToPoint: CGPointMake(9.41, 13.59)];
    [bezierPath addLineToPoint: CGPointMake(13, 17.17)];
    [bezierPath addLineToPoint: CGPointMake(20.59, 9.58)];
    [bezierPath addLineToPoint: CGPointMake(22, 11)];
    [bezierPath addLineToPoint: CGPointMake(13, 20)];
    [bezierPath closePath];
    [color2 setFill];
    [bezierPath fill];
}

+ (void)drawCheckbox_alt_on
{

    //// Rectangle Drawing
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(5, 5, 20, 20) cornerRadius: 2];
    [UIColor.grayColor setFill];
    [rectanglePath fill];
}

+ (void)drawCheckbox_alt_off
{

    //// Rectangle Drawing
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(5, 5, 20, 20) cornerRadius: 2];
    [UIColor.grayColor setFill];
    [rectanglePath fill];


    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(13, 20)];
    [bezierPath addLineToPoint: CGPointMake(8, 15)];
    [bezierPath addLineToPoint: CGPointMake(9.41, 13.59)];
    [bezierPath addLineToPoint: CGPointMake(13, 17.17)];
    [bezierPath addLineToPoint: CGPointMake(20.59, 9.58)];
    [bezierPath addLineToPoint: CGPointMake(22, 11)];
    [bezierPath addLineToPoint: CGPointMake(13, 20)];
    [bezierPath closePath];
    [UIColor.whiteColor setFill];
    [bezierPath fill];
}

+ (void)drawIconHouse
{
    //// Color Declarations
    UIColor* fillColor16 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];

    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(21.2, 42)];
    [bezierPath addLineToPoint: CGPointMake(21.2, 29.65)];
    [bezierPath addLineToPoint: CGPointMake(29.3, 29.65)];
    [bezierPath addLineToPoint: CGPointMake(29.3, 42)];
    [bezierPath addLineToPoint: CGPointMake(39.42, 42)];
    [bezierPath addLineToPoint: CGPointMake(39.42, 25.53)];
    [bezierPath addLineToPoint: CGPointMake(45.5, 25.53)];
    [bezierPath addLineToPoint: CGPointMake(25.25, 7)];
    [bezierPath addLineToPoint: CGPointMake(5, 25.53)];
    [bezierPath addLineToPoint: CGPointMake(11.07, 25.53)];
    [bezierPath addLineToPoint: CGPointMake(11.07, 42)];
    [bezierPath addLineToPoint: CGPointMake(21.2, 42)];
    [bezierPath closePath];
    [fillColor16 setFill];
    [bezierPath fill];
}

+ (void)drawIconBoat
{
    //// Color Declarations
    UIColor* fillColor16 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];

    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(37.75, 39.27)];
    [bezierPath addCurveToPoint: CGPointMake(31.25, 37.14) controlPoint1: CGPointMake(35.49, 39.27) controlPoint2: CGPointMake(33.23, 38.51)];
    [bezierPath addCurveToPoint: CGPointMake(18.25, 37.14) controlPoint1: CGPointMake(27.29, 39.9) controlPoint2: CGPointMake(22.22, 39.9)];
    [bezierPath addCurveToPoint: CGPointMake(11.75, 39.27) controlPoint1: CGPointMake(16.27, 38.51) controlPoint2: CGPointMake(14.01, 39.27)];
    [bezierPath addLineToPoint: CGPointMake(8.5, 39.27)];
    [bezierPath addLineToPoint: CGPointMake(8.5, 42.5)];
    [bezierPath addLineToPoint: CGPointMake(11.75, 42.5)];
    [bezierPath addCurveToPoint: CGPointMake(18.25, 40.9) controlPoint1: CGPointMake(14, 42.5) controlPoint2: CGPointMake(16.21, 41.94)];
    [bezierPath addCurveToPoint: CGPointMake(31.25, 40.9) controlPoint1: CGPointMake(22.35, 42.98) controlPoint2: CGPointMake(27.16, 42.98)];
    [bezierPath addCurveToPoint: CGPointMake(37.75, 42.5) controlPoint1: CGPointMake(33.3, 41.95) controlPoint2: CGPointMake(35.51, 42.5)];
    [bezierPath addLineToPoint: CGPointMake(41, 42.5)];
    [bezierPath addLineToPoint: CGPointMake(41, 39.27)];
    [bezierPath addLineToPoint: CGPointMake(37.75, 39.27)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(11.67, 36.05)];
    [bezierPath addLineToPoint: CGPointMake(11.75, 36.05)];
    [bezierPath addCurveToPoint: CGPointMake(18.25, 32.82) controlPoint1: CGPointMake(14.35, 36.05) controlPoint2: CGPointMake(16.66, 34.63)];
    [bezierPath addCurveToPoint: CGPointMake(24.75, 36.05) controlPoint1: CGPointMake(19.84, 34.63) controlPoint2: CGPointMake(22.15, 36.05)];
    [bezierPath addCurveToPoint: CGPointMake(31.25, 32.82) controlPoint1: CGPointMake(27.35, 36.05) controlPoint2: CGPointMake(29.66, 34.63)];
    [bezierPath addCurveToPoint: CGPointMake(37.75, 36.05) controlPoint1: CGPointMake(32.84, 34.63) controlPoint2: CGPointMake(35.15, 36.05)];
    [bezierPath addLineToPoint: CGPointMake(37.83, 36.05)];
    [bezierPath addLineToPoint: CGPointMake(40.9, 25.27)];
    [bezierPath addCurveToPoint: CGPointMake(40.81, 24.01) controlPoint1: CGPointMake(41.03, 24.85) controlPoint2: CGPointMake(41, 24.39)];
    [bezierPath addCurveToPoint: CGPointMake(39.83, 23.2) controlPoint1: CGPointMake(40.61, 23.62) controlPoint2: CGPointMake(40.25, 23.33)];
    [bezierPath addLineToPoint: CGPointMake(37.75, 22.52)];
    [bezierPath addLineToPoint: CGPointMake(37.75, 15.07)];
    [bezierPath addCurveToPoint: CGPointMake(34.5, 11.84) controlPoint1: CGPointMake(37.75, 13.29) controlPoint2: CGPointMake(36.29, 11.84)];
    [bezierPath addLineToPoint: CGPointMake(29.63, 11.84)];
    [bezierPath addLineToPoint: CGPointMake(29.63, 7)];
    [bezierPath addLineToPoint: CGPointMake(19.88, 7)];
    [bezierPath addLineToPoint: CGPointMake(19.88, 11.84)];
    [bezierPath addLineToPoint: CGPointMake(15, 11.84)];
    [bezierPath addCurveToPoint: CGPointMake(11.75, 15.07) controlPoint1: CGPointMake(13.22, 11.84) controlPoint2: CGPointMake(11.75, 13.29)];
    [bezierPath addLineToPoint: CGPointMake(11.75, 22.52)];
    [bezierPath addLineToPoint: CGPointMake(9.66, 23.2)];
    [bezierPath addCurveToPoint: CGPointMake(8.68, 24.01) controlPoint1: CGPointMake(9.23, 23.33) controlPoint2: CGPointMake(8.88, 23.62)];
    [bezierPath addCurveToPoint: CGPointMake(8.59, 25.27) controlPoint1: CGPointMake(8.49, 24.39) controlPoint2: CGPointMake(8.44, 24.85)];
    [bezierPath addLineToPoint: CGPointMake(11.67, 36.05)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(15, 15.07)];
    [bezierPath addLineToPoint: CGPointMake(34.5, 15.07)];
    [bezierPath addLineToPoint: CGPointMake(34.5, 21.47)];
    [bezierPath addLineToPoint: CGPointMake(24.75, 18.3)];
    [bezierPath addLineToPoint: CGPointMake(15, 21.47)];
    [bezierPath addLineToPoint: CGPointMake(15, 15.07)];
    [bezierPath closePath];
    [fillColor16 setFill];
    [bezierPath fill];
}

+ (void)drawIconBuilding
{
    //// Color Declarations
    UIColor* fillColor16 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];

    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(25, 15.56)];
    [bezierPath addLineToPoint: CGPointMake(25, 8)];
    [bezierPath addLineToPoint: CGPointMake(6, 8)];
    [bezierPath addLineToPoint: CGPointMake(6, 42)];
    [bezierPath addLineToPoint: CGPointMake(44, 42)];
    [bezierPath addLineToPoint: CGPointMake(44, 15.56)];
    [bezierPath addLineToPoint: CGPointMake(25, 15.56)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(9.8, 34.44)];
    [bezierPath addLineToPoint: CGPointMake(13.6, 34.44)];
    [bezierPath addLineToPoint: CGPointMake(13.6, 38.22)];
    [bezierPath addLineToPoint: CGPointMake(9.8, 38.22)];
    [bezierPath addLineToPoint: CGPointMake(9.8, 34.44)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(9.8, 26.89)];
    [bezierPath addLineToPoint: CGPointMake(13.6, 26.89)];
    [bezierPath addLineToPoint: CGPointMake(13.6, 30.67)];
    [bezierPath addLineToPoint: CGPointMake(9.8, 30.67)];
    [bezierPath addLineToPoint: CGPointMake(9.8, 26.89)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(9.8, 19.33)];
    [bezierPath addLineToPoint: CGPointMake(13.6, 19.33)];
    [bezierPath addLineToPoint: CGPointMake(13.6, 23.11)];
    [bezierPath addLineToPoint: CGPointMake(9.8, 23.11)];
    [bezierPath addLineToPoint: CGPointMake(9.8, 19.33)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(9.8, 11.78)];
    [bezierPath addLineToPoint: CGPointMake(13.6, 11.78)];
    [bezierPath addLineToPoint: CGPointMake(13.6, 15.56)];
    [bezierPath addLineToPoint: CGPointMake(9.8, 15.56)];
    [bezierPath addLineToPoint: CGPointMake(9.8, 11.78)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(17.4, 34.44)];
    [bezierPath addLineToPoint: CGPointMake(21.2, 34.44)];
    [bezierPath addLineToPoint: CGPointMake(21.2, 38.22)];
    [bezierPath addLineToPoint: CGPointMake(17.4, 38.22)];
    [bezierPath addLineToPoint: CGPointMake(17.4, 34.44)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(17.4, 26.89)];
    [bezierPath addLineToPoint: CGPointMake(21.2, 26.89)];
    [bezierPath addLineToPoint: CGPointMake(21.2, 30.67)];
    [bezierPath addLineToPoint: CGPointMake(17.4, 30.67)];
    [bezierPath addLineToPoint: CGPointMake(17.4, 26.89)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(17.4, 19.33)];
    [bezierPath addLineToPoint: CGPointMake(21.2, 19.33)];
    [bezierPath addLineToPoint: CGPointMake(21.2, 23.11)];
    [bezierPath addLineToPoint: CGPointMake(17.4, 23.11)];
    [bezierPath addLineToPoint: CGPointMake(17.4, 19.33)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(17.4, 11.78)];
    [bezierPath addLineToPoint: CGPointMake(21.2, 11.78)];
    [bezierPath addLineToPoint: CGPointMake(21.2, 15.56)];
    [bezierPath addLineToPoint: CGPointMake(17.4, 15.56)];
    [bezierPath addLineToPoint: CGPointMake(17.4, 11.78)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(40.2, 38.22)];
    [bezierPath addLineToPoint: CGPointMake(25, 38.22)];
    [bezierPath addLineToPoint: CGPointMake(25, 34.44)];
    [bezierPath addLineToPoint: CGPointMake(28.8, 34.44)];
    [bezierPath addLineToPoint: CGPointMake(28.8, 30.67)];
    [bezierPath addLineToPoint: CGPointMake(25, 30.67)];
    [bezierPath addLineToPoint: CGPointMake(25, 26.89)];
    [bezierPath addLineToPoint: CGPointMake(28.8, 26.89)];
    [bezierPath addLineToPoint: CGPointMake(28.8, 23.11)];
    [bezierPath addLineToPoint: CGPointMake(25, 23.11)];
    [bezierPath addLineToPoint: CGPointMake(25, 19.33)];
    [bezierPath addLineToPoint: CGPointMake(40.2, 19.33)];
    [bezierPath addLineToPoint: CGPointMake(40.2, 38.22)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(32.6, 26.89)];
    [bezierPath addLineToPoint: CGPointMake(36.4, 26.89)];
    [bezierPath addLineToPoint: CGPointMake(36.4, 23.11)];
    [bezierPath addLineToPoint: CGPointMake(32.6, 23.11)];
    [bezierPath addLineToPoint: CGPointMake(32.6, 26.89)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(32.6, 34.44)];
    [bezierPath addLineToPoint: CGPointMake(36.4, 34.44)];
    [bezierPath addLineToPoint: CGPointMake(36.4, 30.67)];
    [bezierPath addLineToPoint: CGPointMake(32.6, 30.67)];
    [bezierPath addLineToPoint: CGPointMake(32.6, 34.44)];
    [bezierPath closePath];
    [fillColor16 setFill];
    [bezierPath fill];
}

+ (void)drawIconCity
{
    //// Color Declarations
    UIColor* fillColor16 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];

    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(31, 23.58)];
    [bezierPath addLineToPoint: CGPointMake(31, 12.53)];
    [bezierPath addLineToPoint: CGPointMake(25.5, 7)];
    [bezierPath addLineToPoint: CGPointMake(20, 12.53)];
    [bezierPath addLineToPoint: CGPointMake(20, 16.21)];
    [bezierPath addLineToPoint: CGPointMake(9, 16.21)];
    [bezierPath addLineToPoint: CGPointMake(9, 42)];
    [bezierPath addLineToPoint: CGPointMake(42, 42)];
    [bezierPath addLineToPoint: CGPointMake(42, 23.58)];
    [bezierPath addLineToPoint: CGPointMake(31, 23.58)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(12.67, 34.63)];
    [bezierPath addLineToPoint: CGPointMake(16.33, 34.63)];
    [bezierPath addLineToPoint: CGPointMake(16.33, 38.32)];
    [bezierPath addLineToPoint: CGPointMake(12.67, 38.32)];
    [bezierPath addLineToPoint: CGPointMake(12.67, 34.63)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(12.67, 27.26)];
    [bezierPath addLineToPoint: CGPointMake(16.33, 27.26)];
    [bezierPath addLineToPoint: CGPointMake(16.33, 30.95)];
    [bezierPath addLineToPoint: CGPointMake(12.67, 30.95)];
    [bezierPath addLineToPoint: CGPointMake(12.67, 27.26)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(12.67, 19.89)];
    [bezierPath addLineToPoint: CGPointMake(16.33, 19.89)];
    [bezierPath addLineToPoint: CGPointMake(16.33, 23.58)];
    [bezierPath addLineToPoint: CGPointMake(12.67, 23.58)];
    [bezierPath addLineToPoint: CGPointMake(12.67, 19.89)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(23.67, 34.63)];
    [bezierPath addLineToPoint: CGPointMake(27.33, 34.63)];
    [bezierPath addLineToPoint: CGPointMake(27.33, 38.32)];
    [bezierPath addLineToPoint: CGPointMake(23.67, 38.32)];
    [bezierPath addLineToPoint: CGPointMake(23.67, 34.63)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(23.67, 27.26)];
    [bezierPath addLineToPoint: CGPointMake(27.33, 27.26)];
    [bezierPath addLineToPoint: CGPointMake(27.33, 30.95)];
    [bezierPath addLineToPoint: CGPointMake(23.67, 30.95)];
    [bezierPath addLineToPoint: CGPointMake(23.67, 27.26)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(23.67, 19.89)];
    [bezierPath addLineToPoint: CGPointMake(27.33, 19.89)];
    [bezierPath addLineToPoint: CGPointMake(27.33, 23.58)];
    [bezierPath addLineToPoint: CGPointMake(23.67, 23.58)];
    [bezierPath addLineToPoint: CGPointMake(23.67, 19.89)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(23.67, 12.53)];
    [bezierPath addLineToPoint: CGPointMake(27.33, 12.53)];
    [bezierPath addLineToPoint: CGPointMake(27.33, 16.21)];
    [bezierPath addLineToPoint: CGPointMake(23.67, 16.21)];
    [bezierPath addLineToPoint: CGPointMake(23.67, 12.53)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(34.67, 34.63)];
    [bezierPath addLineToPoint: CGPointMake(38.33, 34.63)];
    [bezierPath addLineToPoint: CGPointMake(38.33, 38.32)];
    [bezierPath addLineToPoint: CGPointMake(34.67, 38.32)];
    [bezierPath addLineToPoint: CGPointMake(34.67, 34.63)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(34.67, 27.26)];
    [bezierPath addLineToPoint: CGPointMake(38.33, 27.26)];
    [bezierPath addLineToPoint: CGPointMake(38.33, 30.95)];
    [bezierPath addLineToPoint: CGPointMake(34.67, 30.95)];
    [bezierPath addLineToPoint: CGPointMake(34.67, 27.26)];
    [bezierPath closePath];
    [fillColor16 setFill];
    [bezierPath fill];
}

+ (void)drawIconUni
{
    //// Color Declarations
    UIColor* fillColor16 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];

    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(11.64, 26.79)];
    [bezierPath addLineToPoint: CGPointMake(11.64, 34.57)];
    [bezierPath addLineToPoint: CGPointMake(25, 42)];
    [bezierPath addLineToPoint: CGPointMake(38.36, 34.57)];
    [bezierPath addLineToPoint: CGPointMake(38.36, 26.79)];
    [bezierPath addLineToPoint: CGPointMake(25, 34.22)];
    [bezierPath addLineToPoint: CGPointMake(11.64, 26.79)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(25, 7)];
    [bezierPath addLineToPoint: CGPointMake(4, 18.67)];
    [bezierPath addLineToPoint: CGPointMake(25, 30.33)];
    [bezierPath addLineToPoint: CGPointMake(42.18, 20.79)];
    [bezierPath addLineToPoint: CGPointMake(42.18, 34.22)];
    [bezierPath addLineToPoint: CGPointMake(46, 34.22)];
    [bezierPath addLineToPoint: CGPointMake(46, 18.67)];
    [bezierPath addLineToPoint: CGPointMake(25, 7)];
    [bezierPath closePath];
    [fillColor16 setFill];
    [bezierPath fill];
}

+ (void)drawIconStar
{
    //// Color Declarations
    UIColor* fillColor16 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];

    //// Star Drawing
    UIBezierPath* starPath = [UIBezierPath bezierPath];
    [starPath moveToPoint: CGPointMake(25, 6)];
    [starPath addLineToPoint: CGPointMake(29.94, 17.97)];
    [starPath addLineToPoint: CGPointMake(42.48, 19.13)];
    [starPath addLineToPoint: CGPointMake(32.99, 27.68)];
    [starPath addLineToPoint: CGPointMake(35.8, 40.37)];
    [starPath addLineToPoint: CGPointMake(25, 33.69)];
    [starPath addLineToPoint: CGPointMake(14.2, 40.37)];
    [starPath addLineToPoint: CGPointMake(17.01, 27.68)];
    [starPath addLineToPoint: CGPointMake(7.52, 19.13)];
    [starPath addLineToPoint: CGPointMake(20.06, 17.97)];
    [starPath closePath];
    [fillColor16 setFill];
    [starPath fill];
}

+ (void)drawIconParking
{
    //// Color Declarations
    UIColor* fillColor16 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];

    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(26.38, 9)];
    [bezierPath addLineToPoint: CGPointMake(14, 9)];
    [bezierPath addLineToPoint: CGPointMake(14, 41)];
    [bezierPath addLineToPoint: CGPointMake(21.08, 41)];
    [bezierPath addLineToPoint: CGPointMake(21.08, 30.33)];
    [bezierPath addLineToPoint: CGPointMake(26.38, 30.33)];
    [bezierPath addCurveToPoint: CGPointMake(37, 19.67) controlPoint1: CGPointMake(32.24, 30.33) controlPoint2: CGPointMake(37, 25.55)];
    [bezierPath addCurveToPoint: CGPointMake(26.38, 9) controlPoint1: CGPointMake(37, 13.78) controlPoint2: CGPointMake(32.24, 9)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(26.74, 23.22)];
    [bezierPath addLineToPoint: CGPointMake(21.08, 23.22)];
    [bezierPath addLineToPoint: CGPointMake(21.08, 16.11)];
    [bezierPath addLineToPoint: CGPointMake(26.74, 16.11)];
    [bezierPath addCurveToPoint: CGPointMake(30.28, 19.67) controlPoint1: CGPointMake(28.68, 16.11) controlPoint2: CGPointMake(30.28, 17.71)];
    [bezierPath addCurveToPoint: CGPointMake(26.74, 23.22) controlPoint1: CGPointMake(30.28, 21.62) controlPoint2: CGPointMake(28.68, 23.22)];
    [bezierPath closePath];
    [fillColor16 setFill];
    [bezierPath fill];
}

+ (void)drawIconDining
{
    //// Color Declarations
    UIColor* fillColor16 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];

    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(17.62, 26.71)];
    [bezierPath addLineToPoint: CGPointMake(22.84, 21.53)];
    [bezierPath addLineToPoint: CGPointMake(9.9, 8.67)];
    [bezierPath addCurveToPoint: CGPointMake(9.9, 19.05) controlPoint1: CGPointMake(7.02, 11.53) controlPoint2: CGPointMake(7.02, 16.17)];
    [bezierPath addLineToPoint: CGPointMake(17.62, 26.71)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(30.13, 23.4)];
    [bezierPath addCurveToPoint: CGPointMake(39.84, 20.86) controlPoint1: CGPointMake(32.95, 24.7) controlPoint2: CGPointMake(36.91, 23.78)];
    [bezierPath addCurveToPoint: CGPointMake(41.34, 9.64) controlPoint1: CGPointMake(43.37, 17.36) controlPoint2: CGPointMake(44.05, 12.34)];
    [bezierPath addCurveToPoint: CGPointMake(30.05, 11.13) controlPoint1: CGPointMake(38.65, 6.97) controlPoint2: CGPointMake(33.59, 7.63)];
    [bezierPath addCurveToPoint: CGPointMake(27.51, 20.79) controlPoint1: CGPointMake(27.12, 14.04) controlPoint2: CGPointMake(26.2, 17.99)];
    [bezierPath addLineToPoint: CGPointMake(9.51, 38.69)];
    [bezierPath addLineToPoint: CGPointMake(12.11, 41.27)];
    [bezierPath addLineToPoint: CGPointMake(24.82, 28.68)];
    [bezierPath addLineToPoint: CGPointMake(37.5, 41.29)];
    [bezierPath addLineToPoint: CGPointMake(40.1, 38.7)];
    [bezierPath addLineToPoint: CGPointMake(27.42, 26.09)];
    [bezierPath addLineToPoint: CGPointMake(30.13, 23.4)];
    [bezierPath closePath];
    [fillColor16 setFill];
    [bezierPath fill];
}

+ (void)drawIconHotel
{
    //// Color Declarations
    UIColor* fillColor16 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];

    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(17.09, 25.33)];
    [bezierPath addCurveToPoint: CGPointMake(22.14, 20.33) controlPoint1: CGPointMake(19.88, 25.33) controlPoint2: CGPointMake(22.14, 23.1)];
    [bezierPath addCurveToPoint: CGPointMake(17.09, 15.33) controlPoint1: CGPointMake(22.14, 17.57) controlPoint2: CGPointMake(19.88, 15.33)];
    [bezierPath addCurveToPoint: CGPointMake(12.05, 20.33) controlPoint1: CGPointMake(14.3, 15.33) controlPoint2: CGPointMake(12.05, 17.57)];
    [bezierPath addCurveToPoint: CGPointMake(17.09, 25.33) controlPoint1: CGPointMake(12.05, 23.1) controlPoint2: CGPointMake(14.3, 25.33)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(37.27, 15.33)];
    [bezierPath addLineToPoint: CGPointMake(23.82, 15.33)];
    [bezierPath addLineToPoint: CGPointMake(23.82, 27)];
    [bezierPath addLineToPoint: CGPointMake(10.36, 27)];
    [bezierPath addLineToPoint: CGPointMake(10.36, 12)];
    [bezierPath addLineToPoint: CGPointMake(7, 12)];
    [bezierPath addLineToPoint: CGPointMake(7, 37)];
    [bezierPath addLineToPoint: CGPointMake(10.36, 37)];
    [bezierPath addLineToPoint: CGPointMake(10.36, 32)];
    [bezierPath addLineToPoint: CGPointMake(40.64, 32)];
    [bezierPath addLineToPoint: CGPointMake(40.64, 37)];
    [bezierPath addLineToPoint: CGPointMake(44, 37)];
    [bezierPath addLineToPoint: CGPointMake(44, 22)];
    [bezierPath addCurveToPoint: CGPointMake(37.27, 15.33) controlPoint1: CGPointMake(44, 18.32) controlPoint2: CGPointMake(40.99, 15.33)];
    [bezierPath closePath];
    [fillColor16 setFill];
    [bezierPath fill];
}

+ (void)drawIconShop
{
    //// Color Declarations
    UIColor* fillColor16 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];

    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(9, 13)];
    [bezierPath addLineToPoint: CGPointMake(41, 13)];
    [bezierPath addLineToPoint: CGPointMake(41, 9)];
    [bezierPath addLineToPoint: CGPointMake(9, 9)];
    [bezierPath addLineToPoint: CGPointMake(9, 13)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(43, 29)];
    [bezierPath addLineToPoint: CGPointMake(43, 25)];
    [bezierPath addLineToPoint: CGPointMake(41, 15)];
    [bezierPath addLineToPoint: CGPointMake(9, 15)];
    [bezierPath addLineToPoint: CGPointMake(7, 25)];
    [bezierPath addLineToPoint: CGPointMake(7, 29)];
    [bezierPath addLineToPoint: CGPointMake(9, 29)];
    [bezierPath addLineToPoint: CGPointMake(9, 41)];
    [bezierPath addLineToPoint: CGPointMake(29, 41)];
    [bezierPath addLineToPoint: CGPointMake(29, 29)];
    [bezierPath addLineToPoint: CGPointMake(37, 29)];
    [bezierPath addLineToPoint: CGPointMake(37, 41)];
    [bezierPath addLineToPoint: CGPointMake(41, 41)];
    [bezierPath addLineToPoint: CGPointMake(41, 29)];
    [bezierPath addLineToPoint: CGPointMake(43, 29)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(13, 29)];
    [bezierPath addLineToPoint: CGPointMake(25, 29)];
    [bezierPath addLineToPoint: CGPointMake(25, 37)];
    [bezierPath addLineToPoint: CGPointMake(13, 37)];
    [bezierPath addLineToPoint: CGPointMake(13, 29)];
    [bezierPath closePath];
    [fillColor16 setFill];
    [bezierPath fill];
}

+ (void)drawIconTerrain
{
    //// Color Declarations
    UIColor* fillColor16 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];

    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(28.82, 13)];
    [bezierPath addLineToPoint: CGPointMake(21.66, 22.58)];
    [bezierPath addLineToPoint: CGPointMake(27.1, 29.87)];
    [bezierPath addLineToPoint: CGPointMake(24.05, 32.17)];
    [bezierPath addCurveToPoint: CGPointMake(15.45, 20.67) controlPoint1: CGPointMake(20.82, 27.85) controlPoint2: CGPointMake(15.45, 20.67)];
    [bezierPath addLineToPoint: CGPointMake(4, 36)];
    [bezierPath addLineToPoint: CGPointMake(46, 36)];
    [bezierPath addLineToPoint: CGPointMake(28.82, 13)];
    [bezierPath closePath];
    [fillColor16 setFill];
    [bezierPath fill];
}

+ (void)drawIconNature
{
    //// Color Declarations
    UIColor* fillColor16 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];

    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(26.55, 31.21)];
    [bezierPath addCurveToPoint: CGPointMake(37, 19.65) controlPoint1: CGPointMake(32.43, 30.53) controlPoint2: CGPointMake(37, 25.62)];
    [bezierPath addCurveToPoint: CGPointMake(25.14, 8) controlPoint1: CGPointMake(37, 13.21) controlPoint2: CGPointMake(31.7, 8)];
    [bezierPath addCurveToPoint: CGPointMake(13.29, 19.65) controlPoint1: CGPointMake(18.59, 8) controlPoint2: CGPointMake(13.29, 13.21)];
    [bezierPath addCurveToPoint: CGPointMake(23.16, 31.11) controlPoint1: CGPointMake(13.29, 25.42) controlPoint2: CGPointMake(17.56, 30.2)];
    [bezierPath addLineToPoint: CGPointMake(23.16, 37.67)];
    [bezierPath addLineToPoint: CGPointMake(13, 37.67)];
    [bezierPath addLineToPoint: CGPointMake(13, 41)];
    [bezierPath addLineToPoint: CGPointMake(36.71, 41)];
    [bezierPath addLineToPoint: CGPointMake(36.71, 37.67)];
    [bezierPath addLineToPoint: CGPointMake(26.55, 37.67)];
    [bezierPath addLineToPoint: CGPointMake(26.55, 31.21)];
    [bezierPath closePath];
    [fillColor16 setFill];
    [bezierPath fill];
}

+ (void)drawIconPublic
{
    //// Color Declarations
    UIColor* fillColor16 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];

    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(25, 8)];
    [bezierPath addCurveToPoint: CGPointMake(8, 25) controlPoint1: CGPointMake(15.62, 8) controlPoint2: CGPointMake(8, 15.62)];
    [bezierPath addCurveToPoint: CGPointMake(25, 42) controlPoint1: CGPointMake(8, 34.38) controlPoint2: CGPointMake(15.62, 42)];
    [bezierPath addCurveToPoint: CGPointMake(42, 25) controlPoint1: CGPointMake(34.38, 42) controlPoint2: CGPointMake(42, 34.38)];
    [bezierPath addCurveToPoint: CGPointMake(25, 8) controlPoint1: CGPointMake(42, 15.62) controlPoint2: CGPointMake(34.38, 8)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(23.3, 38.48)];
    [bezierPath addCurveToPoint: CGPointMake(11.4, 25) controlPoint1: CGPointMake(16.59, 37.65) controlPoint2: CGPointMake(11.4, 31.94)];
    [bezierPath addCurveToPoint: CGPointMake(11.76, 21.96) controlPoint1: CGPointMake(11.4, 23.95) controlPoint2: CGPointMake(11.54, 22.94)];
    [bezierPath addLineToPoint: CGPointMake(19.9, 30.1)];
    [bezierPath addLineToPoint: CGPointMake(19.9, 31.8)];
    [bezierPath addCurveToPoint: CGPointMake(23.3, 35.2) controlPoint1: CGPointMake(19.9, 33.67) controlPoint2: CGPointMake(21.43, 35.2)];
    [bezierPath addLineToPoint: CGPointMake(23.3, 38.48)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(35.03, 34.16)];
    [bezierPath addCurveToPoint: CGPointMake(31.8, 31.8) controlPoint1: CGPointMake(34.59, 32.79) controlPoint2: CGPointMake(33.33, 31.8)];
    [bezierPath addLineToPoint: CGPointMake(30.1, 31.8)];
    [bezierPath addLineToPoint: CGPointMake(30.1, 26.7)];
    [bezierPath addCurveToPoint: CGPointMake(28.4, 25) controlPoint1: CGPointMake(30.1, 25.76) controlPoint2: CGPointMake(29.34, 25)];
    [bezierPath addLineToPoint: CGPointMake(18.2, 25)];
    [bezierPath addLineToPoint: CGPointMake(18.2, 21.6)];
    [bezierPath addLineToPoint: CGPointMake(21.6, 21.6)];
    [bezierPath addCurveToPoint: CGPointMake(23.3, 19.9) controlPoint1: CGPointMake(22.54, 21.6) controlPoint2: CGPointMake(23.3, 20.83)];
    [bezierPath addLineToPoint: CGPointMake(23.3, 16.5)];
    [bezierPath addLineToPoint: CGPointMake(26.7, 16.5)];
    [bezierPath addCurveToPoint: CGPointMake(30.1, 13.1) controlPoint1: CGPointMake(28.57, 16.5) controlPoint2: CGPointMake(30.1, 14.97)];
    [bezierPath addLineToPoint: CGPointMake(30.1, 12.4)];
    [bezierPath addCurveToPoint: CGPointMake(38.6, 25) controlPoint1: CGPointMake(35.08, 14.43) controlPoint2: CGPointMake(38.6, 19.3)];
    [bezierPath addCurveToPoint: CGPointMake(35.03, 34.16) controlPoint1: CGPointMake(38.6, 28.54) controlPoint2: CGPointMake(37.24, 31.75)];
    [bezierPath closePath];
    [fillColor16 setFill];
    [bezierPath fill];
}

+ (void)drawIconSun
{
    //// Color Declarations
    UIColor* fillColor16 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];

    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(17.16, 14.75)];
    [bezierPath addLineToPoint: CGPointMake(14.3, 11.93)];
    [bezierPath addLineToPoint: CGPointMake(12.06, 14.15)];
    [bezierPath addLineToPoint: CGPointMake(14.9, 16.97)];
    [bezierPath addLineToPoint: CGPointMake(17.16, 14.75)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(8, 26.8)];
    [bezierPath addLineToPoint: CGPointMake(12.77, 26.8)];
    [bezierPath addLineToPoint: CGPointMake(12.77, 23.65)];
    [bezierPath addLineToPoint: CGPointMake(8, 23.65)];
    [bezierPath addLineToPoint: CGPointMake(8, 26.8)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(23.91, 12.64)];
    [bezierPath addLineToPoint: CGPointMake(27.09, 12.64)];
    [bezierPath addLineToPoint: CGPointMake(27.09, 8)];
    [bezierPath addLineToPoint: CGPointMake(23.91, 8)];
    [bezierPath addLineToPoint: CGPointMake(23.91, 12.64)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(38.94, 14.15)];
    [bezierPath addLineToPoint: CGPointMake(36.7, 11.93)];
    [bezierPath addLineToPoint: CGPointMake(33.85, 14.75)];
    [bezierPath addLineToPoint: CGPointMake(36.1, 16.97)];
    [bezierPath addLineToPoint: CGPointMake(38.94, 14.15)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(33.84, 35.7)];
    [bezierPath addLineToPoint: CGPointMake(36.68, 38.53)];
    [bezierPath addLineToPoint: CGPointMake(38.93, 36.32)];
    [bezierPath addLineToPoint: CGPointMake(36.06, 33.5)];
    [bezierPath addLineToPoint: CGPointMake(33.84, 35.7)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(38.23, 26.8)];
    [bezierPath addLineToPoint: CGPointMake(43, 26.8)];
    [bezierPath addLineToPoint: CGPointMake(43, 23.65)];
    [bezierPath addLineToPoint: CGPointMake(38.23, 23.65)];
    [bezierPath addLineToPoint: CGPointMake(38.23, 26.8)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(25.5, 15.79)];
    [bezierPath addCurveToPoint: CGPointMake(15.95, 25.23) controlPoint1: CGPointMake(20.23, 15.79) controlPoint2: CGPointMake(15.95, 20.02)];
    [bezierPath addCurveToPoint: CGPointMake(25.5, 34.66) controlPoint1: CGPointMake(15.95, 30.43) controlPoint2: CGPointMake(20.23, 34.66)];
    [bezierPath addCurveToPoint: CGPointMake(35.05, 25.23) controlPoint1: CGPointMake(30.77, 34.66) controlPoint2: CGPointMake(35.05, 30.43)];
    [bezierPath addCurveToPoint: CGPointMake(25.5, 15.79) controlPoint1: CGPointMake(35.05, 20.02) controlPoint2: CGPointMake(30.77, 15.79)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(23.91, 42.45)];
    [bezierPath addLineToPoint: CGPointMake(27.09, 42.45)];
    [bezierPath addLineToPoint: CGPointMake(27.09, 37.81)];
    [bezierPath addLineToPoint: CGPointMake(23.91, 37.81)];
    [bezierPath addLineToPoint: CGPointMake(23.91, 42.45)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(12.06, 36.3)];
    [bezierPath addLineToPoint: CGPointMake(14.3, 38.52)];
    [bezierPath addLineToPoint: CGPointMake(17.15, 35.69)];
    [bezierPath addLineToPoint: CGPointMake(14.9, 33.47)];
    [bezierPath addLineToPoint: CGPointMake(12.06, 36.3)];
    [bezierPath closePath];
    [fillColor16 setFill];
    [bezierPath fill];
}

+ (void)drawIconSuitcase
{
    //// Color Declarations
    UIColor* fillColor16 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];

    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(38.6, 14.95)];
    [bezierPath addLineToPoint: CGPointMake(33.5, 14.95)];
    [bezierPath addLineToPoint: CGPointMake(33.5, 11.47)];
    [bezierPath addCurveToPoint: CGPointMake(30.1, 8) controlPoint1: CGPointMake(33.5, 9.55) controlPoint2: CGPointMake(31.99, 8)];
    [bezierPath addLineToPoint: CGPointMake(19.9, 8)];
    [bezierPath addCurveToPoint: CGPointMake(16.5, 11.47) controlPoint1: CGPointMake(18.01, 8) controlPoint2: CGPointMake(16.5, 9.55)];
    [bezierPath addLineToPoint: CGPointMake(16.5, 14.95)];
    [bezierPath addLineToPoint: CGPointMake(11.4, 14.95)];
    [bezierPath addCurveToPoint: CGPointMake(8, 18.42) controlPoint1: CGPointMake(9.51, 14.95) controlPoint2: CGPointMake(8, 16.49)];
    [bezierPath addLineToPoint: CGPointMake(8, 37.53)];
    [bezierPath addCurveToPoint: CGPointMake(11.4, 41) controlPoint1: CGPointMake(8, 39.45) controlPoint2: CGPointMake(9.51, 41)];
    [bezierPath addLineToPoint: CGPointMake(38.6, 41)];
    [bezierPath addCurveToPoint: CGPointMake(42, 37.53) controlPoint1: CGPointMake(40.49, 41) controlPoint2: CGPointMake(42, 39.45)];
    [bezierPath addLineToPoint: CGPointMake(42, 18.42)];
    [bezierPath addCurveToPoint: CGPointMake(38.6, 14.95) controlPoint1: CGPointMake(42, 16.49) controlPoint2: CGPointMake(40.49, 14.95)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(19.9, 11.47)];
    [bezierPath addLineToPoint: CGPointMake(30.1, 11.47)];
    [bezierPath addLineToPoint: CGPointMake(30.1, 14.95)];
    [bezierPath addLineToPoint: CGPointMake(19.9, 14.95)];
    [bezierPath addLineToPoint: CGPointMake(19.9, 11.47)];
    [bezierPath closePath];
    [fillColor16 setFill];
    [bezierPath fill];
}

+ (void)drawTrashcan
{
    //// Color Declarations
    UIColor* fillColor16 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];

    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(5, 18)];
    [bezierPath addCurveToPoint: CGPointMake(7, 20) controlPoint1: CGPointMake(5, 19.1) controlPoint2: CGPointMake(5.9, 20)];
    [bezierPath addLineToPoint: CGPointMake(15, 20)];
    [bezierPath addCurveToPoint: CGPointMake(17, 18) controlPoint1: CGPointMake(16.1, 20) controlPoint2: CGPointMake(17, 19.1)];
    [bezierPath addLineToPoint: CGPointMake(17, 6)];
    [bezierPath addLineToPoint: CGPointMake(5, 6)];
    [bezierPath addLineToPoint: CGPointMake(5, 18)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(18, 3)];
    [bezierPath addLineToPoint: CGPointMake(14.5, 3)];
    [bezierPath addLineToPoint: CGPointMake(13.5, 2)];
    [bezierPath addLineToPoint: CGPointMake(8.5, 2)];
    [bezierPath addLineToPoint: CGPointMake(7.5, 3)];
    [bezierPath addLineToPoint: CGPointMake(4, 3)];
    [bezierPath addLineToPoint: CGPointMake(4, 5)];
    [bezierPath addLineToPoint: CGPointMake(18, 5)];
    [bezierPath addLineToPoint: CGPointMake(18, 3)];
    [bezierPath closePath];
    [fillColor16 setFill];
    [bezierPath fill];
}

+ (void)drawThick
{

    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(8, 15.2)];
    [bezierPath addLineToPoint: CGPointMake(3.8, 11)];
    [bezierPath addLineToPoint: CGPointMake(2.4, 12.4)];
    [bezierPath addLineToPoint: CGPointMake(8, 18)];
    [bezierPath addLineToPoint: CGPointMake(20, 6)];
    [bezierPath addLineToPoint: CGPointMake(18.6, 4.6)];
    [bezierPath addLineToPoint: CGPointMake(8, 15.2)];
    [bezierPath closePath];
    [UIColor.whiteColor setFill];
    [bezierPath fill];
}

+ (void)drawUpdate
{

    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(11.25, 14.56)];
    [bezierPath addLineToPoint: CGPointMake(14.8, 11)];
    [bezierPath addLineToPoint: CGPointMake(12.14, 11)];
    [bezierPath addLineToPoint: CGPointMake(12.14, 3)];
    [bezierPath addLineToPoint: CGPointMake(10.36, 3)];
    [bezierPath addLineToPoint: CGPointMake(10.36, 11)];
    [bezierPath addLineToPoint: CGPointMake(7.7, 11)];
    [bezierPath addLineToPoint: CGPointMake(11.25, 14.56)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(19.23, 3)];
    [bezierPath addLineToPoint: CGPointMake(13.91, 3)];
    [bezierPath addLineToPoint: CGPointMake(13.91, 4.77)];
    [bezierPath addLineToPoint: CGPointMake(19.23, 4.77)];
    [bezierPath addLineToPoint: CGPointMake(19.23, 17.24)];
    [bezierPath addLineToPoint: CGPointMake(3.27, 17.24)];
    [bezierPath addLineToPoint: CGPointMake(3.27, 4.77)];
    [bezierPath addLineToPoint: CGPointMake(8.59, 4.77)];
    [bezierPath addLineToPoint: CGPointMake(8.59, 3)];
    [bezierPath addLineToPoint: CGPointMake(3.27, 3)];
    [bezierPath addCurveToPoint: CGPointMake(1.5, 4.78) controlPoint1: CGPointMake(2.3, 3) controlPoint2: CGPointMake(1.5, 3.8)];
    [bezierPath addLineToPoint: CGPointMake(1.5, 17.22)];
    [bezierPath addCurveToPoint: CGPointMake(3.27, 19) controlPoint1: CGPointMake(1.5, 18.2) controlPoint2: CGPointMake(2.3, 19)];
    [bezierPath addLineToPoint: CGPointMake(19.23, 19)];
    [bezierPath addCurveToPoint: CGPointMake(21, 17.22) controlPoint1: CGPointMake(20.2, 19) controlPoint2: CGPointMake(21, 18.2)];
    [bezierPath addLineToPoint: CGPointMake(21, 4.78)];
    [bezierPath addCurveToPoint: CGPointMake(19.23, 3) controlPoint1: CGPointMake(21, 3.8) controlPoint2: CGPointMake(20.2, 3)];
    [bezierPath closePath];
    [UIColor.whiteColor setFill];
    [bezierPath fill];
}

+ (void)drawAccessoryGear
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();

    //// Color Declarations
    UIColor* fillColor9 = [UIColor colorWithRed: 0.687 green: 0.687 blue: 0.687 alpha: 1];

    //// Bezier Drawing
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, 36.86, 36);

    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(7.6, -2.53)];
    [bezierPath addCurveToPoint: CGPointMake(7.7, -4) controlPoint1: CGPointMake(7.66, -3.01) controlPoint2: CGPointMake(7.7, -3.49)];
    [bezierPath addCurveToPoint: CGPointMake(7.6, -5.47) controlPoint1: CGPointMake(7.7, -4.51) controlPoint2: CGPointMake(7.66, -4.99)];
    [bezierPath addLineToPoint: CGPointMake(10.85, -7.94)];
    [bezierPath addCurveToPoint: CGPointMake(11.04, -8.9) controlPoint1: CGPointMake(11.14, -8.17) controlPoint2: CGPointMake(11.22, -8.57)];
    [bezierPath addLineToPoint: CGPointMake(7.95, -14.1)];
    [bezierPath addCurveToPoint: CGPointMake(7.01, -14.43) controlPoint1: CGPointMake(7.77, -14.43) controlPoint2: CGPointMake(7.35, -14.55)];
    [bezierPath addLineToPoint: CGPointMake(3.17, -12.93)];
    [bezierPath addCurveToPoint: CGPointMake(0.56, -14.4) controlPoint1: CGPointMake(2.37, -13.53) controlPoint2: CGPointMake(1.51, -14.02)];
    [bezierPath addLineToPoint: CGPointMake(-0.02, -18.37)];
    [bezierPath addCurveToPoint: CGPointMake(-0.78, -19) controlPoint1: CGPointMake(-0.07, -18.73) controlPoint2: CGPointMake(-0.39, -19)];
    [bezierPath addLineToPoint: CGPointMake(-6.95, -19)];
    [bezierPath addCurveToPoint: CGPointMake(-7.7, -18.37) controlPoint1: CGPointMake(-7.33, -19) controlPoint2: CGPointMake(-7.65, -18.73)];
    [bezierPath addLineToPoint: CGPointMake(-8.29, -14.4)];
    [bezierPath addCurveToPoint: CGPointMake(-10.89, -12.93) controlPoint1: CGPointMake(-9.23, -14.02) controlPoint2: CGPointMake(-10.09, -13.51)];
    [bezierPath addLineToPoint: CGPointMake(-14.73, -14.43)];
    [bezierPath addCurveToPoint: CGPointMake(-15.67, -14.1) controlPoint1: CGPointMake(-15.09, -14.56) controlPoint2: CGPointMake(-15.49, -14.43)];
    [bezierPath addLineToPoint: CGPointMake(-18.76, -8.9)];
    [bezierPath addCurveToPoint: CGPointMake(-18.57, -7.94) controlPoint1: CGPointMake(-18.96, -8.57) controlPoint2: CGPointMake(-18.87, -8.17)];
    [bezierPath addLineToPoint: CGPointMake(-15.32, -5.47)];
    [bezierPath addCurveToPoint: CGPointMake(-15.43, -4) controlPoint1: CGPointMake(-15.38, -4.99) controlPoint2: CGPointMake(-15.43, -4.5)];
    [bezierPath addCurveToPoint: CGPointMake(-15.32, -2.53) controlPoint1: CGPointMake(-15.43, -3.5) controlPoint2: CGPointMake(-15.38, -3.01)];
    [bezierPath addLineToPoint: CGPointMake(-18.57, -0.06)];
    [bezierPath addCurveToPoint: CGPointMake(-18.76, 0.9) controlPoint1: CGPointMake(-18.87, 0.17) controlPoint2: CGPointMake(-18.94, 0.57)];
    [bezierPath addLineToPoint: CGPointMake(-15.67, 6.1)];
    [bezierPath addCurveToPoint: CGPointMake(-14.73, 6.43) controlPoint1: CGPointMake(-15.49, 6.43) controlPoint2: CGPointMake(-15.07, 6.55)];
    [bezierPath addLineToPoint: CGPointMake(-10.89, 4.93)];
    [bezierPath addCurveToPoint: CGPointMake(-8.29, 6.4) controlPoint1: CGPointMake(-10.09, 5.53) controlPoint2: CGPointMake(-9.23, 6.02)];
    [bezierPath addLineToPoint: CGPointMake(-7.7, 10.37)];
    [bezierPath addCurveToPoint: CGPointMake(-6.95, 11) controlPoint1: CGPointMake(-7.65, 10.73) controlPoint2: CGPointMake(-7.33, 11)];
    [bezierPath addLineToPoint: CGPointMake(-0.78, 11)];
    [bezierPath addCurveToPoint: CGPointMake(-0.02, 10.37) controlPoint1: CGPointMake(-0.39, 11) controlPoint2: CGPointMake(-0.07, 10.73)];
    [bezierPath addLineToPoint: CGPointMake(0.56, 6.4)];
    [bezierPath addCurveToPoint: CGPointMake(3.17, 4.93) controlPoint1: CGPointMake(1.51, 6.02) controlPoint2: CGPointMake(2.37, 5.51)];
    [bezierPath addLineToPoint: CGPointMake(7.01, 6.43)];
    [bezierPath addCurveToPoint: CGPointMake(7.95, 6.1) controlPoint1: CGPointMake(7.37, 6.56) controlPoint2: CGPointMake(7.77, 6.43)];
    [bezierPath addLineToPoint: CGPointMake(11.04, 0.9)];
    [bezierPath addCurveToPoint: CGPointMake(10.85, -0.06) controlPoint1: CGPointMake(11.22, 0.57) controlPoint2: CGPointMake(11.14, 0.17)];
    [bezierPath addLineToPoint: CGPointMake(7.6, -2.53)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(-3.86, 1.25)];
    [bezierPath addCurveToPoint: CGPointMake(-9.26, -4) controlPoint1: CGPointMake(-6.84, 1.25) controlPoint2: CGPointMake(-9.26, -1.11)];
    [bezierPath addCurveToPoint: CGPointMake(-3.86, -9.25) controlPoint1: CGPointMake(-9.26, -6.89) controlPoint2: CGPointMake(-6.84, -9.25)];
    [bezierPath addCurveToPoint: CGPointMake(1.54, -4) controlPoint1: CGPointMake(-0.89, -9.25) controlPoint2: CGPointMake(1.54, -6.89)];
    [bezierPath addCurveToPoint: CGPointMake(-3.86, 1.25) controlPoint1: CGPointMake(1.54, -1.11) controlPoint2: CGPointMake(-0.89, 1.25)];
    [bezierPath closePath];
    [fillColor9 setFill];
    [bezierPath fill];

    CGContextRestoreGState(context);
}

+ (void)drawSettingsIcon
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();

    //// Color Declarations
    UIColor* fillColor = [UIColor colorWithRed: 0.333 green: 0.333 blue: 0.333 alpha: 1];

    //// Bezier Drawing
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, 24, 24);

    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(14.67, 1.31)];
    [bezierPath addCurveToPoint: CGPointMake(14.8, -0.5) controlPoint1: CGPointMake(14.74, 0.72) controlPoint2: CGPointMake(14.8, 0.13)];
    [bezierPath addCurveToPoint: CGPointMake(14.67, -2.31) controlPoint1: CGPointMake(14.8, -1.13) controlPoint2: CGPointMake(14.74, -1.72)];
    [bezierPath addLineToPoint: CGPointMake(18.65, -5.37)];
    [bezierPath addCurveToPoint: CGPointMake(18.88, -6.55) controlPoint1: CGPointMake(19.01, -5.64) controlPoint2: CGPointMake(19.1, -6.14)];
    [bezierPath addLineToPoint: CGPointMake(15.1, -12.95)];
    [bezierPath addCurveToPoint: CGPointMake(13.95, -13.36) controlPoint1: CGPointMake(14.87, -13.36) controlPoint2: CGPointMake(14.37, -13.51)];
    [bezierPath addLineToPoint: CGPointMake(9.25, -11.51)];
    [bezierPath addCurveToPoint: CGPointMake(6.06, -13.32) controlPoint1: CGPointMake(8.27, -12.25) controlPoint2: CGPointMake(7.21, -12.86)];
    [bezierPath addLineToPoint: CGPointMake(5.34, -18.22)];
    [bezierPath addCurveToPoint: CGPointMake(4.42, -19) controlPoint1: CGPointMake(5.28, -18.67) controlPoint2: CGPointMake(4.89, -19)];
    [bezierPath addLineToPoint: CGPointMake(-3.14, -19)];
    [bezierPath addCurveToPoint: CGPointMake(-4.06, -18.22) controlPoint1: CGPointMake(-3.61, -19) controlPoint2: CGPointMake(-4, -18.67)];
    [bezierPath addLineToPoint: CGPointMake(-4.78, -13.32)];
    [bezierPath addCurveToPoint: CGPointMake(-7.97, -11.51) controlPoint1: CGPointMake(-5.93, -12.86) controlPoint2: CGPointMake(-6.99, -12.23)];
    [bezierPath addLineToPoint: CGPointMake(-12.67, -13.36)];
    [bezierPath addCurveToPoint: CGPointMake(-13.82, -12.95) controlPoint1: CGPointMake(-13.11, -13.52) controlPoint2: CGPointMake(-13.6, -13.36)];
    [bezierPath addLineToPoint: CGPointMake(-17.6, -6.55)];
    [bezierPath addCurveToPoint: CGPointMake(-17.37, -5.37) controlPoint1: CGPointMake(-17.84, -6.14) controlPoint2: CGPointMake(-17.73, -5.64)];
    [bezierPath addLineToPoint: CGPointMake(-13.39, -2.31)];
    [bezierPath addCurveToPoint: CGPointMake(-13.52, -0.5) controlPoint1: CGPointMake(-13.46, -1.72) controlPoint2: CGPointMake(-13.52, -1.11)];
    [bezierPath addCurveToPoint: CGPointMake(-13.39, 1.31) controlPoint1: CGPointMake(-13.52, 0.11) controlPoint2: CGPointMake(-13.46, 0.72)];
    [bezierPath addLineToPoint: CGPointMake(-17.37, 4.37)];
    [bezierPath addCurveToPoint: CGPointMake(-17.6, 5.55) controlPoint1: CGPointMake(-17.73, 4.64) controlPoint2: CGPointMake(-17.82, 5.14)];
    [bezierPath addLineToPoint: CGPointMake(-13.82, 11.95)];
    [bezierPath addCurveToPoint: CGPointMake(-12.67, 12.36) controlPoint1: CGPointMake(-13.6, 12.36) controlPoint2: CGPointMake(-13.09, 12.51)];
    [bezierPath addLineToPoint: CGPointMake(-7.97, 10.51)];
    [bezierPath addCurveToPoint: CGPointMake(-4.78, 12.32) controlPoint1: CGPointMake(-6.99, 11.25) controlPoint2: CGPointMake(-5.93, 11.86)];
    [bezierPath addLineToPoint: CGPointMake(-4.06, 17.22)];
    [bezierPath addCurveToPoint: CGPointMake(-3.14, 18) controlPoint1: CGPointMake(-4, 17.67) controlPoint2: CGPointMake(-3.61, 18)];
    [bezierPath addLineToPoint: CGPointMake(4.42, 18)];
    [bezierPath addCurveToPoint: CGPointMake(5.34, 17.22) controlPoint1: CGPointMake(4.89, 18) controlPoint2: CGPointMake(5.28, 17.67)];
    [bezierPath addLineToPoint: CGPointMake(6.06, 12.32)];
    [bezierPath addCurveToPoint: CGPointMake(9.25, 10.51) controlPoint1: CGPointMake(7.21, 11.86) controlPoint2: CGPointMake(8.27, 11.23)];
    [bezierPath addLineToPoint: CGPointMake(13.95, 12.36)];
    [bezierPath addCurveToPoint: CGPointMake(15.1, 11.95) controlPoint1: CGPointMake(14.38, 12.52) controlPoint2: CGPointMake(14.87, 12.36)];
    [bezierPath addLineToPoint: CGPointMake(18.88, 5.55)];
    [bezierPath addCurveToPoint: CGPointMake(18.65, 4.37) controlPoint1: CGPointMake(19.1, 5.14) controlPoint2: CGPointMake(19.01, 4.64)];
    [bezierPath addLineToPoint: CGPointMake(14.67, 1.31)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(0.64, 5.97)];
    [bezierPath addCurveToPoint: CGPointMake(-5.97, -0.5) controlPoint1: CGPointMake(-3, 5.97) controlPoint2: CGPointMake(-5.97, 3.07)];
    [bezierPath addCurveToPoint: CGPointMake(0.64, -6.97) controlPoint1: CGPointMake(-5.97, -4.07) controlPoint2: CGPointMake(-3, -6.97)];
    [bezierPath addCurveToPoint: CGPointMake(7.25, -0.5) controlPoint1: CGPointMake(4.28, -6.97) controlPoint2: CGPointMake(7.25, -4.07)];
    [bezierPath addCurveToPoint: CGPointMake(0.64, 5.97) controlPoint1: CGPointMake(7.25, 3.07) controlPoint2: CGPointMake(4.28, 5.97)];
    [bezierPath closePath];
    [fillColor setFill];
    [bezierPath fill];

    CGContextRestoreGState(context);
}

+ (void)drawAboutIcon
{
    //// Color Declarations
    UIColor* fillColor = [UIColor colorWithRed: 0.333 green: 0.333 blue: 0.333 alpha: 1];

    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(24, 5)];
    [bezierPath addCurveToPoint: CGPointMake(5, 24) controlPoint1: CGPointMake(13.51, 5) controlPoint2: CGPointMake(5, 13.51)];
    [bezierPath addCurveToPoint: CGPointMake(24, 43) controlPoint1: CGPointMake(5, 34.49) controlPoint2: CGPointMake(13.51, 43)];
    [bezierPath addCurveToPoint: CGPointMake(43, 24) controlPoint1: CGPointMake(34.49, 43) controlPoint2: CGPointMake(43, 34.49)];
    [bezierPath addCurveToPoint: CGPointMake(24, 5) controlPoint1: CGPointMake(43, 13.51) controlPoint2: CGPointMake(34.49, 5)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(22.1, 33.5)];
    [bezierPath addLineToPoint: CGPointMake(25.9, 33.5)];
    [bezierPath addLineToPoint: CGPointMake(25.9, 37.3)];
    [bezierPath addLineToPoint: CGPointMake(22.1, 37.3)];
    [bezierPath addLineToPoint: CGPointMake(22.1, 33.5)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(29.83, 22.57)];
    [bezierPath addLineToPoint: CGPointMake(28.12, 24.32)];
    [bezierPath addCurveToPoint: CGPointMake(25.9, 29.7) controlPoint1: CGPointMake(26.75, 25.71) controlPoint2: CGPointMake(25.9, 26.85)];
    [bezierPath addLineToPoint: CGPointMake(22.1, 29.7)];
    [bezierPath addLineToPoint: CGPointMake(22.1, 28.75)];
    [bezierPath addCurveToPoint: CGPointMake(24.32, 23.37) controlPoint1: CGPointMake(22.1, 26.66) controlPoint2: CGPointMake(22.96, 24.76)];
    [bezierPath addLineToPoint: CGPointMake(26.68, 20.98)];
    [bezierPath addCurveToPoint: CGPointMake(27.8, 18.3) controlPoint1: CGPointMake(27.38, 20.29) controlPoint2: CGPointMake(27.8, 19.34)];
    [bezierPath addCurveToPoint: CGPointMake(24, 14.5) controlPoint1: CGPointMake(27.8, 16.21) controlPoint2: CGPointMake(26.09, 14.5)];
    [bezierPath addCurveToPoint: CGPointMake(20.2, 18.3) controlPoint1: CGPointMake(21.91, 14.5) controlPoint2: CGPointMake(20.2, 16.21)];
    [bezierPath addLineToPoint: CGPointMake(16.4, 18.3)];
    [bezierPath addCurveToPoint: CGPointMake(24, 10.7) controlPoint1: CGPointMake(16.4, 14.1) controlPoint2: CGPointMake(19.8, 10.7)];
    [bezierPath addCurveToPoint: CGPointMake(31.6, 18.3) controlPoint1: CGPointMake(28.2, 10.7) controlPoint2: CGPointMake(31.6, 14.1)];
    [bezierPath addCurveToPoint: CGPointMake(29.83, 22.57) controlPoint1: CGPointMake(31.6, 19.97) controlPoint2: CGPointMake(30.92, 21.49)];
    [bezierPath closePath];
    [fillColor setFill];
    [bezierPath fill];
}

+ (void)drawShareIcon
{
    //// Color Declarations
    UIColor* fillColor = [UIColor colorWithRed: 0.333 green: 0.333 blue: 0.333 alpha: 1];

    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(35.33, 31.8)];
    [bezierPath addCurveToPoint: CGPointMake(31.63, 33.27) controlPoint1: CGPointMake(33.9, 31.8) controlPoint2: CGPointMake(32.61, 32.37)];
    [bezierPath addLineToPoint: CGPointMake(18.16, 25.37)];
    [bezierPath addCurveToPoint: CGPointMake(18.33, 24.04) controlPoint1: CGPointMake(18.26, 24.93) controlPoint2: CGPointMake(18.33, 24.49)];
    [bezierPath addCurveToPoint: CGPointMake(18.16, 22.7) controlPoint1: CGPointMake(18.33, 23.58) controlPoint2: CGPointMake(18.26, 23.14)];
    [bezierPath addLineToPoint: CGPointMake(31.48, 14.88)];
    [bezierPath addCurveToPoint: CGPointMake(35.33, 16.42) controlPoint1: CGPointMake(32.5, 15.83) controlPoint2: CGPointMake(33.84, 16.42)];
    [bezierPath addCurveToPoint: CGPointMake(41, 10.71) controlPoint1: CGPointMake(38.47, 16.42) controlPoint2: CGPointMake(41, 13.87)];
    [bezierPath addCurveToPoint: CGPointMake(35.33, 5) controlPoint1: CGPointMake(41, 7.55) controlPoint2: CGPointMake(38.47, 5)];
    [bezierPath addCurveToPoint: CGPointMake(29.67, 10.71) controlPoint1: CGPointMake(32.2, 5) controlPoint2: CGPointMake(29.67, 7.55)];
    [bezierPath addCurveToPoint: CGPointMake(29.84, 12.04) controlPoint1: CGPointMake(29.67, 11.17) controlPoint2: CGPointMake(29.74, 11.61)];
    [bezierPath addLineToPoint: CGPointMake(16.52, 19.87)];
    [bezierPath addCurveToPoint: CGPointMake(12.67, 18.33) controlPoint1: CGPointMake(15.5, 18.92) controlPoint2: CGPointMake(14.16, 18.33)];
    [bezierPath addCurveToPoint: CGPointMake(7, 24.04) controlPoint1: CGPointMake(9.53, 18.33) controlPoint2: CGPointMake(7, 20.88)];
    [bezierPath addCurveToPoint: CGPointMake(12.67, 29.75) controlPoint1: CGPointMake(7, 27.2) controlPoint2: CGPointMake(9.53, 29.75)];
    [bezierPath addCurveToPoint: CGPointMake(16.52, 28.21) controlPoint1: CGPointMake(14.16, 29.75) controlPoint2: CGPointMake(15.5, 29.16)];
    [bezierPath addLineToPoint: CGPointMake(29.97, 36.12)];
    [bezierPath addCurveToPoint: CGPointMake(29.82, 37.36) controlPoint1: CGPointMake(29.87, 36.52) controlPoint2: CGPointMake(29.82, 36.94)];
    [bezierPath addCurveToPoint: CGPointMake(35.33, 42.92) controlPoint1: CGPointMake(29.82, 40.43) controlPoint2: CGPointMake(32.29, 42.92)];
    [bezierPath addCurveToPoint: CGPointMake(40.85, 37.36) controlPoint1: CGPointMake(38.37, 42.92) controlPoint2: CGPointMake(40.85, 40.43)];
    [bezierPath addCurveToPoint: CGPointMake(35.33, 31.8) controlPoint1: CGPointMake(40.85, 34.3) controlPoint2: CGPointMake(38.37, 31.8)];
    [bezierPath closePath];
    [fillColor setFill];
    [bezierPath fill];
}

+ (void)drawDeveloperOptionsIcon
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();

    //// Color Declarations
    UIColor* fillColor = [UIColor colorWithRed: 0.333 green: 0.333 blue: 0.333 alpha: 1];
    UIColor* fillColor8 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];

    //// Group 2
    {
        //// Rectangle Drawing
        UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(7, 6, 35, 35) cornerRadius: 2];
        [fillColor setFill];
        [rectanglePath fill];


        //// Bezier Drawing
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake(31.88, 31.19)];
        [bezierPath addLineToPoint: CGPointMake(39.57, 23.5)];
        [bezierPath addLineToPoint: CGPointMake(31.88, 15.81)];
        [bezierPath addLineToPoint: CGPointMake(29.52, 18.19)];
        [bezierPath addLineToPoint: CGPointMake(34.83, 23.5)];
        [bezierPath addLineToPoint: CGPointMake(29.52, 28.81)];
        [bezierPath addLineToPoint: CGPointMake(31.88, 31.19)];
        [bezierPath closePath];
        [fillColor8 setFill];
        [bezierPath fill];


        //// Bezier 2 Drawing
        UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
        [bezier2Path moveToPoint: CGPointMake(19.48, 28.81)];
        [bezier2Path addLineToPoint: CGPointMake(14.17, 23.5)];
        [bezier2Path addLineToPoint: CGPointMake(19.48, 18.19)];
        [bezier2Path addLineToPoint: CGPointMake(17.11, 15.81)];
        [bezier2Path addLineToPoint: CGPointMake(9.43, 23.5)];
        [bezier2Path addLineToPoint: CGPointMake(17.11, 31.19)];
        [bezier2Path addLineToPoint: CGPointMake(19.48, 28.81)];
        [bezier2Path closePath];
        [fillColor8 setFill];
        [bezier2Path fill];


        //// Rectangle 2 Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 24.5, 23.5);
        CGContextRotateCTM(context, 15 * M_PI / 180);

        UIBezierPath* rectangle2Path = [UIBezierPath bezierPathWithRect: CGRectMake(-1.65, -14.19, 3.31, 28.39)];
        [fillColor8 setFill];
        [rectangle2Path fill];

        CGContextRestoreGState(context);
    }
}

+ (void)drawBluetooth_on
{
    //// Color Declarations
    UIColor* fillColor50 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 0.863];
    UIColor* fillColor54 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 0.302];

    //// Group 2
    {
        //// Bezier Drawing
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake(25.16, 25.75)];
        [bezierPath addLineToPoint: CGPointMake(25.16, 31.13)];
        [bezierPath addLineToPoint: CGPointMake(27.85, 28.44)];
        [bezierPath addLineToPoint: CGPointMake(25.16, 25.75)];
        [bezierPath closePath];
        [bezierPath moveToPoint: CGPointMake(25.16, 13.47)];
        [bezierPath addLineToPoint: CGPointMake(25.16, 18.85)];
        [bezierPath addLineToPoint: CGPointMake(27.85, 16.16)];
        [bezierPath addLineToPoint: CGPointMake(25.16, 13.47)];
        [bezierPath closePath];
        [bezierPath moveToPoint: CGPointMake(22.3, 18.85)];
        [bezierPath addLineToPoint: CGPointMake(22.3, 7.99)];
        [bezierPath addLineToPoint: CGPointMake(23.73, 7.99)];
        [bezierPath addLineToPoint: CGPointMake(31.9, 16.16)];
        [bezierPath addLineToPoint: CGPointMake(25.75, 22.3)];
        [bezierPath addLineToPoint: CGPointMake(31.9, 28.44)];
        [bezierPath addLineToPoint: CGPointMake(23.73, 36.61)];
        [bezierPath addLineToPoint: CGPointMake(22.3, 36.61)];
        [bezierPath addLineToPoint: CGPointMake(22.3, 25.75)];
        [bezierPath addLineToPoint: CGPointMake(15.74, 32.31)];
        [bezierPath addLineToPoint: CGPointMake(13.72, 30.3)];
        [bezierPath addLineToPoint: CGPointMake(21.72, 22.3)];
        [bezierPath addLineToPoint: CGPointMake(13.72, 14.3)];
        [bezierPath addLineToPoint: CGPointMake(15.74, 12.29)];
        [bezierPath addLineToPoint: CGPointMake(22.3, 18.85)];
        [bezierPath closePath];
        [bezierPath moveToPoint: CGPointMake(22.79, 1.19)];
        [bezierPath addCurveToPoint: CGPointMake(1.7, 22.3) controlPoint1: CGPointMake(11.13, 1.19) controlPoint2: CGPointMake(1.7, 10.65)];
        [bezierPath addCurveToPoint: CGPointMake(22.79, 43.41) controlPoint1: CGPointMake(1.7, 33.95) controlPoint2: CGPointMake(11.13, 43.41)];
        [bezierPath addCurveToPoint: CGPointMake(43.92, 22.3) controlPoint1: CGPointMake(34.46, 43.41) controlPoint2: CGPointMake(43.92, 33.95)];
        [bezierPath addCurveToPoint: CGPointMake(22.79, 1.19) controlPoint1: CGPointMake(43.92, 10.65) controlPoint2: CGPointMake(34.46, 1.19)];
        [bezierPath closePath];
        [fillColor54 setFill];
        [bezierPath fill];


        //// Bezier 2 Drawing
        UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
        [bezier2Path moveToPoint: CGPointMake(25.16, 31.13)];
        [bezier2Path addLineToPoint: CGPointMake(25.16, 25.75)];
        [bezier2Path addLineToPoint: CGPointMake(27.85, 28.44)];
        [bezier2Path addLineToPoint: CGPointMake(25.16, 31.13)];
        [bezier2Path closePath];
        [bezier2Path moveToPoint: CGPointMake(25.16, 18.85)];
        [bezier2Path addLineToPoint: CGPointMake(25.16, 13.47)];
        [bezier2Path addLineToPoint: CGPointMake(27.85, 16.16)];
        [bezier2Path addLineToPoint: CGPointMake(25.16, 18.85)];
        [bezier2Path closePath];
        [bezier2Path moveToPoint: CGPointMake(23.73, 7.99)];
        [bezier2Path addLineToPoint: CGPointMake(22.3, 7.99)];
        [bezier2Path addLineToPoint: CGPointMake(22.3, 18.85)];
        [bezier2Path addLineToPoint: CGPointMake(15.74, 12.29)];
        [bezier2Path addLineToPoint: CGPointMake(13.72, 14.3)];
        [bezier2Path addLineToPoint: CGPointMake(21.72, 22.3)];
        [bezier2Path addLineToPoint: CGPointMake(13.72, 30.3)];
        [bezier2Path addLineToPoint: CGPointMake(15.74, 32.31)];
        [bezier2Path addLineToPoint: CGPointMake(22.3, 25.75)];
        [bezier2Path addLineToPoint: CGPointMake(22.3, 36.61)];
        [bezier2Path addLineToPoint: CGPointMake(23.73, 36.61)];
        [bezier2Path addLineToPoint: CGPointMake(31.9, 28.44)];
        [bezier2Path addLineToPoint: CGPointMake(25.75, 22.3)];
        [bezier2Path addLineToPoint: CGPointMake(31.9, 16.16)];
        [bezier2Path addLineToPoint: CGPointMake(23.73, 7.99)];
        [bezier2Path closePath];
        [fillColor50 setFill];
        [bezier2Path fill];
    }
}

+ (void)drawBluetooth_off
{
    //// Color Declarations
    UIColor* fillColor57 = [UIColor colorWithRed: 1 green: 1 blue: 0.996 alpha: 0.302];

    //// Group 2
    {
        //// Bezier Drawing
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake(15.67, 32.29)];
        [bezierPath addLineToPoint: CGPointMake(13.66, 30.28)];
        [bezierPath addLineToPoint: CGPointMake(21.64, 22.3)];
        [bezierPath addLineToPoint: CGPointMake(12.23, 12.89)];
        [bezierPath addLineToPoint: CGPointMake(14.24, 10.88)];
        [bezierPath addLineToPoint: CGPointMake(35.07, 31.71)];
        [bezierPath addLineToPoint: CGPointMake(33.06, 33.72)];
        [bezierPath addLineToPoint: CGPointMake(29.78, 30.45)];
        [bezierPath addLineToPoint: CGPointMake(23.65, 36.58)];
        [bezierPath addLineToPoint: CGPointMake(22.22, 36.58)];
        [bezierPath addLineToPoint: CGPointMake(22.22, 25.74)];
        [bezierPath addLineToPoint: CGPointMake(15.67, 32.29)];
        [bezierPath closePath];
        [bezierPath moveToPoint: CGPointMake(25.08, 18.06)];
        [bezierPath addLineToPoint: CGPointMake(22.22, 15.2)];
        [bezierPath addLineToPoint: CGPointMake(22.22, 8.02)];
        [bezierPath addLineToPoint: CGPointMake(23.65, 8.02)];
        [bezierPath addLineToPoint: CGPointMake(31.8, 16.16)];
        [bezierPath addLineToPoint: CGPointMake(27.49, 20.47)];
        [bezierPath addLineToPoint: CGPointMake(25.48, 18.46)];
        [bezierPath addLineToPoint: CGPointMake(27.76, 16.17)];
        [bezierPath addLineToPoint: CGPointMake(25.08, 13.49)];
        [bezierPath addLineToPoint: CGPointMake(25.08, 18.06)];
        [bezierPath closePath];
        [bezierPath moveToPoint: CGPointMake(22.79, 1.19)];
        [bezierPath addCurveToPoint: CGPointMake(1.7, 22.3) controlPoint1: CGPointMake(11.13, 1.19) controlPoint2: CGPointMake(1.7, 10.65)];
        [bezierPath addCurveToPoint: CGPointMake(22.79, 43.41) controlPoint1: CGPointMake(1.7, 33.95) controlPoint2: CGPointMake(11.13, 43.41)];
        [bezierPath addCurveToPoint: CGPointMake(43.92, 22.3) controlPoint1: CGPointMake(34.46, 43.41) controlPoint2: CGPointMake(43.92, 33.95)];
        [bezierPath addCurveToPoint: CGPointMake(22.79, 1.19) controlPoint1: CGPointMake(43.92, 10.65) controlPoint2: CGPointMake(34.46, 1.19)];
        [bezierPath closePath];
        [fillColor57 setFill];
        [bezierPath fill];


        //// Bezier 2 Drawing
        UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
        [bezier2Path moveToPoint: CGPointMake(25.08, 25.74)];
        [bezier2Path addLineToPoint: CGPointMake(25.08, 31.11)];
        [bezier2Path addLineToPoint: CGPointMake(27.76, 28.43)];
        [bezier2Path addLineToPoint: CGPointMake(25.08, 25.74)];
        [bezier2Path closePath];
        [fillColor57 setFill];
        [bezier2Path fill];
    }
}

+ (void)drawCloud_on
{
    //// Color Declarations
    UIColor* fillColor13 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 0.302];
    UIColor* fillColor50 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 0.863];

    //// Group 2
    {
        //// Bezier Drawing
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake(22.81, 14.3)];
        [bezierPath addCurveToPoint: CGPointMake(15.75, 19.63) controlPoint1: CGPointMake(19.45, 14.3) controlPoint2: CGPointMake(16.63, 16.55)];
        [bezierPath addLineToPoint: CGPointMake(14.81, 19.63)];
        [bezierPath addCurveToPoint: CGPointMake(9.47, 24.97) controlPoint1: CGPointMake(11.86, 19.63) controlPoint2: CGPointMake(9.47, 22.02)];
        [bezierPath addCurveToPoint: CGPointMake(14.81, 30.3) controlPoint1: CGPointMake(9.47, 27.91) controlPoint2: CGPointMake(11.86, 30.3)];
        [bezierPath addLineToPoint: CGPointMake(32.15, 30.3)];
        [bezierPath addCurveToPoint: CGPointMake(36.15, 26.3) controlPoint1: CGPointMake(34.36, 30.3) controlPoint2: CGPointMake(36.15, 28.52)];
        [bezierPath addCurveToPoint: CGPointMake(32.15, 22.3) controlPoint1: CGPointMake(36.15, 24.09) controlPoint2: CGPointMake(34.36, 22.3)];
        [bezierPath addLineToPoint: CGPointMake(30.15, 22.3)];
        [bezierPath addLineToPoint: CGPointMake(30.15, 21.63)];
        [bezierPath addCurveToPoint: CGPointMake(22.81, 14.3) controlPoint1: CGPointMake(30.15, 17.58) controlPoint2: CGPointMake(26.86, 14.3)];
        [bezierPath closePath];
        [bezierPath moveToPoint: CGPointMake(14.81, 32.97)];
        [bezierPath addCurveToPoint: CGPointMake(6.8, 24.97) controlPoint1: CGPointMake(10.39, 32.97) controlPoint2: CGPointMake(6.8, 29.38)];
        [bezierPath addCurveToPoint: CGPointMake(13.94, 17.02) controlPoint1: CGPointMake(6.8, 20.85) controlPoint2: CGPointMake(9.92, 17.45)];
        [bezierPath addCurveToPoint: CGPointMake(22.81, 11.63) controlPoint1: CGPointMake(15.61, 13.82) controlPoint2: CGPointMake(18.96, 11.63)];
        [bezierPath addCurveToPoint: CGPointMake(32.61, 19.69) controlPoint1: CGPointMake(27.66, 11.63) controlPoint2: CGPointMake(31.71, 15.08)];
        [bezierPath addCurveToPoint: CGPointMake(38.82, 26.3) controlPoint1: CGPointMake(36.08, 19.93) controlPoint2: CGPointMake(38.82, 22.78)];
        [bezierPath addCurveToPoint: CGPointMake(32.15, 32.97) controlPoint1: CGPointMake(38.82, 29.98) controlPoint2: CGPointMake(35.83, 32.97)];
        [bezierPath addLineToPoint: CGPointMake(14.81, 32.97)];
        [bezierPath closePath];
        [bezierPath moveToPoint: CGPointMake(22.79, 1.19)];
        [bezierPath addCurveToPoint: CGPointMake(1.7, 22.3) controlPoint1: CGPointMake(11.13, 1.19) controlPoint2: CGPointMake(1.7, 10.65)];
        [bezierPath addCurveToPoint: CGPointMake(22.79, 43.41) controlPoint1: CGPointMake(1.7, 33.95) controlPoint2: CGPointMake(11.13, 43.41)];
        [bezierPath addCurveToPoint: CGPointMake(43.92, 22.3) controlPoint1: CGPointMake(34.46, 43.41) controlPoint2: CGPointMake(43.92, 33.95)];
        [bezierPath addCurveToPoint: CGPointMake(22.79, 1.19) controlPoint1: CGPointMake(43.92, 10.65) controlPoint2: CGPointMake(34.46, 1.19)];
        [bezierPath closePath];
        [fillColor13 setFill];
        [bezierPath fill];


        //// Bezier 2 Drawing
        UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
        [bezier2Path moveToPoint: CGPointMake(14.81, 30.3)];
        [bezier2Path addCurveToPoint: CGPointMake(9.47, 24.97) controlPoint1: CGPointMake(11.86, 30.3) controlPoint2: CGPointMake(9.47, 27.91)];
        [bezier2Path addCurveToPoint: CGPointMake(14.81, 19.63) controlPoint1: CGPointMake(9.47, 22.02) controlPoint2: CGPointMake(11.86, 19.63)];
        [bezier2Path addLineToPoint: CGPointMake(15.75, 19.63)];
        [bezier2Path addCurveToPoint: CGPointMake(22.81, 14.3) controlPoint1: CGPointMake(16.63, 16.55) controlPoint2: CGPointMake(19.45, 14.3)];
        [bezier2Path addCurveToPoint: CGPointMake(30.15, 21.63) controlPoint1: CGPointMake(26.86, 14.3) controlPoint2: CGPointMake(30.15, 17.58)];
        [bezier2Path addLineToPoint: CGPointMake(30.15, 22.3)];
        [bezier2Path addLineToPoint: CGPointMake(32.15, 22.3)];
        [bezier2Path addCurveToPoint: CGPointMake(36.15, 26.3) controlPoint1: CGPointMake(34.36, 22.3) controlPoint2: CGPointMake(36.15, 24.09)];
        [bezier2Path addCurveToPoint: CGPointMake(32.15, 30.3) controlPoint1: CGPointMake(36.15, 28.52) controlPoint2: CGPointMake(34.36, 30.3)];
        [bezier2Path addLineToPoint: CGPointMake(14.81, 30.3)];
        [bezier2Path closePath];
        [bezier2Path moveToPoint: CGPointMake(22.81, 11.63)];
        [bezier2Path addCurveToPoint: CGPointMake(13.94, 17.02) controlPoint1: CGPointMake(18.96, 11.63) controlPoint2: CGPointMake(15.61, 13.82)];
        [bezier2Path addCurveToPoint: CGPointMake(6.8, 24.97) controlPoint1: CGPointMake(9.92, 17.45) controlPoint2: CGPointMake(6.8, 20.85)];
        [bezier2Path addCurveToPoint: CGPointMake(14.81, 32.97) controlPoint1: CGPointMake(6.8, 29.38) controlPoint2: CGPointMake(10.39, 32.97)];
        [bezier2Path addLineToPoint: CGPointMake(32.15, 32.97)];
        [bezier2Path addCurveToPoint: CGPointMake(38.82, 26.3) controlPoint1: CGPointMake(35.83, 32.97) controlPoint2: CGPointMake(38.82, 29.98)];
        [bezier2Path addCurveToPoint: CGPointMake(32.61, 19.69) controlPoint1: CGPointMake(38.82, 22.78) controlPoint2: CGPointMake(36.08, 19.93)];
        [bezier2Path addCurveToPoint: CGPointMake(22.81, 11.63) controlPoint1: CGPointMake(31.71, 15.08) controlPoint2: CGPointMake(27.66, 11.63)];
        [bezier2Path closePath];
        bezier2Path.lineJoinStyle = kCGLineJoinBevel;

        [fillColor50 setFill];
        [bezier2Path fill];
        [UIColor.whiteColor setStroke];
        bezier2Path.lineWidth = 0;
        [bezier2Path stroke];
    }
}

+ (void)drawCloud_off
{
    //// Color Declarations
    UIColor* fillColor56 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 0.302];

    //// Group 2
    {
        //// Bezier Drawing
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake(17.08, 19.68)];
        [bezierPath addLineToPoint: CGPointMake(14.76, 19.68)];
        [bezierPath addCurveToPoint: CGPointMake(9.39, 25.05) controlPoint1: CGPointMake(11.79, 19.68) controlPoint2: CGPointMake(9.39, 22.08)];
        [bezierPath addCurveToPoint: CGPointMake(14.76, 30.41) controlPoint1: CGPointMake(9.39, 28.01) controlPoint2: CGPointMake(11.79, 30.41)];
        [bezierPath addLineToPoint: CGPointMake(27.81, 30.41)];
        [bezierPath addLineToPoint: CGPointMake(17.08, 19.68)];
        [bezierPath closePath];
        [fillColor56 setFill];
        [bezierPath fill];


        //// Bezier 2 Drawing
        UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
        [bezier2Path moveToPoint: CGPointMake(14.76, 33.1)];
        [bezier2Path addCurveToPoint: CGPointMake(6.71, 25.05) controlPoint1: CGPointMake(10.32, 33.1) controlPoint2: CGPointMake(6.71, 29.49)];
        [bezier2Path addCurveToPoint: CGPointMake(14.42, 17.01) controlPoint1: CGPointMake(6.71, 20.71) controlPoint2: CGPointMake(10.14, 17.2)];
        [bezier2Path addLineToPoint: CGPointMake(10.73, 13.33)];
        [bezier2Path addLineToPoint: CGPointMake(12.44, 11.63)];
        [bezier2Path addLineToPoint: CGPointMake(34.89, 34.08)];
        [bezier2Path addLineToPoint: CGPointMake(33.18, 35.78)];
        [bezier2Path addLineToPoint: CGPointMake(30.5, 33.1)];
        [bezier2Path addLineToPoint: CGPointMake(14.76, 33.1)];
        [bezier2Path closePath];
        [bezier2Path moveToPoint: CGPointMake(19.39, 15.16)];
        [bezier2Path addLineToPoint: CGPointMake(17.43, 13.2)];
        [bezier2Path addCurveToPoint: CGPointMake(22.81, 11.63) controlPoint1: CGPointMake(18.99, 12.21) controlPoint2: CGPointMake(20.82, 11.63)];
        [bezier2Path addCurveToPoint: CGPointMake(32.67, 19.73) controlPoint1: CGPointMake(27.69, 11.63) controlPoint2: CGPointMake(31.76, 15.1)];
        [bezier2Path addCurveToPoint: CGPointMake(38.91, 26.39) controlPoint1: CGPointMake(36.16, 19.97) controlPoint2: CGPointMake(38.91, 22.85)];
        [bezier2Path addCurveToPoint: CGPointMake(36.08, 31.85) controlPoint1: CGPointMake(38.91, 28.64) controlPoint2: CGPointMake(37.78, 30.63)];
        [bezier2Path addLineToPoint: CGPointMake(34.13, 29.9)];
        [bezier2Path addCurveToPoint: CGPointMake(36.23, 26.39) controlPoint1: CGPointMake(35.37, 29.22) controlPoint2: CGPointMake(36.23, 27.91)];
        [bezier2Path addCurveToPoint: CGPointMake(32.2, 22.36) controlPoint1: CGPointMake(36.23, 24.16) controlPoint2: CGPointMake(34.43, 22.36)];
        [bezier2Path addLineToPoint: CGPointMake(30.19, 22.36)];
        [bezier2Path addLineToPoint: CGPointMake(30.19, 21.69)];
        [bezier2Path addCurveToPoint: CGPointMake(22.81, 14.31) controlPoint1: CGPointMake(30.19, 17.61) controlPoint2: CGPointMake(26.89, 14.31)];
        [bezier2Path addCurveToPoint: CGPointMake(19.39, 15.16) controlPoint1: CGPointMake(21.58, 14.31) controlPoint2: CGPointMake(20.41, 14.62)];
        [bezier2Path closePath];
        [bezier2Path moveToPoint: CGPointMake(22.79, 1.19)];
        [bezier2Path addCurveToPoint: CGPointMake(1.7, 22.3) controlPoint1: CGPointMake(11.13, 1.19) controlPoint2: CGPointMake(1.7, 10.65)];
        [bezier2Path addCurveToPoint: CGPointMake(22.79, 43.41) controlPoint1: CGPointMake(1.7, 33.95) controlPoint2: CGPointMake(11.13, 43.41)];
        [bezier2Path addCurveToPoint: CGPointMake(43.92, 22.3) controlPoint1: CGPointMake(34.46, 43.41) controlPoint2: CGPointMake(43.92, 33.95)];
        [bezier2Path addCurveToPoint: CGPointMake(22.79, 1.19) controlPoint1: CGPointMake(43.92, 10.65) controlPoint2: CGPointMake(34.46, 1.19)];
        [bezier2Path closePath];
        [fillColor56 setFill];
        [bezier2Path fill];
    }
}

+ (void)drawInlineGear
{
    //// Color Declarations
    UIColor* fillColor9 = [UIColor colorWithRed: 0.687 green: 0.687 blue: 0.687 alpha: 1];

    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(19.44, 12.08)];
    [bezierPath addCurveToPoint: CGPointMake(19.51, 11) controlPoint1: CGPointMake(19.48, 11.73) controlPoint2: CGPointMake(19.51, 11.37)];
    [bezierPath addCurveToPoint: CGPointMake(19.44, 9.92) controlPoint1: CGPointMake(19.51, 10.63) controlPoint2: CGPointMake(19.48, 10.27)];
    [bezierPath addLineToPoint: CGPointMake(21.79, 8.11)];
    [bezierPath addCurveToPoint: CGPointMake(21.93, 7.4) controlPoint1: CGPointMake(22.01, 7.94) controlPoint2: CGPointMake(22.06, 7.65)];
    [bezierPath addLineToPoint: CGPointMake(19.69, 3.6)];
    [bezierPath addCurveToPoint: CGPointMake(19.01, 3.35) controlPoint1: CGPointMake(19.56, 3.35) controlPoint2: CGPointMake(19.26, 3.27)];
    [bezierPath addLineToPoint: CGPointMake(16.23, 4.45)];
    [bezierPath addCurveToPoint: CGPointMake(14.34, 3.38) controlPoint1: CGPointMake(15.65, 4.01) controlPoint2: CGPointMake(15.02, 3.65)];
    [bezierPath addLineToPoint: CGPointMake(13.92, 0.46)];
    [bezierPath addCurveToPoint: CGPointMake(13.37, 0) controlPoint1: CGPointMake(13.89, 0.2) controlPoint2: CGPointMake(13.65, 0)];
    [bezierPath addLineToPoint: CGPointMake(8.9, 0)];
    [bezierPath addCurveToPoint: CGPointMake(8.36, 0.46) controlPoint1: CGPointMake(8.62, 0) controlPoint2: CGPointMake(8.39, 0.2)];
    [bezierPath addLineToPoint: CGPointMake(7.93, 3.38)];
    [bezierPath addCurveToPoint: CGPointMake(6.04, 4.45) controlPoint1: CGPointMake(7.25, 3.65) controlPoint2: CGPointMake(6.63, 4.03)];
    [bezierPath addLineToPoint: CGPointMake(3.26, 3.35)];
    [bezierPath addCurveToPoint: CGPointMake(2.58, 3.6) controlPoint1: CGPointMake(3.01, 3.26) controlPoint2: CGPointMake(2.72, 3.35)];
    [bezierPath addLineToPoint: CGPointMake(0.35, 7.4)];
    [bezierPath addCurveToPoint: CGPointMake(0.48, 8.11) controlPoint1: CGPointMake(0.2, 7.65) controlPoint2: CGPointMake(0.27, 7.94)];
    [bezierPath addLineToPoint: CGPointMake(2.84, 9.92)];
    [bezierPath addCurveToPoint: CGPointMake(2.76, 11) controlPoint1: CGPointMake(2.79, 10.27) controlPoint2: CGPointMake(2.76, 10.64)];
    [bezierPath addCurveToPoint: CGPointMake(2.84, 12.08) controlPoint1: CGPointMake(2.76, 11.36) controlPoint2: CGPointMake(2.79, 11.73)];
    [bezierPath addLineToPoint: CGPointMake(0.48, 13.89)];
    [bezierPath addCurveToPoint: CGPointMake(0.35, 14.6) controlPoint1: CGPointMake(0.27, 14.06) controlPoint2: CGPointMake(0.21, 14.35)];
    [bezierPath addLineToPoint: CGPointMake(2.58, 18.4)];
    [bezierPath addCurveToPoint: CGPointMake(3.26, 18.65) controlPoint1: CGPointMake(2.72, 18.65) controlPoint2: CGPointMake(3.02, 18.73)];
    [bezierPath addLineToPoint: CGPointMake(6.04, 17.55)];
    [bezierPath addCurveToPoint: CGPointMake(7.93, 18.62) controlPoint1: CGPointMake(6.63, 17.99) controlPoint2: CGPointMake(7.25, 18.35)];
    [bezierPath addLineToPoint: CGPointMake(8.36, 21.54)];
    [bezierPath addCurveToPoint: CGPointMake(8.9, 22) controlPoint1: CGPointMake(8.39, 21.8) controlPoint2: CGPointMake(8.62, 22)];
    [bezierPath addLineToPoint: CGPointMake(13.37, 22)];
    [bezierPath addCurveToPoint: CGPointMake(13.92, 21.54) controlPoint1: CGPointMake(13.65, 22) controlPoint2: CGPointMake(13.89, 21.8)];
    [bezierPath addLineToPoint: CGPointMake(14.34, 18.62)];
    [bezierPath addCurveToPoint: CGPointMake(16.23, 17.55) controlPoint1: CGPointMake(15.02, 18.35) controlPoint2: CGPointMake(15.65, 17.97)];
    [bezierPath addLineToPoint: CGPointMake(19.01, 18.65)];
    [bezierPath addCurveToPoint: CGPointMake(19.69, 18.4) controlPoint1: CGPointMake(19.27, 18.74) controlPoint2: CGPointMake(19.56, 18.65)];
    [bezierPath addLineToPoint: CGPointMake(21.93, 14.6)];
    [bezierPath addCurveToPoint: CGPointMake(21.79, 13.89) controlPoint1: CGPointMake(22.06, 14.35) controlPoint2: CGPointMake(22.01, 14.06)];
    [bezierPath addLineToPoint: CGPointMake(19.44, 12.08)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(11.14, 14.85)];
    [bezierPath addCurveToPoint: CGPointMake(7.23, 11) controlPoint1: CGPointMake(8.98, 14.85) controlPoint2: CGPointMake(7.23, 13.12)];
    [bezierPath addCurveToPoint: CGPointMake(11.14, 7.15) controlPoint1: CGPointMake(7.23, 8.88) controlPoint2: CGPointMake(8.98, 7.15)];
    [bezierPath addCurveToPoint: CGPointMake(15.05, 11) controlPoint1: CGPointMake(13.29, 7.15) controlPoint2: CGPointMake(15.05, 8.88)];
    [bezierPath addCurveToPoint: CGPointMake(11.14, 14.85) controlPoint1: CGPointMake(15.05, 13.12) controlPoint2: CGPointMake(13.29, 14.85)];
    [bezierPath closePath];
    [fillColor9 setFill];
    [bezierPath fill];
}

+ (void)drawGateway
{
    //// Color Declarations
    UIColor* fillColor53 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 0.863];

    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(61.87, 23.73)];
    [bezierPath addLineToPoint: CGPointMake(64, 21.6)];
    [bezierPath addCurveToPoint: CGPointMake(50.67, 16) controlPoint1: CGPointMake(60.27, 17.87) controlPoint2: CGPointMake(55.47, 16)];
    [bezierPath addCurveToPoint: CGPointMake(37.33, 21.6) controlPoint1: CGPointMake(45.87, 16) controlPoint2: CGPointMake(41.07, 17.87)];
    [bezierPath addLineToPoint: CGPointMake(39.47, 23.73)];
    [bezierPath addCurveToPoint: CGPointMake(50.67, 19.2) controlPoint1: CGPointMake(42.67, 20.8) controlPoint2: CGPointMake(46.67, 19.2)];
    [bezierPath addCurveToPoint: CGPointMake(61.87, 23.73) controlPoint1: CGPointMake(54.67, 19.2) controlPoint2: CGPointMake(58.67, 20.8)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(59.47, 25.87)];
    [bezierPath addCurveToPoint: CGPointMake(50.67, 22.13) controlPoint1: CGPointMake(57.07, 23.47) controlPoint2: CGPointMake(53.87, 22.13)];
    [bezierPath addCurveToPoint: CGPointMake(41.87, 25.87) controlPoint1: CGPointMake(47.47, 22.13) controlPoint2: CGPointMake(44.27, 23.47)];
    [bezierPath addLineToPoint: CGPointMake(44, 28)];
    [bezierPath addCurveToPoint: CGPointMake(50.67, 25.33) controlPoint1: CGPointMake(45.87, 26.13) controlPoint2: CGPointMake(48.27, 25.33)];
    [bezierPath addCurveToPoint: CGPointMake(57.33, 28) controlPoint1: CGPointMake(53.07, 25.33) controlPoint2: CGPointMake(55.47, 26.13)];
    [bezierPath addLineToPoint: CGPointMake(59.47, 25.87)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(58.67, 42.67)];
    [bezierPath addLineToPoint: CGPointMake(53.33, 42.67)];
    [bezierPath addLineToPoint: CGPointMake(53.33, 32)];
    [bezierPath addLineToPoint: CGPointMake(48, 32)];
    [bezierPath addLineToPoint: CGPointMake(48, 42.67)];
    [bezierPath addLineToPoint: CGPointMake(21.33, 42.67)];
    [bezierPath addCurveToPoint: CGPointMake(16, 48) controlPoint1: CGPointMake(18.4, 42.67) controlPoint2: CGPointMake(16, 45.07)];
    [bezierPath addLineToPoint: CGPointMake(16, 58.67)];
    [bezierPath addCurveToPoint: CGPointMake(21.33, 64) controlPoint1: CGPointMake(16, 61.6) controlPoint2: CGPointMake(18.4, 64)];
    [bezierPath addLineToPoint: CGPointMake(58.67, 64)];
    [bezierPath addCurveToPoint: CGPointMake(64, 58.67) controlPoint1: CGPointMake(61.6, 64) controlPoint2: CGPointMake(64, 61.6)];
    [bezierPath addLineToPoint: CGPointMake(64, 48)];
    [bezierPath addCurveToPoint: CGPointMake(58.67, 42.67) controlPoint1: CGPointMake(64, 45.07) controlPoint2: CGPointMake(61.6, 42.67)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(24, 50.67)];
    [bezierPath addLineToPoint: CGPointMake(29.33, 50.67)];
    [bezierPath addLineToPoint: CGPointMake(29.33, 56)];
    [bezierPath addLineToPoint: CGPointMake(24, 56)];
    [bezierPath addLineToPoint: CGPointMake(24, 50.67)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(33.33, 50.67)];
    [bezierPath addLineToPoint: CGPointMake(38.67, 50.67)];
    [bezierPath addLineToPoint: CGPointMake(38.67, 56)];
    [bezierPath addLineToPoint: CGPointMake(33.33, 56)];
    [bezierPath addLineToPoint: CGPointMake(33.33, 50.67)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(42.67, 50.67)];
    [bezierPath addLineToPoint: CGPointMake(48, 50.67)];
    [bezierPath addLineToPoint: CGPointMake(48, 56)];
    [bezierPath addLineToPoint: CGPointMake(42.67, 56)];
    [bezierPath addLineToPoint: CGPointMake(42.67, 50.67)];
    [bezierPath closePath];
    [fillColor53 setFill];
    [bezierPath fill];
}

+ (void)drawGateway_on
{
    //// Color Declarations
    UIColor* fillColor50 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 0.863];
    UIColor* fillColor55 = [UIColor colorWithRed: 1 green: 1 blue: 0.996 alpha: 0.302];

    //// Group 2
    {
        //// Bezier Drawing
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake(14.56, 28.74)];
        [bezierPath addLineToPoint: CGPointMake(17.06, 28.74)];
        [bezierPath addLineToPoint: CGPointMake(17.06, 26.23)];
        [bezierPath addLineToPoint: CGPointMake(14.56, 26.23)];
        [bezierPath addLineToPoint: CGPointMake(14.56, 28.74)];
        [bezierPath closePath];
        [bezierPath moveToPoint: CGPointMake(18.94, 28.74)];
        [bezierPath addLineToPoint: CGPointMake(21.44, 28.74)];
        [bezierPath addLineToPoint: CGPointMake(21.44, 26.23)];
        [bezierPath addLineToPoint: CGPointMake(18.94, 26.23)];
        [bezierPath addLineToPoint: CGPointMake(18.94, 28.74)];
        [bezierPath closePath];
        [bezierPath moveToPoint: CGPointMake(23.31, 28.74)];
        [bezierPath addLineToPoint: CGPointMake(25.82, 28.74)];
        [bezierPath addLineToPoint: CGPointMake(25.82, 26.23)];
        [bezierPath addLineToPoint: CGPointMake(23.31, 26.23)];
        [bezierPath addLineToPoint: CGPointMake(23.31, 28.74)];
        [bezierPath closePath];
        [bezierPath moveToPoint: CGPointMake(13.3, 32.49)];
        [bezierPath addCurveToPoint: CGPointMake(10.8, 29.99) controlPoint1: CGPointMake(11.93, 32.49) controlPoint2: CGPointMake(10.8, 31.36)];
        [bezierPath addLineToPoint: CGPointMake(10.8, 24.98)];
        [bezierPath addCurveToPoint: CGPointMake(13.3, 22.48) controlPoint1: CGPointMake(10.8, 23.61) controlPoint2: CGPointMake(11.93, 22.48)];
        [bezierPath addLineToPoint: CGPointMake(25.82, 22.48)];
        [bezierPath addLineToPoint: CGPointMake(25.82, 17.48)];
        [bezierPath addLineToPoint: CGPointMake(28.32, 17.48)];
        [bezierPath addLineToPoint: CGPointMake(28.32, 22.48)];
        [bezierPath addLineToPoint: CGPointMake(30.82, 22.48)];
        [bezierPath addCurveToPoint: CGPointMake(33.33, 24.98) controlPoint1: CGPointMake(32.2, 22.48) controlPoint2: CGPointMake(33.33, 23.61)];
        [bezierPath addLineToPoint: CGPointMake(33.33, 29.99)];
        [bezierPath addCurveToPoint: CGPointMake(30.82, 32.49) controlPoint1: CGPointMake(33.33, 31.36) controlPoint2: CGPointMake(32.2, 32.49)];
        [bezierPath addLineToPoint: CGPointMake(13.3, 32.49)];
        [bezierPath closePath];
        [bezierPath moveToPoint: CGPointMake(23.94, 15.6)];
        [bezierPath addLineToPoint: CGPointMake(22.94, 14.6)];
        [bezierPath addCurveToPoint: CGPointMake(27.07, 12.84) controlPoint1: CGPointMake(24.07, 13.47) controlPoint2: CGPointMake(25.57, 12.84)];
        [bezierPath addCurveToPoint: CGPointMake(31.2, 14.6) controlPoint1: CGPointMake(28.57, 12.84) controlPoint2: CGPointMake(30.07, 13.47)];
        [bezierPath addLineToPoint: CGPointMake(30.2, 15.6)];
        [bezierPath addCurveToPoint: CGPointMake(27.07, 14.35) controlPoint1: CGPointMake(29.32, 14.72) controlPoint2: CGPointMake(28.19, 14.35)];
        [bezierPath addCurveToPoint: CGPointMake(23.94, 15.6) controlPoint1: CGPointMake(25.94, 14.35) controlPoint2: CGPointMake(24.82, 14.72)];
        [bezierPath closePath];
        [bezierPath moveToPoint: CGPointMake(21.81, 13.6)];
        [bezierPath addLineToPoint: CGPointMake(20.81, 12.6)];
        [bezierPath addCurveToPoint: CGPointMake(27.07, 9.97) controlPoint1: CGPointMake(22.56, 10.84) controlPoint2: CGPointMake(24.82, 9.97)];
        [bezierPath addCurveToPoint: CGPointMake(33.33, 12.6) controlPoint1: CGPointMake(29.32, 9.97) controlPoint2: CGPointMake(31.57, 10.84)];
        [bezierPath addLineToPoint: CGPointMake(32.32, 13.6)];
        [bezierPath addCurveToPoint: CGPointMake(27.07, 11.47) controlPoint1: CGPointMake(30.82, 12.22) controlPoint2: CGPointMake(28.95, 11.47)];
        [bezierPath addCurveToPoint: CGPointMake(21.81, 13.6) controlPoint1: CGPointMake(25.19, 11.47) controlPoint2: CGPointMake(23.31, 12.22)];
        [bezierPath closePath];
        [bezierPath moveToPoint: CGPointMake(22.79, 1.63)];
        [bezierPath addCurveToPoint: CGPointMake(1.7, 22.74) controlPoint1: CGPointMake(11.13, 1.63) controlPoint2: CGPointMake(1.7, 11.09)];
        [bezierPath addCurveToPoint: CGPointMake(22.79, 43.85) controlPoint1: CGPointMake(1.7, 34.4) controlPoint2: CGPointMake(11.13, 43.85)];
        [bezierPath addCurveToPoint: CGPointMake(43.92, 22.74) controlPoint1: CGPointMake(34.46, 43.85) controlPoint2: CGPointMake(43.92, 34.4)];
        [bezierPath addCurveToPoint: CGPointMake(22.79, 1.63) controlPoint1: CGPointMake(43.92, 11.09) controlPoint2: CGPointMake(34.46, 1.63)];
        [bezierPath closePath];
        [fillColor55 setFill];
        [bezierPath fill];


        //// Bezier 2 Drawing
        UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
        [bezier2Path moveToPoint: CGPointMake(14.56, 26.23)];
        [bezier2Path addLineToPoint: CGPointMake(17.06, 26.23)];
        [bezier2Path addLineToPoint: CGPointMake(17.06, 28.74)];
        [bezier2Path addLineToPoint: CGPointMake(14.56, 28.74)];
        [bezier2Path addLineToPoint: CGPointMake(14.56, 26.23)];
        [bezier2Path closePath];
        [bezier2Path moveToPoint: CGPointMake(18.94, 26.23)];
        [bezier2Path addLineToPoint: CGPointMake(21.44, 26.23)];
        [bezier2Path addLineToPoint: CGPointMake(21.44, 28.74)];
        [bezier2Path addLineToPoint: CGPointMake(18.94, 28.74)];
        [bezier2Path addLineToPoint: CGPointMake(18.94, 26.23)];
        [bezier2Path closePath];
        [bezier2Path moveToPoint: CGPointMake(23.31, 26.23)];
        [bezier2Path addLineToPoint: CGPointMake(25.82, 26.23)];
        [bezier2Path addLineToPoint: CGPointMake(25.82, 28.74)];
        [bezier2Path addLineToPoint: CGPointMake(23.31, 28.74)];
        [bezier2Path addLineToPoint: CGPointMake(23.31, 26.23)];
        [bezier2Path closePath];
        [bezier2Path moveToPoint: CGPointMake(28.32, 17.48)];
        [bezier2Path addLineToPoint: CGPointMake(25.82, 17.48)];
        [bezier2Path addLineToPoint: CGPointMake(25.82, 22.48)];
        [bezier2Path addLineToPoint: CGPointMake(13.3, 22.48)];
        [bezier2Path addCurveToPoint: CGPointMake(10.8, 24.98) controlPoint1: CGPointMake(11.93, 22.48) controlPoint2: CGPointMake(10.8, 23.61)];
        [bezier2Path addLineToPoint: CGPointMake(10.8, 29.99)];
        [bezier2Path addCurveToPoint: CGPointMake(13.3, 32.49) controlPoint1: CGPointMake(10.8, 31.36) controlPoint2: CGPointMake(11.93, 32.49)];
        [bezier2Path addLineToPoint: CGPointMake(30.82, 32.49)];
        [bezier2Path addCurveToPoint: CGPointMake(33.33, 29.99) controlPoint1: CGPointMake(32.2, 32.49) controlPoint2: CGPointMake(33.33, 31.36)];
        [bezier2Path addLineToPoint: CGPointMake(33.33, 24.98)];
        [bezier2Path addCurveToPoint: CGPointMake(30.82, 22.48) controlPoint1: CGPointMake(33.33, 23.61) controlPoint2: CGPointMake(32.2, 22.48)];
        [bezier2Path addLineToPoint: CGPointMake(28.32, 22.48)];
        [bezier2Path addLineToPoint: CGPointMake(28.32, 17.48)];
        [bezier2Path closePath];
        [bezier2Path moveToPoint: CGPointMake(27.07, 12.84)];
        [bezier2Path addCurveToPoint: CGPointMake(22.94, 14.6) controlPoint1: CGPointMake(25.57, 12.84) controlPoint2: CGPointMake(24.07, 13.47)];
        [bezier2Path addLineToPoint: CGPointMake(23.94, 15.6)];
        [bezier2Path addCurveToPoint: CGPointMake(27.07, 14.35) controlPoint1: CGPointMake(24.82, 14.72) controlPoint2: CGPointMake(25.94, 14.35)];
        [bezier2Path addCurveToPoint: CGPointMake(30.2, 15.6) controlPoint1: CGPointMake(28.19, 14.35) controlPoint2: CGPointMake(29.32, 14.72)];
        [bezier2Path addLineToPoint: CGPointMake(31.2, 14.6)];
        [bezier2Path addCurveToPoint: CGPointMake(27.07, 12.84) controlPoint1: CGPointMake(30.07, 13.47) controlPoint2: CGPointMake(28.57, 12.84)];
        [bezier2Path closePath];
        [bezier2Path moveToPoint: CGPointMake(27.07, 9.97)];
        [bezier2Path addCurveToPoint: CGPointMake(20.81, 12.6) controlPoint1: CGPointMake(24.82, 9.97) controlPoint2: CGPointMake(22.56, 10.84)];
        [bezier2Path addLineToPoint: CGPointMake(21.81, 13.6)];
        [bezier2Path addCurveToPoint: CGPointMake(27.07, 11.47) controlPoint1: CGPointMake(23.31, 12.22) controlPoint2: CGPointMake(25.19, 11.47)];
        [bezier2Path addCurveToPoint: CGPointMake(32.32, 13.6) controlPoint1: CGPointMake(28.95, 11.47) controlPoint2: CGPointMake(30.82, 12.22)];
        [bezier2Path addLineToPoint: CGPointMake(33.33, 12.6)];
        [bezier2Path addCurveToPoint: CGPointMake(27.07, 9.97) controlPoint1: CGPointMake(31.57, 10.84) controlPoint2: CGPointMake(29.32, 9.97)];
        [bezier2Path closePath];
        [fillColor50 setFill];
        [bezier2Path fill];
    }
}

+ (void)drawGateway_off
{
    //// Color Declarations
    UIColor* fillColor58 = [UIColor colorWithRed: 1 green: 1 blue: 0.996 alpha: 0.302];

    //// Group 2
    {
        //// Rectangle Drawing
        UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(14.93, 25.88, 2.4, 2.4)];
        [fillColor58 setFill];
        [rectanglePath fill];


        //// Bezier Drawing
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake(19.29, 26.54)];
        [bezierPath addLineToPoint: CGPointMake(19.29, 28.62)];
        [bezierPath addLineToPoint: CGPointMake(21.37, 28.62)];
        [bezierPath addLineToPoint: CGPointMake(19.29, 26.54)];
        [bezierPath closePath];
        [fillColor58 setFill];
        [bezierPath fill];


        //// Bezier 2 Drawing
        UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
        [bezier2Path moveToPoint: CGPointMake(32.54, 31.96)];
        [bezier2Path addLineToPoint: CGPointMake(22.94, 22.36)];
        [bezier2Path addLineToPoint: CGPointMake(26.18, 22.36)];
        [bezier2Path addLineToPoint: CGPointMake(26.18, 17.36)];
        [bezier2Path addLineToPoint: CGPointMake(28.68, 17.36)];
        [bezier2Path addLineToPoint: CGPointMake(28.68, 22.36)];
        [bezier2Path addLineToPoint: CGPointMake(31.18, 22.36)];
        [bezier2Path addCurveToPoint: CGPointMake(33.68, 24.86) controlPoint1: CGPointMake(32.56, 22.36) controlPoint2: CGPointMake(33.68, 23.49)];
        [bezier2Path addLineToPoint: CGPointMake(33.68, 29.87)];
        [bezier2Path addCurveToPoint: CGPointMake(32.54, 31.96) controlPoint1: CGPointMake(33.68, 30.74) controlPoint2: CGPointMake(33.22, 31.51)];
        [bezier2Path closePath];
        [bezier2Path moveToPoint: CGPointMake(13.66, 32.37)];
        [bezier2Path addCurveToPoint: CGPointMake(11.16, 29.87) controlPoint1: CGPointMake(12.29, 32.37) controlPoint2: CGPointMake(11.16, 31.25)];
        [bezier2Path addLineToPoint: CGPointMake(11.16, 24.86)];
        [bezier2Path addCurveToPoint: CGPointMake(13.66, 22.36) controlPoint1: CGPointMake(11.16, 23.49) controlPoint2: CGPointMake(12.29, 22.36)];
        [bezier2Path addLineToPoint: CGPointMake(15.12, 22.36)];
        [bezier2Path addLineToPoint: CGPointMake(10.5, 17.75)];
        [bezier2Path addLineToPoint: CGPointMake(12.45, 15.8)];
        [bezier2Path addLineToPoint: CGPointMake(19.01, 22.36)];
        [bezier2Path addLineToPoint: CGPointMake(19.05, 22.36)];
        [bezier2Path addLineToPoint: CGPointMake(23.67, 26.99)];
        [bezier2Path addLineToPoint: CGPointMake(23.67, 27.02)];
        [bezier2Path addLineToPoint: CGPointMake(25.27, 28.62)];
        [bezier2Path addLineToPoint: CGPointMake(25.3, 28.62)];
        [bezier2Path addLineToPoint: CGPointMake(29.06, 32.37)];
        [bezier2Path addLineToPoint: CGPointMake(29.02, 32.37)];
        [bezier2Path addLineToPoint: CGPointMake(33.09, 36.44)];
        [bezier2Path addLineToPoint: CGPointMake(31.14, 38.39)];
        [bezier2Path addLineToPoint: CGPointMake(25.13, 32.37)];
        [bezier2Path addLineToPoint: CGPointMake(13.66, 32.37)];
        [bezier2Path closePath];
        [bezier2Path moveToPoint: CGPointMake(24.3, 15.48)];
        [bezier2Path addLineToPoint: CGPointMake(23.3, 14.48)];
        [bezier2Path addCurveToPoint: CGPointMake(27.43, 12.73) controlPoint1: CGPointMake(24.42, 13.35) controlPoint2: CGPointMake(25.92, 12.73)];
        [bezier2Path addCurveToPoint: CGPointMake(31.56, 14.48) controlPoint1: CGPointMake(28.93, 12.73) controlPoint2: CGPointMake(30.43, 13.35)];
        [bezier2Path addLineToPoint: CGPointMake(30.56, 15.48)];
        [bezier2Path addCurveToPoint: CGPointMake(27.43, 14.23) controlPoint1: CGPointMake(29.68, 14.6) controlPoint2: CGPointMake(28.55, 14.23)];
        [bezier2Path addCurveToPoint: CGPointMake(24.3, 15.48) controlPoint1: CGPointMake(26.3, 14.23) controlPoint2: CGPointMake(25.17, 14.6)];
        [bezier2Path closePath];
        [bezier2Path moveToPoint: CGPointMake(22.17, 13.48)];
        [bezier2Path addLineToPoint: CGPointMake(21.17, 12.48)];
        [bezier2Path addCurveToPoint: CGPointMake(27.43, 9.85) controlPoint1: CGPointMake(22.92, 10.72) controlPoint2: CGPointMake(25.17, 9.85)];
        [bezier2Path addCurveToPoint: CGPointMake(33.68, 12.48) controlPoint1: CGPointMake(29.68, 9.85) controlPoint2: CGPointMake(31.93, 10.72)];
        [bezier2Path addLineToPoint: CGPointMake(32.68, 13.48)];
        [bezier2Path addCurveToPoint: CGPointMake(27.43, 11.35) controlPoint1: CGPointMake(31.18, 12.1) controlPoint2: CGPointMake(29.3, 11.35)];
        [bezier2Path addCurveToPoint: CGPointMake(22.17, 13.48) controlPoint1: CGPointMake(25.55, 11.35) controlPoint2: CGPointMake(23.67, 12.1)];
        [bezier2Path closePath];
        [bezier2Path moveToPoint: CGPointMake(22.79, 1.19)];
        [bezier2Path addCurveToPoint: CGPointMake(1.7, 22.3) controlPoint1: CGPointMake(11.14, 1.19) controlPoint2: CGPointMake(1.7, 10.65)];
        [bezier2Path addCurveToPoint: CGPointMake(22.79, 43.41) controlPoint1: CGPointMake(1.7, 33.95) controlPoint2: CGPointMake(11.14, 43.41)];
        [bezier2Path addCurveToPoint: CGPointMake(43.92, 22.3) controlPoint1: CGPointMake(34.46, 43.41) controlPoint2: CGPointMake(43.92, 33.95)];
        [bezier2Path addCurveToPoint: CGPointMake(22.79, 1.19) controlPoint1: CGPointMake(43.92, 10.65) controlPoint2: CGPointMake(34.46, 1.19)];
        [bezier2Path closePath];
        [fillColor58 setFill];
        [bezier2Path fill];
    }
}

+ (void)drawIconQRScanOk
{
    //// Color Declarations
    UIColor* fillColor14 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* fillColor15 = [UIColor colorWithRed: 0.48 green: 0.731 blue: 0.227 alpha: 1];

    //// Group
    {
        //// Bezier 2 Drawing
        UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
        [bezier2Path moveToPoint: CGPointMake(20, 2)];
        [bezier2Path addCurveToPoint: CGPointMake(2, 20) controlPoint1: CGPointMake(10.06, 2) controlPoint2: CGPointMake(2, 10.06)];
        [bezier2Path addCurveToPoint: CGPointMake(20, 38) controlPoint1: CGPointMake(2, 29.94) controlPoint2: CGPointMake(10.06, 38)];
        [bezier2Path addCurveToPoint: CGPointMake(38, 20) controlPoint1: CGPointMake(29.94, 38) controlPoint2: CGPointMake(38, 29.94)];
        [bezier2Path addCurveToPoint: CGPointMake(20, 2) controlPoint1: CGPointMake(38, 10.06) controlPoint2: CGPointMake(29.94, 2)];
        [bezier2Path closePath];
        [fillColor15 setFill];
        [bezier2Path fill];
        [UIColor.whiteColor setStroke];
        bezier2Path.lineWidth = 1.5;
        [bezier2Path stroke];


        //// Bezier Drawing
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake(16.4, 29)];
        [bezierPath addLineToPoint: CGPointMake(7.4, 20)];
        [bezierPath addLineToPoint: CGPointMake(9.94, 17.46)];
        [bezierPath addLineToPoint: CGPointMake(16.4, 23.91)];
        [bezierPath addLineToPoint: CGPointMake(30.06, 10.24)];
        [bezierPath addLineToPoint: CGPointMake(32.6, 12.8)];
        [bezierPath addLineToPoint: CGPointMake(16.4, 29)];
        [bezierPath closePath];
        [fillColor14 setFill];
        [bezierPath fill];
    }
}

+ (void)drawIconQRScanFail
{
    //// Color Declarations
    UIColor* fillColor42 = [UIColor colorWithRed: 0.954 green: 0.974 blue: 0.981 alpha: 1];
    UIColor* color4 = [UIColor colorWithRed: 1 green: 0 blue: 0 alpha: 1];

    //// Group
    {
        //// Bezier 2 Drawing
        UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
        [bezier2Path moveToPoint: CGPointMake(20, 2)];
        [bezier2Path addCurveToPoint: CGPointMake(2, 20) controlPoint1: CGPointMake(10.06, 2) controlPoint2: CGPointMake(2, 10.06)];
        [bezier2Path addCurveToPoint: CGPointMake(20, 38) controlPoint1: CGPointMake(2, 29.94) controlPoint2: CGPointMake(10.06, 38)];
        [bezier2Path addCurveToPoint: CGPointMake(38, 20) controlPoint1: CGPointMake(29.94, 38) controlPoint2: CGPointMake(38, 29.94)];
        [bezier2Path addCurveToPoint: CGPointMake(20, 2) controlPoint1: CGPointMake(38, 10.06) controlPoint2: CGPointMake(29.94, 2)];
        [bezier2Path closePath];
        [color4 setFill];
        [bezier2Path fill];
        [UIColor.whiteColor setStroke];
        bezier2Path.lineWidth = 1.5;
        [bezier2Path stroke];
    }


    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(27.61, 10.42)];
    [bezierPath addLineToPoint: CGPointMake(19.79, 18.24)];
    [bezierPath addLineToPoint: CGPointMake(11.97, 10.42)];
    [bezierPath addLineToPoint: CGPointMake(10, 12.39)];
    [bezierPath addLineToPoint: CGPointMake(17.82, 20.21)];
    [bezierPath addLineToPoint: CGPointMake(10, 28.03)];
    [bezierPath addLineToPoint: CGPointMake(11.97, 30)];
    [bezierPath addLineToPoint: CGPointMake(19.79, 22.18)];
    [bezierPath addLineToPoint: CGPointMake(27.61, 30)];
    [bezierPath addLineToPoint: CGPointMake(29.58, 28.03)];
    [bezierPath addLineToPoint: CGPointMake(21.76, 20.21)];
    [bezierPath addLineToPoint: CGPointMake(29.58, 12.39)];
    [bezierPath addLineToPoint: CGPointMake(27.61, 10.42)];
    [bezierPath closePath];
    [fillColor42 setFill];
    [bezierPath fill];
}

+ (void)drawArrow_up
{
    //// Color Declarations
    UIColor* fillColor = [UIColor colorWithRed: 0.333 green: 0.333 blue: 0.333 alpha: 1];

    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(35, 11)];
    [bezierPath addLineToPoint: CGPointMake(5, 41.29)];
    [bezierPath addLineToPoint: CGPointMake(12.05, 48.41)];
    [bezierPath addLineToPoint: CGPointMake(35, 25.29)];
    [bezierPath addLineToPoint: CGPointMake(57.95, 48.41)];
    [bezierPath addLineToPoint: CGPointMake(65, 41.29)];
    [bezierPath addLineToPoint: CGPointMake(35, 11)];
    [bezierPath closePath];
    [fillColor setFill];
    [bezierPath fill];
}

+ (void)drawArrow_down
{
    //// Color Declarations
    UIColor* fillColor = [UIColor colorWithRed: 0.333 green: 0.333 blue: 0.333 alpha: 1];

    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(57.95, 16)];
    [bezierPath addLineToPoint: CGPointMake(35, 39.12)];
    [bezierPath addLineToPoint: CGPointMake(12.05, 16)];
    [bezierPath addLineToPoint: CGPointMake(5, 23.11)];
    [bezierPath addLineToPoint: CGPointMake(35, 53.41)];
    [bezierPath addLineToPoint: CGPointMake(65, 23.11)];
    [bezierPath addLineToPoint: CGPointMake(57.95, 16)];
    [bezierPath closePath];
    [fillColor setFill];
    [bezierPath fill];
}

+ (void)drawSensor
{
    //// Color Declarations
    UIColor* fillColor60 = [UIColor colorWithRed: 0.065 green: 0.503 blue: 0.671 alpha: 1];

    //// Group 2
    {
        //// Bezier Drawing
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake(40, 28.3)];
        [bezierPath addCurveToPoint: CGPointMake(22.18, 46.33) controlPoint1: CGPointMake(30.15, 28.3) controlPoint2: CGPointMake(22.18, 36.36)];
        [bezierPath addLineToPoint: CGPointMake(27.27, 46.33)];
        [bezierPath addCurveToPoint: CGPointMake(40, 33.45) controlPoint1: CGPointMake(27.27, 39.22) controlPoint2: CGPointMake(32.97, 33.45)];
        [bezierPath addCurveToPoint: CGPointMake(52.73, 46.33) controlPoint1: CGPointMake(47.03, 33.45) controlPoint2: CGPointMake(52.73, 39.22)];
        [bezierPath addLineToPoint: CGPointMake(57.82, 46.33)];
        [bezierPath addCurveToPoint: CGPointMake(40, 28.3) controlPoint1: CGPointMake(57.82, 36.36) controlPoint2: CGPointMake(49.85, 28.3)];
        [bezierPath closePath];
        [fillColor60 setFill];
        [bezierPath fill];


        //// Bezier 2 Drawing
        UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
        [bezier2Path moveToPoint: CGPointMake(40, 18)];
        [bezier2Path addCurveToPoint: CGPointMake(12, 46.33) controlPoint1: CGPointMake(24.55, 18) controlPoint2: CGPointMake(12, 30.7)];
        [bezier2Path addLineToPoint: CGPointMake(17.09, 46.33)];
        [bezier2Path addCurveToPoint: CGPointMake(40, 23.15) controlPoint1: CGPointMake(17.09, 33.53) controlPoint2: CGPointMake(27.35, 23.15)];
        [bezier2Path addCurveToPoint: CGPointMake(62.91, 46.33) controlPoint1: CGPointMake(52.65, 23.15) controlPoint2: CGPointMake(62.91, 33.53)];
        [bezier2Path addLineToPoint: CGPointMake(68, 46.33)];
        [bezier2Path addCurveToPoint: CGPointMake(40, 18) controlPoint1: CGPointMake(68, 30.7) controlPoint2: CGPointMake(55.45, 18)];
        [bezier2Path closePath];
        [fillColor60 setFill];
        [bezier2Path fill];


        //// Bezier 3 Drawing
        UIBezierPath* bezier3Path = [UIBezierPath bezierPath];
        [bezier3Path moveToPoint: CGPointMake(46.36, 46.33)];
        [bezier3Path addCurveToPoint: CGPointMake(40, 39.89) controlPoint1: CGPointMake(46.36, 42.77) controlPoint2: CGPointMake(43.51, 39.89)];
        [bezier3Path addCurveToPoint: CGPointMake(33.64, 46.33) controlPoint1: CGPointMake(36.49, 39.89) controlPoint2: CGPointMake(33.64, 42.77)];
        [bezier3Path addCurveToPoint: CGPointMake(34.85, 50.07) controlPoint1: CGPointMake(33.64, 47.73) controlPoint2: CGPointMake(34.09, 49.02)];
        [bezier3Path addLineToPoint: CGPointMake(45.15, 50.07)];
        [bezier3Path addCurveToPoint: CGPointMake(46.36, 46.33) controlPoint1: CGPointMake(45.91, 49.02) controlPoint2: CGPointMake(46.36, 47.74)];
        [bezier3Path closePath];
        [fillColor60 setFill];
        [bezier3Path fill];


        //// Bezier 4 Drawing
        UIBezierPath* bezier4Path = [UIBezierPath bezierPath];
        [bezier4Path moveToPoint: CGPointMake(37.45, 60.72)];
        [bezier4Path addLineToPoint: CGPointMake(40, 65.41)];
        [bezier4Path addLineToPoint: CGPointMake(42.55, 60.72)];
        [bezier4Path addLineToPoint: CGPointMake(42.55, 54.48)];
        [bezier4Path addLineToPoint: CGPointMake(37.45, 54.48)];
        [bezier4Path addLineToPoint: CGPointMake(37.45, 60.72)];
        [bezier4Path closePath];
        [fillColor60 setFill];
        [bezier4Path fill];


        //// Bezier 5 Drawing
        UIBezierPath* bezier5Path = [UIBezierPath bezierPath];
        [bezier5Path moveToPoint: CGPointMake(68, 50.07)];
        [bezier5Path addLineToPoint: CGPointMake(49.72, 50.07)];
        [bezier5Path addCurveToPoint: CGPointMake(47.64, 52.22) controlPoint1: CGPointMake(49.19, 51) controlPoint2: CGPointMake(48.48, 51.75)];
        [bezier5Path addLineToPoint: CGPointMake(47.64, 54.48)];
        [bezier5Path addLineToPoint: CGPointMake(68, 54.48)];
        [bezier5Path addLineToPoint: CGPointMake(68, 50.07)];
        [bezier5Path closePath];
        [fillColor60 setFill];
        [bezier5Path fill];


        //// Bezier 6 Drawing
        UIBezierPath* bezier6Path = [UIBezierPath bezierPath];
        [bezier6Path moveToPoint: CGPointMake(30.28, 50.07)];
        [bezier6Path addLineToPoint: CGPointMake(12, 50.07)];
        [bezier6Path addLineToPoint: CGPointMake(12, 54.48)];
        [bezier6Path addLineToPoint: CGPointMake(32.36, 54.48)];
        [bezier6Path addLineToPoint: CGPointMake(32.36, 52.22)];
        [bezier6Path addCurveToPoint: CGPointMake(30.28, 50.07) controlPoint1: CGPointMake(31.53, 51.76) controlPoint2: CGPointMake(30.81, 51)];
        [bezier6Path closePath];
        [fillColor60 setFill];
        [bezier6Path fill];


        //// Bezier 7 Drawing
        UIBezierPath* bezier7Path = [UIBezierPath bezierPath];
        [bezier7Path moveToPoint: CGPointMake(45.16, 50.07)];
        [bezier7Path addLineToPoint: CGPointMake(34.85, 50.07)];
        [bezier7Path addCurveToPoint: CGPointMake(37.46, 52.22) controlPoint1: CGPointMake(35.52, 51) controlPoint2: CGPointMake(36.41, 51.76)];
        [bezier7Path addLineToPoint: CGPointMake(37.46, 54.48)];
        [bezier7Path addLineToPoint: CGPointMake(42.55, 54.48)];
        [bezier7Path addLineToPoint: CGPointMake(42.55, 52.22)];
        [bezier7Path addCurveToPoint: CGPointMake(45.16, 50.07) controlPoint1: CGPointMake(43.6, 51.75) controlPoint2: CGPointMake(44.49, 51)];
        [bezier7Path closePath];
        [fillColor60 setFill];
        [bezier7Path fill];
    }
}

+ (void)drawMesh_device
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();

    //// Color Declarations
    UIColor* fillColor61 = [UIColor colorWithRed: 0.28 green: 0.558 blue: 0.808 alpha: 1];
    UIColor* strokeColor = [UIColor colorWithRed: 0.54 green: 0.68 blue: 0.862 alpha: 1];
    UIColor* fillColor62 = [UIColor colorWithRed: 0.198 green: 0.372 blue: 0.67 alpha: 1];
    UIColor* fillColor63 = [UIColor colorWithRed: 0.131 green: 0.264 blue: 0.495 alpha: 1];
    UIColor* strokeColor2 = [UIColor colorWithRed: 0.758 green: 0.874 blue: 0.957 alpha: 1];
    UIColor* fillColor64 = [UIColor colorWithRed: 0.089 green: 0.211 blue: 0.363 alpha: 1];
    UIColor* fillColor65 = [UIColor colorWithRed: 0.258 green: 0.461 blue: 0.736 alpha: 1];
    UIColor* fillColor66 = [UIColor colorWithRed: 0.373 green: 0.596 blue: 0.825 alpha: 1];
    UIColor* fillColor67 = [UIColor colorWithRed: 0.26 green: 0.461 blue: 0.736 alpha: 1];
    UIColor* strokeColor3 = [UIColor colorWithRed: 0.582 green: 0.732 blue: 0.819 alpha: 1];
    UIColor* fillColor68 = [UIColor colorWithRed: 0.388 green: 0.273 blue: 0.588 alpha: 1];
    UIColor* fillColor69 = [UIColor colorWithRed: 0.21 green: 0.395 blue: 0.603 alpha: 1];
    UIColor* fillColor70 = [UIColor colorWithRed: 0.974 green: 0.64 blue: 0.078 alpha: 1];
    UIColor* fillColor71 = [UIColor colorWithRed: 0.338 green: 0.567 blue: 0.198 alpha: 1];
    UIColor* fillColor72 = [UIColor colorWithRed: 0.647 green: 0.054 blue: 0.111 alpha: 1];
    UIColor* fillColor73 = [UIColor colorWithRed: 0.15 green: 0.248 blue: 0.423 alpha: 1];
    UIColor* strokeColor4 = [UIColor colorWithRed: 0.994 green: 0.994 blue: 0.994 alpha: 1];

    //// Group 2
    {
        //// Polygon Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 45.8, 30.62);
        CGContextRotateCTM(context, -30.1 * M_PI / 180);

        UIBezierPath* polygonPath = [UIBezierPath bezierPath];
        [polygonPath moveToPoint: CGPointMake(0, -11.43)];
        [polygonPath addLineToPoint: CGPointMake(9.91, 5.71)];
        [polygonPath addLineToPoint: CGPointMake(-9.91, 5.71)];
        [polygonPath closePath];
        [fillColor61 setFill];
        [polygonPath fill];

        CGContextRestoreGState(context);


        //// Polygon 2 Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 45.8, 30.62);
        CGContextRotateCTM(context, -30.1 * M_PI / 180);

        UIBezierPath* polygon2Path = [UIBezierPath bezierPath];
        [polygon2Path moveToPoint: CGPointMake(0, -11.43)];
        [polygon2Path addLineToPoint: CGPointMake(9.91, 5.71)];
        [polygon2Path addLineToPoint: CGPointMake(-9.91, 5.71)];
        [polygon2Path closePath];
        [strokeColor setStroke];
        polygon2Path.lineWidth = 0.25;
        [polygon2Path stroke];

        CGContextRestoreGState(context);


        //// Polygon 3 Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 51.52, 40.56);
        CGContextRotateCTM(context, -90.1 * M_PI / 180);

        UIBezierPath* polygon3Path = [UIBezierPath bezierPath];
        [polygon3Path moveToPoint: CGPointMake(-0, -11.46)];
        [polygon3Path addLineToPoint: CGPointMake(9.9, 5.73)];
        [polygon3Path addLineToPoint: CGPointMake(-9.9, 5.73)];
        [polygon3Path closePath];
        [fillColor62 setFill];
        [polygon3Path fill];

        CGContextRestoreGState(context);


        //// Polygon 4 Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 51.52, 40.56);
        CGContextRotateCTM(context, -90.1 * M_PI / 180);

        UIBezierPath* polygon4Path = [UIBezierPath bezierPath];
        [polygon4Path moveToPoint: CGPointMake(-0, -11.46)];
        [polygon4Path addLineToPoint: CGPointMake(9.9, 5.73)];
        [polygon4Path addLineToPoint: CGPointMake(-9.9, 5.73)];
        [polygon4Path closePath];
        [strokeColor setStroke];
        polygon4Path.lineWidth = 0.25;
        [polygon4Path stroke];

        CGContextRestoreGState(context);


        //// Polygon 5 Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 34.34, 50.38);
        CGContextRotateCTM(context, -90.1 * M_PI / 180);

        UIBezierPath* polygon5Path = [UIBezierPath bezierPath];
        [polygon5Path moveToPoint: CGPointMake(-0, -11.46)];
        [polygon5Path addLineToPoint: CGPointMake(9.9, 5.73)];
        [polygon5Path addLineToPoint: CGPointMake(-9.9, 5.73)];
        [polygon5Path closePath];
        [fillColor63 setFill];
        [polygon5Path fill];

        CGContextRestoreGState(context);


        //// Polygon 6 Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 34.34, 50.38);
        CGContextRotateCTM(context, -90.1 * M_PI / 180);

        UIBezierPath* polygon6Path = [UIBezierPath bezierPath];
        [polygon6Path moveToPoint: CGPointMake(-0, -11.46)];
        [polygon6Path addLineToPoint: CGPointMake(9.9, 5.73)];
        [polygon6Path addLineToPoint: CGPointMake(-9.9, 5.73)];
        [polygon6Path closePath];
        [strokeColor2 setStroke];
        polygon6Path.lineWidth = 0.25;
        [polygon6Path stroke];

        CGContextRestoreGState(context);


        //// Polygon 7 Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 45.8, 50.38);
        CGContextRotateCTM(context, -30.1 * M_PI / 180);

        UIBezierPath* polygon7Path = [UIBezierPath bezierPath];
        [polygon7Path moveToPoint: CGPointMake(0, -11.43)];
        [polygon7Path addLineToPoint: CGPointMake(9.91, 5.71)];
        [polygon7Path addLineToPoint: CGPointMake(-9.91, 5.71)];
        [polygon7Path closePath];
        [fillColor64 setFill];
        [polygon7Path fill];

        CGContextRestoreGState(context);


        //// Polygon 8 Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 45.8, 50.38);
        CGContextRotateCTM(context, -30.1 * M_PI / 180);

        UIBezierPath* polygon8Path = [UIBezierPath bezierPath];
        [polygon8Path moveToPoint: CGPointMake(0, -11.43)];
        [polygon8Path addLineToPoint: CGPointMake(9.91, 5.71)];
        [polygon8Path addLineToPoint: CGPointMake(-9.91, 5.71)];
        [polygon8Path closePath];
        [strokeColor2 setStroke];
        polygon8Path.lineWidth = 0.25;
        [polygon8Path stroke];

        CGContextRestoreGState(context);


        //// Polygon 9 Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 28.61, 40.56);
        CGContextRotateCTM(context, -30.1 * M_PI / 180);

        UIBezierPath* polygon9Path = [UIBezierPath bezierPath];
        [polygon9Path moveToPoint: CGPointMake(0, -11.43)];
        [polygon9Path addLineToPoint: CGPointMake(9.91, 5.71)];
        [polygon9Path addLineToPoint: CGPointMake(-9.91, 5.71)];
        [polygon9Path closePath];
        [fillColor65 setFill];
        [polygon9Path fill];

        CGContextRestoreGState(context);


        //// Polygon 10 Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 28.61, 40.56);
        CGContextRotateCTM(context, -30.1 * M_PI / 180);

        UIBezierPath* polygon10Path = [UIBezierPath bezierPath];
        [polygon10Path moveToPoint: CGPointMake(0, -11.43)];
        [polygon10Path addLineToPoint: CGPointMake(9.91, 5.71)];
        [polygon10Path addLineToPoint: CGPointMake(-9.91, 5.71)];
        [polygon10Path closePath];
        [strokeColor2 setStroke];
        polygon10Path.lineWidth = 0.25;
        [polygon10Path stroke];

        CGContextRestoreGState(context);


        //// Polygon 11 Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 34.34, 30.62);
        CGContextRotateCTM(context, -90.1 * M_PI / 180);

        UIBezierPath* polygon11Path = [UIBezierPath bezierPath];
        [polygon11Path moveToPoint: CGPointMake(-0, -11.46)];
        [polygon11Path addLineToPoint: CGPointMake(9.9, 5.73)];
        [polygon11Path addLineToPoint: CGPointMake(-9.9, 5.73)];
        [polygon11Path closePath];
        [fillColor66 setFill];
        [polygon11Path fill];

        CGContextRestoreGState(context);


        //// Polygon 12 Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 34.34, 30.62);
        CGContextRotateCTM(context, -90.1 * M_PI / 180);

        UIBezierPath* polygon12Path = [UIBezierPath bezierPath];
        [polygon12Path moveToPoint: CGPointMake(-0, -11.46)];
        [polygon12Path addLineToPoint: CGPointMake(9.9, 5.73)];
        [polygon12Path addLineToPoint: CGPointMake(-9.9, 5.73)];
        [polygon12Path closePath];
        [strokeColor setStroke];
        polygon12Path.lineWidth = 0.25;
        [polygon12Path stroke];

        CGContextRestoreGState(context);


        //// Bezier Drawing
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake(23.27, 30.52)];
        [bezierPath addLineToPoint: CGPointMake(57.6, 30.47)];
        [bezierPath addLineToPoint: CGPointMake(23.27, 30.52)];
        [bezierPath closePath];
        [fillColor67 setFill];
        [bezierPath fill];


        //// Bezier 2 Drawing
        UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
        [bezier2Path moveToPoint: CGPointMake(57.6, 30.47)];
        [bezier2Path addLineToPoint: CGPointMake(23.27, 30.53)];
        [strokeColor3 setStroke];
        bezier2Path.lineWidth = 0.25;
        [bezier2Path stroke];


        //// Bezier 3 Drawing
        UIBezierPath* bezier3Path = [UIBezierPath bezierPath];
        [bezier3Path moveToPoint: CGPointMake(40.48, 59.84)];
        [bezier3Path addLineToPoint: CGPointMake(23.27, 30.52)];
        [fillColor67 setFill];
        [bezier3Path fill];
        [strokeColor3 setStroke];
        bezier3Path.lineWidth = 0.25;
        [bezier3Path stroke];


        //// Bezier 4 Drawing
        UIBezierPath* bezier4Path = [UIBezierPath bezierPath];
        [bezier4Path moveToPoint: CGPointMake(57.6, 30.47)];
        [bezier4Path addLineToPoint: CGPointMake(40.49, 59.84)];
        [fillColor67 setFill];
        [bezier4Path fill];
        [strokeColor3 setStroke];
        bezier4Path.lineWidth = 0.25;
        [bezier4Path stroke];


        //// Bezier 5 Drawing
        UIBezierPath* bezier5Path = [UIBezierPath bezierPath];
        [bezier5Path moveToPoint: CGPointMake(40.42, 20.72)];
        [bezier5Path addLineToPoint: CGPointMake(23.3, 50.09)];
        [fillColor67 setFill];
        [bezier5Path fill];
        [strokeColor3 setStroke];
        bezier5Path.lineWidth = 0.25;
        [bezier5Path stroke];


        //// Bezier 6 Drawing
        UIBezierPath* bezier6Path = [UIBezierPath bezierPath];
        [bezier6Path moveToPoint: CGPointMake(23.3, 50.09)];
        [bezier6Path addLineToPoint: CGPointMake(57.64, 50.03)];
        [bezier6Path addLineToPoint: CGPointMake(23.3, 50.09)];
        [bezier6Path closePath];
        [fillColor67 setFill];
        [bezier6Path fill];


        //// Bezier 7 Drawing
        UIBezierPath* bezier7Path = [UIBezierPath bezierPath];
        [bezier7Path moveToPoint: CGPointMake(57.64, 50.03)];
        [bezier7Path addLineToPoint: CGPointMake(23.3, 50.09)];
        [strokeColor3 setStroke];
        bezier7Path.lineWidth = 0.25;
        [bezier7Path stroke];


        //// Bezier 8 Drawing
        UIBezierPath* bezier8Path = [UIBezierPath bezierPath];
        [bezier8Path moveToPoint: CGPointMake(57.64, 50.03)];
        [bezier8Path addLineToPoint: CGPointMake(40.42, 20.72)];
        [fillColor67 setFill];
        [bezier8Path fill];
        [strokeColor3 setStroke];
        bezier8Path.lineWidth = 0.25;
        [bezier8Path stroke];


        //// Group 3
        {
            CGContextSaveGState(context);
            CGContextBeginTransparencyLayer(context, NULL);

            //// Clip Clip
            UIBezierPath* clipPath = [UIBezierPath bezierPathWithRect: CGRectMake(20, 17.01, 41.4, 46.55)];
            [clipPath addClip];


            //// Oval Drawing
            UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(38.15, 17.28, 5.1, 5.1)];
            [fillColor68 setFill];
            [ovalPath fill];


            //// Oval 2 Drawing
            UIBezierPath* oval2Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(38.15, 58.18, 5.1, 5.1)];
            [fillColor69 setFill];
            [oval2Path fill];


            //// Oval 3 Drawing
            UIBezierPath* oval3Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(38.15, 37.18, 5.1, 6.1)];
            [fillColor70 setFill];
            [oval3Path fill];


            //// Oval 4 Drawing
            UIBezierPath* oval4Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(56, 28.23, 5.1, 5.1)];
            [fillColor71 setFill];
            [oval4Path fill];


            //// Oval 5 Drawing
            UIBezierPath* oval5Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(20.25, 28.23, 5.1, 5.1)];
            [fillColor72 setFill];
            [oval5Path fill];


            //// Oval 6 Drawing
            UIBezierPath* oval6Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(56, 47.18, 5.1, 5.1)];
            [fillColor73 setFill];
            [oval6Path fill];


            //// Oval 7 Drawing
            UIBezierPath* oval7Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(20.25, 47.18, 5.1, 5.1)];
            [fillColor67 setFill];
            [oval7Path fill];


            //// Oval 8 Drawing
            UIBezierPath* oval8Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(38.15, 17.28, 5.1, 5.1)];
            [strokeColor4 setStroke];
            oval8Path.lineWidth = 0.5;
            [oval8Path stroke];


            //// Oval 9 Drawing
            UIBezierPath* oval9Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(38.15, 58.18, 5.1, 5.1)];
            [strokeColor4 setStroke];
            oval9Path.lineWidth = 0.5;
            [oval9Path stroke];


            //// Oval 10 Drawing
            UIBezierPath* oval10Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(38.15, 37.18, 5.1, 6.1)];
            [strokeColor4 setStroke];
            oval10Path.lineWidth = 0.5;
            [oval10Path stroke];


            //// Oval 11 Drawing
            UIBezierPath* oval11Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(56, 28.23, 5.1, 5.1)];
            [strokeColor4 setStroke];
            oval11Path.lineWidth = 0.5;
            [oval11Path stroke];


            //// Oval 12 Drawing
            UIBezierPath* oval12Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(20.25, 28.23, 5.1, 5.1)];
            [strokeColor4 setStroke];
            oval12Path.lineWidth = 0.5;
            [oval12Path stroke];


            //// Oval 13 Drawing
            UIBezierPath* oval13Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(56, 47.18, 5.1, 5.1)];
            [strokeColor4 setStroke];
            oval13Path.lineWidth = 0.5;
            [oval13Path stroke];


            //// Oval 14 Drawing
            UIBezierPath* oval14Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(20.25, 47.18, 5.1, 5.1)];
            [strokeColor4 setStroke];
            oval14Path.lineWidth = 0.5;
            [oval14Path stroke];


            CGContextEndTransparencyLayer(context);
            CGContextRestoreGState(context);
        }
    }
}

+ (void)drawCloud_state_on
{
    //// Color Declarations
    UIColor* fillColor59 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];

    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(35.83, 33.25)];
    [bezierPath addLineToPoint: CGPointMake(12, 33.25)];
    [bezierPath addCurveToPoint: CGPointMake(4.67, 25.75) controlPoint1: CGPointMake(7.95, 33.25) controlPoint2: CGPointMake(4.67, 29.89)];
    [bezierPath addCurveToPoint: CGPointMake(12, 18.25) controlPoint1: CGPointMake(4.67, 21.61) controlPoint2: CGPointMake(7.95, 18.25)];
    [bezierPath addLineToPoint: CGPointMake(13.3, 18.25)];
    [bezierPath addCurveToPoint: CGPointMake(23, 10.75) controlPoint1: CGPointMake(14.51, 13.92) controlPoint2: CGPointMake(18.38, 10.75)];
    [bezierPath addCurveToPoint: CGPointMake(33.08, 21.06) controlPoint1: CGPointMake(28.57, 10.75) controlPoint2: CGPointMake(33.08, 15.36)];
    [bezierPath addLineToPoint: CGPointMake(33.08, 22)];
    [bezierPath addLineToPoint: CGPointMake(35.83, 22)];
    [bezierPath addCurveToPoint: CGPointMake(41.33, 27.63) controlPoint1: CGPointMake(38.88, 22) controlPoint2: CGPointMake(41.33, 24.51)];
    [bezierPath addCurveToPoint: CGPointMake(35.83, 33.25) controlPoint1: CGPointMake(41.33, 30.74) controlPoint2: CGPointMake(38.88, 33.25)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(36.47, 18.32)];
    [bezierPath addCurveToPoint: CGPointMake(23, 7) controlPoint1: CGPointMake(35.23, 11.86) controlPoint2: CGPointMake(29.67, 7)];
    [bezierPath addCurveToPoint: CGPointMake(10.81, 14.57) controlPoint1: CGPointMake(17.7, 7) controlPoint2: CGPointMake(13.1, 10.07)];
    [bezierPath addCurveToPoint: CGPointMake(1, 25.75) controlPoint1: CGPointMake(5.29, 15.17) controlPoint2: CGPointMake(1, 19.96)];
    [bezierPath addCurveToPoint: CGPointMake(12, 37) controlPoint1: CGPointMake(1, 31.96) controlPoint2: CGPointMake(5.93, 37)];
    [bezierPath addLineToPoint: CGPointMake(35.83, 37)];
    [bezierPath addCurveToPoint: CGPointMake(45, 27.63) controlPoint1: CGPointMake(40.89, 37) controlPoint2: CGPointMake(45, 32.8)];
    [bezierPath addCurveToPoint: CGPointMake(36.47, 18.32) controlPoint1: CGPointMake(45, 22.68) controlPoint2: CGPointMake(41.24, 18.66)];
    [bezierPath closePath];
    [fillColor59 setFill];
    [bezierPath fill];
}

+ (void)drawCloud_state_off
{
    //// Color Declarations
    UIColor* fillColor59 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];

    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(15.17, 17)];
    [bezierPath addLineToPoint: CGPointMake(29.84, 31.67)];
    [bezierPath addLineToPoint: CGPointMake(12, 31.67)];
    [bezierPath addCurveToPoint: CGPointMake(4.67, 24.33) controlPoint1: CGPointMake(7.95, 31.67) controlPoint2: CGPointMake(4.67, 28.39)];
    [bezierPath addCurveToPoint: CGPointMake(12, 17) controlPoint1: CGPointMake(4.67, 20.28) controlPoint2: CGPointMake(7.95, 17)];
    [bezierPath addLineToPoint: CGPointMake(15.17, 17)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(6.5, 8.33)];
    [bezierPath addLineToPoint: CGPointMake(11.54, 13.35)];
    [bezierPath addCurveToPoint: CGPointMake(1, 24.33) controlPoint1: CGPointMake(5.69, 13.61) controlPoint2: CGPointMake(1, 18.41)];
    [bezierPath addCurveToPoint: CGPointMake(12, 35.33) controlPoint1: CGPointMake(1, 30.4) controlPoint2: CGPointMake(5.93, 35.33)];
    [bezierPath addLineToPoint: CGPointMake(33.51, 35.33)];
    [bezierPath addLineToPoint: CGPointMake(37.17, 39)];
    [bezierPath addLineToPoint: CGPointMake(39.5, 36.67)];
    [bezierPath addLineToPoint: CGPointMake(8.83, 6)];
    [bezierPath addLineToPoint: CGPointMake(6.5, 8.33)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(36.48, 17.07)];
    [bezierPath addCurveToPoint: CGPointMake(23, 6) controlPoint1: CGPointMake(35.23, 10.75) controlPoint2: CGPointMake(29.67, 6)];
    [bezierPath addCurveToPoint: CGPointMake(15.65, 8.15) controlPoint1: CGPointMake(20.29, 6) controlPoint2: CGPointMake(17.77, 6.79)];
    [bezierPath addLineToPoint: CGPointMake(18.33, 10.82)];
    [bezierPath addCurveToPoint: CGPointMake(23, 9.67) controlPoint1: CGPointMake(19.72, 10.09) controlPoint2: CGPointMake(21.31, 9.67)];
    [bezierPath addCurveToPoint: CGPointMake(33.08, 19.75) controlPoint1: CGPointMake(28.57, 9.67) controlPoint2: CGPointMake(33.08, 14.18)];
    [bezierPath addLineToPoint: CGPointMake(33.08, 20.67)];
    [bezierPath addLineToPoint: CGPointMake(35.83, 20.67)];
    [bezierPath addCurveToPoint: CGPointMake(41.33, 26.17) controlPoint1: CGPointMake(38.88, 20.67) controlPoint2: CGPointMake(41.33, 23.12)];
    [bezierPath addCurveToPoint: CGPointMake(38.47, 30.97) controlPoint1: CGPointMake(41.33, 28.24) controlPoint2: CGPointMake(40.16, 30.04)];
    [bezierPath addLineToPoint: CGPointMake(41.13, 33.63)];
    [bezierPath addCurveToPoint: CGPointMake(45, 26.17) controlPoint1: CGPointMake(43.46, 31.96) controlPoint2: CGPointMake(45, 29.25)];
    [bezierPath addCurveToPoint: CGPointMake(36.48, 17.07) controlPoint1: CGPointMake(45, 21.33) controlPoint2: CGPointMake(41.24, 17.4)];
    [bezierPath closePath];
    [fillColor59 setFill];
    [bezierPath fill];
}

+ (void)drawWarning_state
{
    //// Color Declarations
    UIColor* fillColor59 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];

    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(23, 6)];
    [bezierPath addLineToPoint: CGPointMake(3, 40)];
    [bezierPath addLineToPoint: CGPointMake(43, 40)];
    [bezierPath addLineToPoint: CGPointMake(23, 6)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(21.18, 20.32)];
    [bezierPath addLineToPoint: CGPointMake(24.82, 20.32)];
    [bezierPath addLineToPoint: CGPointMake(24.82, 27.47)];
    [bezierPath addLineToPoint: CGPointMake(21.18, 27.47)];
    [bezierPath addLineToPoint: CGPointMake(21.18, 20.32)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(21.18, 31.05)];
    [bezierPath addLineToPoint: CGPointMake(24.82, 31.05)];
    [bezierPath addLineToPoint: CGPointMake(24.82, 34.63)];
    [bezierPath addLineToPoint: CGPointMake(21.18, 34.63)];
    [bezierPath addLineToPoint: CGPointMake(21.18, 31.05)];
    [bezierPath closePath];
    [fillColor59 setFill];
    [bezierPath fill];
}

#pragma mark Generated Images

+ (UIImage*)imageOfActivitiesIcon
{
    if (_imageOfActivitiesIcon)
        return _imageOfActivitiesIcon;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(48, 48), NO, 0.0f);
    [CSRmeshStyleKit drawActivitiesIcon];

    _imageOfActivitiesIcon = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfActivitiesIcon;
}

+ (UIImage*)imageOfAreasIcon
{
    if (_imageOfAreasIcon)
        return _imageOfAreasIcon;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(48, 48), NO, 0.0f);
    [CSRmeshStyleKit drawAreasIcon];

    _imageOfAreasIcon = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfAreasIcon;
}

+ (UIImage*)imageOfFavouritesIcon
{
    if (_imageOfFavouritesIcon)
        return _imageOfFavouritesIcon;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(48, 48), NO, 0.0f);
    [CSRmeshStyleKit drawFavouritesIcon];

    _imageOfFavouritesIcon = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfFavouritesIcon;
}

+ (UIImage*)imageOfBulbIcon
{
    if (_imageOfBulbIcon)
        return _imageOfBulbIcon;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(48, 48), NO, 0.0f);
    [CSRmeshStyleKit drawBulbIcon];

    _imageOfBulbIcon = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfBulbIcon;
}

+ (UIImage*)imageOfUsersIcon
{
    if (_imageOfUsersIcon)
        return _imageOfUsersIcon;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(48, 48), NO, 0.0f);
    [CSRmeshStyleKit drawUsersIcon];

    _imageOfUsersIcon = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfUsersIcon;
}

+ (UIImage*)imageOfHouse
{
    if (_imageOfHouse)
        return _imageOfHouse;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(132, 132), NO, 0.0f);
    [CSRmeshStyleKit drawHouse];

    _imageOfHouse = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfHouse;
}

+ (UIImage*)imageOfLight_on
{
    if (_imageOfLight_on)
        return _imageOfLight_on;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(80, 80), NO, 0.0f);
    [CSRmeshStyleKit drawLight_on];

    _imageOfLight_on = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfLight_on;
}

+ (UIImage*)imageOfLight_off
{
    if (_imageOfLight_off)
        return _imageOfLight_off;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(80, 80), NO, 0.0f);
    [CSRmeshStyleKit drawLight_off];

    _imageOfLight_off = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfLight_off;
}

+ (UIImage*)imageOfLock_on
{
    if (_imageOfLock_on)
        return _imageOfLock_on;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(80, 80), NO, 0.0f);
    [CSRmeshStyleKit drawLock_on];

    _imageOfLock_on = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfLock_on;
}

+ (UIImage*)imageOfLock_off
{
    if (_imageOfLock_off)
        return _imageOfLock_off;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(80, 80), NO, 0.0f);
    [CSRmeshStyleKit drawLock_off];

    _imageOfLock_off = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfLock_off;
}

+ (UIImage*)imageOfTemperature_on
{
    if (_imageOfTemperature_on)
        return _imageOfTemperature_on;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(80, 80), NO, 0.0f);
    [CSRmeshStyleKit drawTemperature_on];

    _imageOfTemperature_on = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfTemperature_on;
}

+ (UIImage*)imageOfTemperature_off
{
    if (_imageOfTemperature_off)
        return _imageOfTemperature_off;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(80, 80), NO, 0.0f);
    [CSRmeshStyleKit drawTemperature_off];

    _imageOfTemperature_off = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfTemperature_off;
}

+ (UIImage*)imageOfSearch
{
    if (_imageOfSearch)
        return _imageOfSearch;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(22, 22), NO, 0.0f);
    [CSRmeshStyleKit drawSearch];

    _imageOfSearch = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfSearch;
}

+ (UIImage*)imageOfCloud
{
    if (_imageOfCloud)
        return _imageOfCloud;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(22, 22), NO, 0.0f);
    [CSRmeshStyleKit drawCloud];

    _imageOfCloud = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfCloud;
}

+ (UIImage*)imageOfGear
{
    if (_imageOfGear)
        return _imageOfGear;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(40, 40), NO, 0.0f);
    [CSRmeshStyleKit drawGear];

    _imageOfGear = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfGear;
}

+ (UIImage*)imageOfFavourites_off
{
    if (_imageOfFavourites_off)
        return _imageOfFavourites_off;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(104, 104), NO, 0.0f);
    [CSRmeshStyleKit drawFavourites_off];

    _imageOfFavourites_off = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfFavourites_off;
}

+ (UIImage*)imageOfFavourites_on
{
    if (_imageOfFavourites_on)
        return _imageOfFavourites_on;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(104, 104), NO, 0.0f);
    [CSRmeshStyleKit drawFavourites_on];

    _imageOfFavourites_on = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfFavourites_on;
}

+ (UIImage*)imageOfPlus
{
    if (_imageOfPlus)
        return _imageOfPlus;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(104, 104), NO, 0.0f);
    [CSRmeshStyleKit drawPlus];

    _imageOfPlus = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfPlus;
}

+ (UIImage*)imageOfBack_arrow
{
    if (_imageOfBack_arrow)
        return _imageOfBack_arrow;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(22, 22), NO, 0.0f);
    [CSRmeshStyleKit drawBack_arrow];

    _imageOfBack_arrow = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfBack_arrow;
}

+ (UIImage*)imageOfMenu_arrow_down
{
    if (_imageOfMenu_arrow_down)
        return _imageOfMenu_arrow_down;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(25, 25), NO, 0.0f);
    [CSRmeshStyleKit drawMenu_arrow_down];

    _imageOfMenu_arrow_down = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfMenu_arrow_down;
}

+ (UIImage*)imageOfMenu_arrow_up
{
    if (_imageOfMenu_arrow_up)
        return _imageOfMenu_arrow_up;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(25, 25), NO, 0.0f);
    [CSRmeshStyleKit drawMenu_arrow_up];

    _imageOfMenu_arrow_up = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfMenu_arrow_up;
}

+ (UIImage*)imageOfThick_circle
{
    if (_imageOfThick_circle)
        return _imageOfThick_circle;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(20, 20), NO, 0.0f);
    [CSRmeshStyleKit drawThick_circle];

    _imageOfThick_circle = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfThick_circle;
}

+ (UIImage*)imageOfCheckbox_on
{
    if (_imageOfCheckbox_on)
        return _imageOfCheckbox_on;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(30, 30), NO, 0.0f);
    [CSRmeshStyleKit drawCheckbox_on];

    _imageOfCheckbox_on = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfCheckbox_on;
}

+ (UIImage*)imageOfCheckbox_off
{
    if (_imageOfCheckbox_off)
        return _imageOfCheckbox_off;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(30, 30), NO, 0.0f);
    [CSRmeshStyleKit drawCheckbox_off];

    _imageOfCheckbox_off = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfCheckbox_off;
}

+ (UIImage*)imageOfCheckbox_alt_on
{
    if (_imageOfCheckbox_alt_on)
        return _imageOfCheckbox_alt_on;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(30, 30), NO, 0.0f);
    [CSRmeshStyleKit drawCheckbox_alt_on];

    _imageOfCheckbox_alt_on = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfCheckbox_alt_on;
}

+ (UIImage*)imageOfCheckbox_alt_off
{
    if (_imageOfCheckbox_alt_off)
        return _imageOfCheckbox_alt_off;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(30, 30), NO, 0.0f);
    [CSRmeshStyleKit drawCheckbox_alt_off];

    _imageOfCheckbox_alt_off = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfCheckbox_alt_off;
}

+ (UIImage*)imageOfIconHouse
{
    if (_imageOfIconHouse)
        return _imageOfIconHouse;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(50, 50), NO, 0.0f);
    [CSRmeshStyleKit drawIconHouse];

    _imageOfIconHouse = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfIconHouse;
}

+ (UIImage*)imageOfIconBoat
{
    if (_imageOfIconBoat)
        return _imageOfIconBoat;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(50, 50), NO, 0.0f);
    [CSRmeshStyleKit drawIconBoat];

    _imageOfIconBoat = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfIconBoat;
}

+ (UIImage*)imageOfIconBuilding
{
    if (_imageOfIconBuilding)
        return _imageOfIconBuilding;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(50, 50), NO, 0.0f);
    [CSRmeshStyleKit drawIconBuilding];

    _imageOfIconBuilding = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfIconBuilding;
}

+ (UIImage*)imageOfIconCity
{
    if (_imageOfIconCity)
        return _imageOfIconCity;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(50, 50), NO, 0.0f);
    [CSRmeshStyleKit drawIconCity];

    _imageOfIconCity = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfIconCity;
}

+ (UIImage*)imageOfIconUni
{
    if (_imageOfIconUni)
        return _imageOfIconUni;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(50, 50), NO, 0.0f);
    [CSRmeshStyleKit drawIconUni];

    _imageOfIconUni = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfIconUni;
}

+ (UIImage*)imageOfIconStar
{
    if (_imageOfIconStar)
        return _imageOfIconStar;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(50, 50), NO, 0.0f);
    [CSRmeshStyleKit drawIconStar];

    _imageOfIconStar = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfIconStar;
}

+ (UIImage*)imageOfIconParking
{
    if (_imageOfIconParking)
        return _imageOfIconParking;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(50, 50), NO, 0.0f);
    [CSRmeshStyleKit drawIconParking];

    _imageOfIconParking = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfIconParking;
}

+ (UIImage*)imageOfIconDining
{
    if (_imageOfIconDining)
        return _imageOfIconDining;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(50, 50), NO, 0.0f);
    [CSRmeshStyleKit drawIconDining];

    _imageOfIconDining = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfIconDining;
}

+ (UIImage*)imageOfIconHotel
{
    if (_imageOfIconHotel)
        return _imageOfIconHotel;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(50, 50), NO, 0.0f);
    [CSRmeshStyleKit drawIconHotel];

    _imageOfIconHotel = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfIconHotel;
}

+ (UIImage*)imageOfIconShop
{
    if (_imageOfIconShop)
        return _imageOfIconShop;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(50, 50), NO, 0.0f);
    [CSRmeshStyleKit drawIconShop];

    _imageOfIconShop = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfIconShop;
}

+ (UIImage*)imageOfIconTerrain
{
    if (_imageOfIconTerrain)
        return _imageOfIconTerrain;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(50, 50), NO, 0.0f);
    [CSRmeshStyleKit drawIconTerrain];

    _imageOfIconTerrain = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfIconTerrain;
}

+ (UIImage*)imageOfIconNature
{
    if (_imageOfIconNature)
        return _imageOfIconNature;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(50, 50), NO, 0.0f);
    [CSRmeshStyleKit drawIconNature];

    _imageOfIconNature = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfIconNature;
}

+ (UIImage*)imageOfIconPublic
{
    if (_imageOfIconPublic)
        return _imageOfIconPublic;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(50, 50), NO, 0.0f);
    [CSRmeshStyleKit drawIconPublic];

    _imageOfIconPublic = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfIconPublic;
}

+ (UIImage*)imageOfIconSun
{
    if (_imageOfIconSun)
        return _imageOfIconSun;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(50, 50), NO, 0.0f);
    [CSRmeshStyleKit drawIconSun];

    _imageOfIconSun = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfIconSun;
}

+ (UIImage*)imageOfIconSuitcase
{
    if (_imageOfIconSuitcase)
        return _imageOfIconSuitcase;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(50, 50), NO, 0.0f);
    [CSRmeshStyleKit drawIconSuitcase];

    _imageOfIconSuitcase = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfIconSuitcase;
}

+ (UIImage*)imageOfTrashcan
{
    if (_imageOfTrashcan)
        return _imageOfTrashcan;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(22, 22), NO, 0.0f);
    [CSRmeshStyleKit drawTrashcan];

    _imageOfTrashcan = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfTrashcan;
}

+ (UIImage*)imageOfThick
{
    if (_imageOfThick)
        return _imageOfThick;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(22, 22), NO, 0.0f);
    [CSRmeshStyleKit drawThick];

    _imageOfThick = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfThick;
}

+ (UIImage*)imageOfUpdate
{
    if (_imageOfUpdate)
        return _imageOfUpdate;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(22, 22), NO, 0.0f);
    [CSRmeshStyleKit drawUpdate];

    _imageOfUpdate = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfUpdate;
}

+ (UIImage*)imageOfAccessoryGear
{
    if (_imageOfAccessoryGear)
        return _imageOfAccessoryGear;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(65, 65), NO, 0.0f);
    [CSRmeshStyleKit drawAccessoryGear];

    _imageOfAccessoryGear = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfAccessoryGear;
}

+ (UIImage*)imageOfSettingsIcon
{
    if (_imageOfSettingsIcon)
        return _imageOfSettingsIcon;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(48, 48), NO, 0.0f);
    [CSRmeshStyleKit drawSettingsIcon];

    _imageOfSettingsIcon = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfSettingsIcon;
}

+ (UIImage*)imageOfAboutIcon
{
    if (_imageOfAboutIcon)
        return _imageOfAboutIcon;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(48, 48), NO, 0.0f);
    [CSRmeshStyleKit drawAboutIcon];

    _imageOfAboutIcon = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfAboutIcon;
}

+ (UIImage*)imageOfShareIcon
{
    if (_imageOfShareIcon)
        return _imageOfShareIcon;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(48, 48), NO, 0.0f);
    [CSRmeshStyleKit drawShareIcon];

    _imageOfShareIcon = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfShareIcon;
}

+ (UIImage*)imageOfDeveloperOptionsIcon
{
    if (_imageOfDeveloperOptionsIcon)
        return _imageOfDeveloperOptionsIcon;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(48, 48), NO, 0.0f);
    [CSRmeshStyleKit drawDeveloperOptionsIcon];

    _imageOfDeveloperOptionsIcon = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfDeveloperOptionsIcon;
}

+ (UIImage*)imageOfBluetooth_on
{
    if (_imageOfBluetooth_on)
        return _imageOfBluetooth_on;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(45, 45), NO, 0.0f);
    [CSRmeshStyleKit drawBluetooth_on];

    _imageOfBluetooth_on = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfBluetooth_on;
}

+ (UIImage*)imageOfBluetooth_off
{
    if (_imageOfBluetooth_off)
        return _imageOfBluetooth_off;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(45, 45), NO, 0.0f);
    [CSRmeshStyleKit drawBluetooth_off];

    _imageOfBluetooth_off = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfBluetooth_off;
}

+ (UIImage*)imageOfCloud_on
{
    if (_imageOfCloud_on)
        return _imageOfCloud_on;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(45, 45), NO, 0.0f);
    [CSRmeshStyleKit drawCloud_on];

    _imageOfCloud_on = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfCloud_on;
}

+ (UIImage*)imageOfCloud_off
{
    if (_imageOfCloud_off)
        return _imageOfCloud_off;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(45, 45), NO, 0.0f);
    [CSRmeshStyleKit drawCloud_off];

    _imageOfCloud_off = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfCloud_off;
}

+ (UIImage*)imageOfInlineGear
{
    if (_imageOfInlineGear)
        return _imageOfInlineGear;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(29, 22), NO, 0.0f);
    [CSRmeshStyleKit drawInlineGear];

    _imageOfInlineGear = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfInlineGear;
}

+ (UIImage*)imageOfGateway
{
    if (_imageOfGateway)
        return _imageOfGateway;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(80, 80), NO, 0.0f);
    [CSRmeshStyleKit drawGateway];

    _imageOfGateway = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfGateway;
}

+ (UIImage*)imageOfGateway_on
{
    if (_imageOfGateway_on)
        return _imageOfGateway_on;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(45, 45), NO, 0.0f);
    [CSRmeshStyleKit drawGateway_on];

    _imageOfGateway_on = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfGateway_on;
}

+ (UIImage*)imageOfGateway_off
{
    if (_imageOfGateway_off)
        return _imageOfGateway_off;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(45, 45), NO, 0.0f);
    [CSRmeshStyleKit drawGateway_off];

    _imageOfGateway_off = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfGateway_off;
}

+ (UIImage*)imageOfIconQRScanOk
{
    if (_imageOfIconQRScanOk)
        return _imageOfIconQRScanOk;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(40, 40), NO, 0.0f);
    [CSRmeshStyleKit drawIconQRScanOk];

    _imageOfIconQRScanOk = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfIconQRScanOk;
}

+ (UIImage*)imageOfIconQRScanFail
{
    if (_imageOfIconQRScanFail)
        return _imageOfIconQRScanFail;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(40, 40), NO, 0.0f);
    [CSRmeshStyleKit drawIconQRScanFail];

    _imageOfIconQRScanFail = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfIconQRScanFail;
}

+ (UIImage*)imageOfArrow_up
{
    if (_imageOfArrow_up)
        return _imageOfArrow_up;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(70, 70), NO, 0.0f);
    [CSRmeshStyleKit drawArrow_up];

    _imageOfArrow_up = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfArrow_up;
}

+ (UIImage*)imageOfArrow_down
{
    if (_imageOfArrow_down)
        return _imageOfArrow_down;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(70, 70), NO, 0.0f);
    [CSRmeshStyleKit drawArrow_down];

    _imageOfArrow_down = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfArrow_down;
}

+ (UIImage*)imageOfSensor
{
    if (_imageOfSensor)
        return _imageOfSensor;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(80, 80), NO, 0.0f);
    [CSRmeshStyleKit drawSensor];

    _imageOfSensor = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfSensor;
}

+ (UIImage*)imageOfMesh_device
{
    if (_imageOfMesh_device)
        return _imageOfMesh_device;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(80, 80), NO, 0.0f);
    [CSRmeshStyleKit drawMesh_device];

    _imageOfMesh_device = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfMesh_device;
}

+ (UIImage*)imageOfCloud_state_on
{
    if (_imageOfCloud_state_on)
        return _imageOfCloud_state_on;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(46, 46), NO, 0.0f);
    [CSRmeshStyleKit drawCloud_state_on];

    _imageOfCloud_state_on = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfCloud_state_on;
}

+ (UIImage*)imageOfCloud_state_off
{
    if (_imageOfCloud_state_off)
        return _imageOfCloud_state_off;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(46, 46), NO, 0.0f);
    [CSRmeshStyleKit drawCloud_state_off];

    _imageOfCloud_state_off = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfCloud_state_off;
}

+ (UIImage*)imageOfWarning_state
{
    if (_imageOfWarning_state)
        return _imageOfWarning_state;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(46, 46), NO, 0.0f);
    [CSRmeshStyleKit drawWarning_state];

    _imageOfWarning_state = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfWarning_state;
}

#pragma mark Customization Infrastructure

- (void)setActivitiesIconTargets: (NSArray*)activitiesIconTargets
{
    _activitiesIconTargets = activitiesIconTargets;

    for (id target in self.activitiesIconTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfActivitiesIcon];
}

- (void)setAreasIconTargets: (NSArray*)areasIconTargets
{
    _areasIconTargets = areasIconTargets;

    for (id target in self.areasIconTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfAreasIcon];
}

- (void)setFavouritesIconTargets: (NSArray*)favouritesIconTargets
{
    _favouritesIconTargets = favouritesIconTargets;

    for (id target in self.favouritesIconTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfFavouritesIcon];
}

- (void)setBulbIconTargets: (NSArray*)bulbIconTargets
{
    _bulbIconTargets = bulbIconTargets;

    for (id target in self.bulbIconTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfBulbIcon];
}

- (void)setUsersIconTargets: (NSArray*)usersIconTargets
{
    _usersIconTargets = usersIconTargets;

    for (id target in self.usersIconTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfUsersIcon];
}

- (void)setHouseTargets: (NSArray*)houseTargets
{
    _houseTargets = houseTargets;

    for (id target in self.houseTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfHouse];
}

- (void)setLight_onTargets: (NSArray*)light_onTargets
{
    _light_onTargets = light_onTargets;

    for (id target in self.light_onTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfLight_on];
}

- (void)setLight_offTargets: (NSArray*)light_offTargets
{
    _light_offTargets = light_offTargets;

    for (id target in self.light_offTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfLight_off];
}

- (void)setLock_onTargets: (NSArray*)lock_onTargets
{
    _lock_onTargets = lock_onTargets;

    for (id target in self.lock_onTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfLock_on];
}

- (void)setLock_offTargets: (NSArray*)lock_offTargets
{
    _lock_offTargets = lock_offTargets;

    for (id target in self.lock_offTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfLock_off];
}

- (void)setTemperature_onTargets: (NSArray*)temperature_onTargets
{
    _temperature_onTargets = temperature_onTargets;

    for (id target in self.temperature_onTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfTemperature_on];
}

- (void)setTemperature_offTargets: (NSArray*)temperature_offTargets
{
    _temperature_offTargets = temperature_offTargets;

    for (id target in self.temperature_offTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfTemperature_off];
}

- (void)setSearchTargets: (NSArray*)searchTargets
{
    _searchTargets = searchTargets;

    for (id target in self.searchTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfSearch];
}

- (void)setCloudTargets: (NSArray*)cloudTargets
{
    _cloudTargets = cloudTargets;

    for (id target in self.cloudTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfCloud];
}

- (void)setGearTargets: (NSArray*)gearTargets
{
    _gearTargets = gearTargets;

    for (id target in self.gearTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfGear];
}

- (void)setFavourites_offTargets: (NSArray*)favourites_offTargets
{
    _favourites_offTargets = favourites_offTargets;

    for (id target in self.favourites_offTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfFavourites_off];
}

- (void)setFavourites_onTargets: (NSArray*)favourites_onTargets
{
    _favourites_onTargets = favourites_onTargets;

    for (id target in self.favourites_onTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfFavourites_on];
}

- (void)setPlusTargets: (NSArray*)plusTargets
{
    _plusTargets = plusTargets;

    for (id target in self.plusTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfPlus];
}

- (void)setBack_arrowTargets: (NSArray*)back_arrowTargets
{
    _back_arrowTargets = back_arrowTargets;

    for (id target in self.back_arrowTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfBack_arrow];
}

- (void)setMenu_arrow_downTargets: (NSArray*)menu_arrow_downTargets
{
    _menu_arrow_downTargets = menu_arrow_downTargets;

    for (id target in self.menu_arrow_downTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfMenu_arrow_down];
}

- (void)setMenu_arrow_upTargets: (NSArray*)menu_arrow_upTargets
{
    _menu_arrow_upTargets = menu_arrow_upTargets;

    for (id target in self.menu_arrow_upTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfMenu_arrow_up];
}

- (void)setThick_circleTargets: (NSArray*)thick_circleTargets
{
    _thick_circleTargets = thick_circleTargets;

    for (id target in self.thick_circleTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfThick_circle];
}

- (void)setCheckbox_onTargets: (NSArray*)checkbox_onTargets
{
    _checkbox_onTargets = checkbox_onTargets;

    for (id target in self.checkbox_onTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfCheckbox_on];
}

- (void)setCheckbox_offTargets: (NSArray*)checkbox_offTargets
{
    _checkbox_offTargets = checkbox_offTargets;

    for (id target in self.checkbox_offTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfCheckbox_off];
}

- (void)setCheckbox_alt_onTargets: (NSArray*)checkbox_alt_onTargets
{
    _checkbox_alt_onTargets = checkbox_alt_onTargets;

    for (id target in self.checkbox_alt_onTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfCheckbox_alt_on];
}

- (void)setCheckbox_alt_offTargets: (NSArray*)checkbox_alt_offTargets
{
    _checkbox_alt_offTargets = checkbox_alt_offTargets;

    for (id target in self.checkbox_alt_offTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfCheckbox_alt_off];
}

- (void)setIconHouseTargets: (NSArray*)iconHouseTargets
{
    _iconHouseTargets = iconHouseTargets;

    for (id target in self.iconHouseTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfIconHouse];
}

- (void)setIconBoatTargets: (NSArray*)iconBoatTargets
{
    _iconBoatTargets = iconBoatTargets;

    for (id target in self.iconBoatTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfIconBoat];
}

- (void)setIconBuildingTargets: (NSArray*)iconBuildingTargets
{
    _iconBuildingTargets = iconBuildingTargets;

    for (id target in self.iconBuildingTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfIconBuilding];
}

- (void)setIconCityTargets: (NSArray*)iconCityTargets
{
    _iconCityTargets = iconCityTargets;

    for (id target in self.iconCityTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfIconCity];
}

- (void)setIconUniTargets: (NSArray*)iconUniTargets
{
    _iconUniTargets = iconUniTargets;

    for (id target in self.iconUniTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfIconUni];
}

- (void)setIconStarTargets: (NSArray*)iconStarTargets
{
    _iconStarTargets = iconStarTargets;

    for (id target in self.iconStarTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfIconStar];
}

- (void)setIconParkingTargets: (NSArray*)iconParkingTargets
{
    _iconParkingTargets = iconParkingTargets;

    for (id target in self.iconParkingTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfIconParking];
}

- (void)setIconDiningTargets: (NSArray*)iconDiningTargets
{
    _iconDiningTargets = iconDiningTargets;

    for (id target in self.iconDiningTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfIconDining];
}

- (void)setIconHotelTargets: (NSArray*)iconHotelTargets
{
    _iconHotelTargets = iconHotelTargets;

    for (id target in self.iconHotelTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfIconHotel];
}

- (void)setIconShopTargets: (NSArray*)iconShopTargets
{
    _iconShopTargets = iconShopTargets;

    for (id target in self.iconShopTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfIconShop];
}

- (void)setIconTerrainTargets: (NSArray*)iconTerrainTargets
{
    _iconTerrainTargets = iconTerrainTargets;

    for (id target in self.iconTerrainTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfIconTerrain];
}

- (void)setIconNatureTargets: (NSArray*)iconNatureTargets
{
    _iconNatureTargets = iconNatureTargets;

    for (id target in self.iconNatureTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfIconNature];
}

- (void)setIconPublicTargets: (NSArray*)iconPublicTargets
{
    _iconPublicTargets = iconPublicTargets;

    for (id target in self.iconPublicTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfIconPublic];
}

- (void)setIconSunTargets: (NSArray*)iconSunTargets
{
    _iconSunTargets = iconSunTargets;

    for (id target in self.iconSunTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfIconSun];
}

- (void)setIconSuitcaseTargets: (NSArray*)iconSuitcaseTargets
{
    _iconSuitcaseTargets = iconSuitcaseTargets;

    for (id target in self.iconSuitcaseTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfIconSuitcase];
}

- (void)setTrashcanTargets: (NSArray*)trashcanTargets
{
    _trashcanTargets = trashcanTargets;

    for (id target in self.trashcanTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfTrashcan];
}

- (void)setThickTargets: (NSArray*)thickTargets
{
    _thickTargets = thickTargets;

    for (id target in self.thickTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfThick];
}

- (void)setUpdateTargets: (NSArray*)updateTargets
{
    _updateTargets = updateTargets;

    for (id target in self.updateTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfUpdate];
}

- (void)setAccessoryGearTargets: (NSArray*)accessoryGearTargets
{
    _accessoryGearTargets = accessoryGearTargets;

    for (id target in self.accessoryGearTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfAccessoryGear];
}

- (void)setSettingsIconTargets: (NSArray*)settingsIconTargets
{
    _settingsIconTargets = settingsIconTargets;

    for (id target in self.settingsIconTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfSettingsIcon];
}

- (void)setAboutIconTargets: (NSArray*)aboutIconTargets
{
    _aboutIconTargets = aboutIconTargets;

    for (id target in self.aboutIconTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfAboutIcon];
}

- (void)setShareIconTargets: (NSArray*)shareIconTargets
{
    _shareIconTargets = shareIconTargets;

    for (id target in self.shareIconTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfShareIcon];
}

- (void)setDeveloperOptionsIconTargets: (NSArray*)developerOptionsIconTargets
{
    _developerOptionsIconTargets = developerOptionsIconTargets;

    for (id target in self.developerOptionsIconTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfDeveloperOptionsIcon];
}

- (void)setBluetooth_onTargets: (NSArray*)bluetooth_onTargets
{
    _bluetooth_onTargets = bluetooth_onTargets;

    for (id target in self.bluetooth_onTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfBluetooth_on];
}

- (void)setBluetooth_offTargets: (NSArray*)bluetooth_offTargets
{
    _bluetooth_offTargets = bluetooth_offTargets;

    for (id target in self.bluetooth_offTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfBluetooth_off];
}

- (void)setCloud_onTargets: (NSArray*)cloud_onTargets
{
    _cloud_onTargets = cloud_onTargets;

    for (id target in self.cloud_onTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfCloud_on];
}

- (void)setCloud_offTargets: (NSArray*)cloud_offTargets
{
    _cloud_offTargets = cloud_offTargets;

    for (id target in self.cloud_offTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfCloud_off];
}

- (void)setInlineGearTargets: (NSArray*)inlineGearTargets
{
    _inlineGearTargets = inlineGearTargets;

    for (id target in self.inlineGearTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfInlineGear];
}

- (void)setGatewayTargets: (NSArray*)gatewayTargets
{
    _gatewayTargets = gatewayTargets;

    for (id target in self.gatewayTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfGateway];
}

- (void)setGateway_onTargets: (NSArray*)gateway_onTargets
{
    _gateway_onTargets = gateway_onTargets;

    for (id target in self.gateway_onTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfGateway_on];
}

- (void)setGateway_offTargets: (NSArray*)gateway_offTargets
{
    _gateway_offTargets = gateway_offTargets;

    for (id target in self.gateway_offTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfGateway_off];
}

- (void)setIconQRScanOkTargets: (NSArray*)iconQRScanOkTargets
{
    _iconQRScanOkTargets = iconQRScanOkTargets;

    for (id target in self.iconQRScanOkTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfIconQRScanOk];
}

- (void)setIconQRScanFailTargets: (NSArray*)iconQRScanFailTargets
{
    _iconQRScanFailTargets = iconQRScanFailTargets;

    for (id target in self.iconQRScanFailTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfIconQRScanFail];
}

- (void)setArrow_upTargets: (NSArray*)arrow_upTargets
{
    _arrow_upTargets = arrow_upTargets;

    for (id target in self.arrow_upTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfArrow_up];
}

- (void)setArrow_downTargets: (NSArray*)arrow_downTargets
{
    _arrow_downTargets = arrow_downTargets;

    for (id target in self.arrow_downTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfArrow_down];
}

- (void)setSensorTargets: (NSArray*)sensorTargets
{
    _sensorTargets = sensorTargets;

    for (id target in self.sensorTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfSensor];
}

- (void)setMesh_deviceTargets: (NSArray*)mesh_deviceTargets
{
    _mesh_deviceTargets = mesh_deviceTargets;

    for (id target in self.mesh_deviceTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfMesh_device];
}

- (void)setCloud_state_onTargets: (NSArray*)cloud_state_onTargets
{
    _cloud_state_onTargets = cloud_state_onTargets;

    for (id target in self.cloud_state_onTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfCloud_state_on];
}

- (void)setCloud_state_offTargets: (NSArray*)cloud_state_offTargets
{
    _cloud_state_offTargets = cloud_state_offTargets;

    for (id target in self.cloud_state_offTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfCloud_state_off];
}

- (void)setWarning_stateTargets: (NSArray*)warning_stateTargets
{
    _warning_stateTargets = warning_stateTargets;

    for (id target in self.warning_stateTargets)
        [target performSelector: @selector(setImage:) withObject: CSRmeshStyleKit.imageOfWarning_state];
}


@end
