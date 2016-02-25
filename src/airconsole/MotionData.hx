package airconsole;

/**
 * @author Luke Cann
 * 
 * x, y, z for accelerometer.
 * alpha, beta, gamma for gyroscope.
 */
typedef MotionData = {
	@:optional
	var x:Float;
	@:optional
	var y:Float;
	@:optional
	var z:Float;
	
	@:optional
	var alpha:Float;
	@:optional
	var beta:Float;
	@:optional
	var gamma:Float;
}