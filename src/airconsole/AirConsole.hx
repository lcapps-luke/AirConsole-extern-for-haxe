package airconsole;
import haxe.Constraints.Function;

/**
 * ...
 * @author Luke Cann
 */
@:native("AirConsole")
@:initPackage
extern class AirConsole {

	/**
	 * Your gateway object to AirConsole.
	 * @param opts Constructor config.
	 */
	public function new(?opts:Config):Void;
	
	/**
	 * The device ID of the game screen.
	 */
	public static var SCREEN:Int;
	
	/**
	 * The portrait orientation.
	 */
	public static var ORIENTATION_PORTRAIT:String;
	
	/**
	 * The landscape orientation.
	 */
	public static var ORIENTATION_LANDSCAPE:String;
	
	/**
	 * Sends a message to another device.
	 * @param device_id The device ID to send the message to.
	 * @param data
	 */
	public function message(device_id:Int, data:Dynamic):Void;
	
	/**
	 * Sends a message to all connected devices.
	 * @param data
	 */
	public function broadcast(data:Dynamic):Void;
	
	/**
	 * Gets called when the game console is ready.
	 * This event also fires onConnect for all devices that already are
	 * connected and have loaded your game.
	 * This event also fires onCustomDeviceStateChange for all devices that are
	 * connected, have loaded your game and have set a custom Device State.
	 * @param code The AirConsole join code.
	 */
	public var onReady:String->Void;
	
	/**
	 * Gets called when a device has connected and loaded the game.
	 * @param device_id The device ID that loaded the game.
	 */
	public var onConnect:Int->Void;
	
	/**
	 * Gets called when a device has left the game.
	 * @param device_id The device ID that left the game.
	 */
	public var onDisconnect:Int->Void;
	
	/**
	 * Gets called when a message is received from another device
	 * that called message() or broadcast().
	 * If you dont want to parse messages yourself and prefer an event driven
	 * approach, have a look at http://github.com/AirConsole/airconsole-events/ (No externs for this yet)
	 * @param device_id The device ID that sent the message.
	 * @param data The data that was sent.
	 */
	public var onMessage:Int->Dynamic->Void;
	
	/**
	 * Gets called when a device updates it's custom DeviceState
	 * by calling setCustomDeviceState or setCustomDeviceStateProperty.
	 * Make sure you understand the power of device states:
	 * http://developers.airconsole.com/#/guides/device_ids_and_states
	 * @param device_id The device ID that changed its custom DeviceState.
	 * @param custom_data The custom DeviceState data value
	 */
	public var onCustomDeviceStateChange:Int->Dynamic->Void;
	
	/**
	 * Gets called when a device updates it's profile pic, nickname or email.
	 * @param device_id The device_id that changed its profile.
	 */
	public var onDeviceProfileChange:Int->Void;
	
	/**
	 * Gets called when a device joins/leaves a game session or updates its
	 * DeviceState (custom DeviceState, profile pic, nickname, internal state).
	 * This is function is also called every time onConnect, onDisconnect or
	 * onCustomDeviceStateChange, onDeviceProfileChange is called.
	 * It's like their root function.
	 * @param device_id The device_id that changed its DeviceState.
	 * @param user_data The data of that device. If undefined, the device has left.
	 */
	public var onDeviceStateChange:Int->DeviceState-> Void;
	
	/**
	 * Gets called if the request of requestEmailAddress() was granted.
	 * For privacy reasons, you need to whitelist your game in order to receive
	 * the email address of the user. To whitelist your game, contact
	 * developers@airconsole.com. For development purposes, localhost is always
	 * allowed.
	 * @param email_address The email address of the user if it was set.
	 */
	public var onEmailAddress:String->Void;
	
	/**
	 * Gets called every X milliseconds with device motion data iff the
	 * AirConsole was instantiated with the "device_motion" opts set to the
	 * interval in milliseconds. Only works for controllers.
	 * Note: Some browsers do not allow games to access accelerometer and gyroscope
	 *       in an iframe (your game). So use this method if you need gyroscope
	 *       or accelerometer data.
	 * @param data Data from accelerometer or gyroscope
	 */
	public var onDeviceMotion:MotionData->Void;
	
	/**
	 * Gets called if a fullscreen advertisement is shown on this screen.
	 * In case this event gets called, please mute all sounds.
	 */
	public var onAdShow:Void->Void;
	
	/**
	 * Gets called when an advertisement is finished or no advertisement was shown.
	 * @param ad_was_shown True if an ad was shown and onAdShow was called.
	 */
	public var onAdComplete:Bool->Void;
	
	/**
	 * Gets called when the screen sets the active players by calling
	 * setActivePlayers().
	 * @param player_number The player number of this device. Can be undefined if this device is not part of the active players.
	 */
	public var onActivePlayersChange:Int->Void;
	
	/**
	 * Takes all currently connected controllers and assigns them a player number.
	 * Can only be called by the screen. You don't have to use this helper
	 * function, but this mechanism is very convenient if you want to know which
	 * device is the first player, the second player, the third player ...
	 * The assigned player numbers always start with 0 and are consecutive.
	 * You can hardcode player numbers, but not device_ids.
	 * Once the screen has called setActivePlayers you can get the device_id of
	 * the first player by calling convertPlayerNumberToDeviceId(0), the device_id
	 * of the second player by calling convertPlayerNumberToDeviceId(1), ...
	 * You can also convert device_ids to player numbers by calling
	 * convertDeviceIdToPlayerNumber(device_id). You can get all device_ids that
	 * are active players by calling getActivePlayerDeviceIds().
	 * The screen can call this function every time a game round starts.
	 * @param max_players The maximum number of controllers that should get a player number assigned.
	 */
	public function setActivePlayers(max_players:Int):Void;
	
	/**
	 * Returns an array of device_ids of the active players previously set by the
	 * screen by calling setActivePlayers. The first device_id in the array is the
	 * first player, the second device_id in the array is the second player, ...
	 * @return Array of device_ids
	 */
	public function getActivePlayerDeviceIds():Array<Int>;
	
	/**
	 * Returns the device_id of a player, if the player is part of the active
	 * players previously set by the screen by calling setActivePlayers. If fewer
	 * players are in the game than the passed in player_number or the active
	 * players have not been set by the screen, this function returns undefined.
	 * @param player_number
	 * @return device_id of the player
	 */
	public function convertPlayerNumberToDeviceId(player_number:Int):Int;
	
	/**
	 * Returns the player number for a device_id, if the device_id is part of the
	 * active players previously set by the screen by calling setActivePlayers.
	 * Player numbers are zero based and are consecutive. If the device_id is not
	 * part of the active players, this function returns undefined.
	 * @param device_id
	 * @return player number for the device
	 */
	public function convertDeviceIdToPlayerNumber(device_id:Int):Int;
	
	/**
	 * Returns the device_id of this device.
	 * Every device in an AirConsole session has a device_id.
	 * The screen always has device_id 0. You can use the AirConsole.SCREEN
	 * constant instead of 0.
	 * All controllers also get a device_id. You can NOT assume that the device_ids
	 * of controllers are consecutive or that they start at 1.
	 *
	 * DO NOT HARDCODE CONTROLLER DEVICE IDS!
	 *
	 * If you want to have a logic with "players numbers" (Player 0, Player 1,
	 * Player 2, Player 3) use the setActivePlayers helper function! You can
	 * hardcode player numbers, but not device_ids.
	 *
	 * Within an AirConsole session, devices keep the same device_id when they
	 * disconnect and reconnect. Different controllers will never get the same
	 * device_id in a session. Every device_id remains reserved for the device that
	 * originally got it.
	 *
	 * For more info read
	 * http:// developers.airconsole.com/#/guides/device_ids_and_states
	 */
	public function getDeviceId():Int;
	
	/**
	 * Returns the globally unique id of a device.
	 * @param device_id The device id for which you want the uid. Default is this device.
	 */
	public function getUID(device_id:Int):String;
	
	/**
	 * Returns the nickname of a user.
	 * @param device_id - The device id for which you want the nickname. Default is this device. Screens don't have nicknames.
	 */
	public function getNickname(device_id:Int):String;
	
	/**
	 * Returns the url to a profile picture of the user.
	 * @param device_id The device id for which you want the profile picture. Default is this device. Screens don't have profile pictures.
	 * @param size The size of in pixels of the picture. Default is 64.
	 */
	public function getProfilePicture(device_id:Int, ?size:Int):String;
	
	/**
	 * Returns the device ID of the master controller.
	 */
	public function getMasterControllerDeviceId():Int;
	
	/**
	 * Returns all controller device ids that have loaded your game.
	 */
	public function getControllerDeviceIds():Array<Int>;
	
	/**
	 * Returns the current time of the game server.
	 * This allows you to have a synchronized clock: You can send the server
	 * time in a message to know exactly at what point something happened on a
	 * device. This function can only be called if the AirConsole was instantiated
	 * with the "synchronize_time" opts set to true and after onReady was called.
	 */
	public function getServerTime():Int;
	
	/**
	 * Gets the custom DeviceState of a device.
	 * @param device_id The device ID of which you want the custom state. Default is this device.
	 * @return The custom data previously set by the device.
	 */
	public function getCustomDeviceState(device_id:Int):Dynamic;
	
	/**
	 * Sets the custom DeviceState of this device.
	 * @param data The custom data to set.
	 */
	public function setCustomDeviceState(data:Dynamic):Void;
	
	/**
	 * Sets a property in the custom DeviceState of this device.
	 * @param key The property name.
	 * @param value The property value.
	 */
	public function setCustomDeviceStateProperty(key:String, value:Dynamic):Void;
	
	/**
	 * Request that all devices return to the AirConsole store.
	 */
	public function navigateHome():Void;
	
	/**
	 * Request that all devices load a game by url.
	 */
	public function navigateTo(url:String):Void;
	
	/**
	 * Opens url in external (default-system) browser. Call this method instead of
	 * calling window.open. In-App it will open the system's default browser.
	 * Because of Safari iOS you can only use it with the onclick handler:
	 * <div onclick="airconsole.openExternalUrl('my-url.com');">Open new window</div>
	 * OR in JS with assigning element.onclick.
	 * @param url The url to open
	 */
	public function openExternalUrl(url:String):Void;
	
	/**
	 * Shows or hides the default UI.
	 * @param visible Whether to show or hide the default UI.
	 */
	public function showDefaultUI(visible:Bool):Void;
	
	/**
	 * Sets the device orientation.
	 * @param orientation 
	 */
	public function setOrientation(orientation:Orientation):Void;
	
	/**
	 * Requests the email address of this device and calls onEmailAddress if the
	 * request was granted. For privacy reasons, you need to whitelist your
	 * game in order to receive the email address of the user. To whitelist your
	 * game, contact developers@airconsole.com. For development purposes, localhost
	 * is always allowed.
	 */
	public function requestEmailAddress():Void;
	
	/**
	 * Returns true if a user is logged in.
	 * @param device_id - The device_id of the user. Default is this device.
	 */
	public function isUserLoggedIn(?device_id:Int):Bool;
	
	/**
	 * Lets the user change his nickname, profile picture and email address.
	 * If you need a real nickname of the user, use this function.
	 * onDeviceProfileChange will be called if the user logs in.
	 */
	public function editProfile():Void;
	
	/**
	 * Requests that AirConsole shows a multiscreen advertisment.
	 * Can only be called by the AirConsole.SCREEN.
	 * onAdShow is called on all connected devices if an advertisement
	 * is shown (in this event please mute all sounds).
	 * onAdComplete is called on all connected devices when the
	 * advertisement is complete or no advertisement was shown.
	 */
	public function showAd():Void;
	
	private static function __init__() : Void untyped {
		#if embed_js
		haxe.macro.Compiler.includeFile("airconsole/airconsole-1.4.0.js");
		#end
	}
}