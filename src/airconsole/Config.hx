package airconsole;

/**
 * ...
 * @author Luke Cann
 * 
 * The configuration for the AirConsole constructor.
 */
typedef Config = {
	
	var orientation:Orientation;
	
	/**
	 * If set to true, you can call getServerTime() to get the time on the game server.
	 * Default is false.
	 */
	@:optional
	var synchronize_time:Bool;
	
	/**
	 * Sets up the document so nothing is selectable, zoom is fixed to 1 and 
	 * scrolling is disabled (iOS 8 clients drop out of fullscreen when scrolling).
	 * Default: true
	 */
	@:optional
	var setup_document:Bool;
	
	/**
	 * If set, onDeviceMotion gets called every "device_motion"
	 * milliseconds with data from the accelerometer and the gyroscope. 
	 * Only for controllers.
	 */
	@:optional
	var device_motion:Int;
}