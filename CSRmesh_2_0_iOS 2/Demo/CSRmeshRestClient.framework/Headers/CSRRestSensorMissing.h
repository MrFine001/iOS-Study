/*!
    Copyright [2015] Qualcomm Technologies International, Ltd.
*/
/* Note: this is an auto-generated file. */


#import <Foundation/Foundation.h>
#import "CSRRestBaseObject.h"


/*!
    The actual Sensor Missing response object
*/

@interface CSRRestSensorMissing : CSRRestBaseObject


/*!
    A Types field is an array of one, two, three or four sensor types, with each value being a 16-bit unsigned integer that determines one of the sensor type that is missing.
*/
 typedef NS_OPTIONS(NSInteger, CSRRestSensorMissingTypesEnum) {
  CSRRestSensorMissingTypesEnumunknown,
  CSRRestSensorMissingTypesEnuminternal_air_temperature,
  CSRRestSensorMissingTypesEnumexternal_air_temperature,
  CSRRestSensorMissingTypesEnumdesired_air_temperature,
  CSRRestSensorMissingTypesEnuminternal_humidity,
  CSRRestSensorMissingTypesEnumexternal_humidity,
  CSRRestSensorMissingTypesEnumexternal_dewpoint,
  CSRRestSensorMissingTypesEnuminternal_door,
  CSRRestSensorMissingTypesEnumexternal_door,
  CSRRestSensorMissingTypesEnuminternal_window,
  CSRRestSensorMissingTypesEnumexternal_window,
  CSRRestSensorMissingTypesEnumsolar_energy,
  CSRRestSensorMissingTypesEnumnumber_of_activations,
  CSRRestSensorMissingTypesEnumfridge_temperature,
  CSRRestSensorMissingTypesEnumdesired_fridge_temperature,
  CSRRestSensorMissingTypesEnumfreezer_temperature,
  CSRRestSensorMissingTypesEnumdesired_freezer_temperature,
  CSRRestSensorMissingTypesEnumoven_temperature,
  CSRRestSensorMissingTypesEnumdesired_oven_temperature,
  CSRRestSensorMissingTypesEnumseat_occupied,
  CSRRestSensorMissingTypesEnumwashing_machine_state,
  CSRRestSensorMissingTypesEnumdish_washer_state,
  CSRRestSensorMissingTypesEnumclothes_dryer_state,
  CSRRestSensorMissingTypesEnumtoaster_state,
  CSRRestSensorMissingTypesEnumcarbon_dioxide,
  CSRRestSensorMissingTypesEnumcarbon_monoxide,
  CSRRestSensorMissingTypesEnumsmoke,
  CSRRestSensorMissingTypesEnumwater_level,
  CSRRestSensorMissingTypesEnumhot_water_temperature,
  CSRRestSensorMissingTypesEnumcold_water_temperature,
  CSRRestSensorMissingTypesEnumdesired_water_temperature,
  CSRRestSensorMissingTypesEnumcooker_hob_back_left_state,
  CSRRestSensorMissingTypesEnumdesired_cooker_hob_back_left_state,
  CSRRestSensorMissingTypesEnumcooker_hob_front_left_state,
  CSRRestSensorMissingTypesEnumdesired_cooker_hob_front_left_state,
  CSRRestSensorMissingTypesEnumcooker_hob_back_middle_state,
  CSRRestSensorMissingTypesEnumdesired_cooker_hob_back_middle_state,
  CSRRestSensorMissingTypesEnumcooker_hob_front_middle_state,
  CSRRestSensorMissingTypesEnumdesired_cooker_hob_front_middle_state,
  CSRRestSensorMissingTypesEnumcooker_hob_back_right_state,
  CSRRestSensorMissingTypesEnumdesired_cooker_hob_back_right_state,
  CSRRestSensorMissingTypesEnumcooker_hob_front_right_state,
  CSRRestSensorMissingTypesEnumdesired_cooker_hob_front_right_state,
  CSRRestSensorMissingTypesEnumdesired_wakeup_alarm_time,
  CSRRestSensorMissingTypesEnumdesired_second_wakeup_alarm_time,
  CSRRestSensorMissingTypesEnumpassive_infrared_state,
  CSRRestSensorMissingTypesEnumwater_flowing,
  CSRRestSensorMissingTypesEnumdesired_water_flow,
  CSRRestSensorMissingTypesEnumaudio_level,
  CSRRestSensorMissingTypesEnumdesired_audio_level,
  CSRRestSensorMissingTypesEnumfan_speed,
  CSRRestSensorMissingTypesEnumdesired_fan_speed,
  CSRRestSensorMissingTypesEnumwind_speed,
  CSRRestSensorMissingTypesEnumwind_speed_gust,
  CSRRestSensorMissingTypesEnumwind_direction,
  CSRRestSensorMissingTypesEnumwind_direction_gust,
  CSRRestSensorMissingTypesEnumrain_fall_last_hour,
  CSRRestSensorMissingTypesEnumrain_fall_today,
  CSRRestSensorMissingTypesEnumbarometric_pressure,
  CSRRestSensorMissingTypesEnumsoil_temperature,
  CSRRestSensorMissingTypesEnumsoil_moisure,
  CSRRestSensorMissingTypesEnumwindow_cover_position,
  CSRRestSensorMissingTypesEnumdesired_window_cover_position,

};



/*!
A Types field is an array of one, two, three or four sensor types, with each value being a 16-bit unsigned integer that determines one of the sensor type that is missing.
*/
@property(nonatomic) NSArray* types;

/*!
    Id of the responding device
*/
@property(nonatomic) NSNumber* deviceId;
  
/*!
  Constructs instance of CSRRestSensorMissing

  @param types - (CSRRestSensorMissingTypesEnum) A Types field is an array of one, two, three or four sensor types, with each value being a 16-bit unsigned integer that determines one of the sensor type that is missing.
  @param deviceId - (NSNumber*) Id of the responding device
  
  @return instance of CSRRestSensorMissing
*/
- (id) initWithtypes: (NSArray*) types     
       deviceId: (NSNumber*) deviceId;
       

@end
