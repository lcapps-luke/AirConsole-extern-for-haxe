package airconsole;

/**
 * ...
 * @author Luke Cann
 */
@:enum
abstract Orientation(String) {
	/**
	 * The portrait orientation.
	 */	
	var PORTRAIT = "portrait";
	
	/**
	 * The landscape orientation.
	 */
	var LANDSCAPE = "landscape";
}