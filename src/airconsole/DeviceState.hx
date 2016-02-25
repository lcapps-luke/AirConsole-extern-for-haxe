package airconsole;

/**
 * ...
 * @author Luke Cann
 * 
 * DeviceState contains information about a device in this session.
 * Use the helper methods getUID, getNickname, getProfilePicture and
 * getCustomDeviceState to access this data.
 */
typedef DeviceState = {
	
	/**
	 * The globally unique ID of the user
	 */
	var uid:String;
	
	/**
	 * Custom device data that this API can set.
	 */
	@:optional
	var custom:String;
	
	/**
	 * The nickname of the user.
	 */
	@:optional
	var nickname:String;
	
	/**
	 * If the user has a high server latency.
	 */
	@:optional
	var slow_connection:Bool;
}