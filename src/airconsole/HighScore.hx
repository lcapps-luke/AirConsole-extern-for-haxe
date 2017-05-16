package airconsole;

/**
 * @author andrew
 */

 /**
 * HighScore contains information about a users high score
 * We highly recommend to read the High Score guide (developers.airconsole.com)
 */
 
typedef HighScore = {
	/**
	 * @property {String} level_name - The name of the level the user was playing
	 * @property {String} level_version - The version of the level the user was
	 *                                    playing
	 * @property {number} score - The score the user has achieved
	 * @property {String} score_string - A human readable version of score.
	 * @property {Object} ranks - A dictionary of rank type to actual rank.
	 * @property {mixed} data - Custom High Score data. Can be used to implement
	 *                          Ghost modes or to verify that it is not a fake
	 *                          high score.
	 * @property {String} uids - The unique ID of the users that achieved the
	 *                           high score.
	 * @property {number} timestamp - The timestamp of the high score
	 * @property {String} nicknames - The nicknames of the users
	 * @property {String} relationship - How the user relates to the current user
	 *                                 - "requested" (a user which was requested)
	 *                                 - "airconsole" (played AirConsole together)
	 *                                 - "facebook" (a facebook friend)
	 *                                 - "other" (about same skill level)
	 * @property {String} location_country_code - The iso3166 country code
	 * @property {String} location_country_name - The name of the country
	 * @property {String} location_region_code - The iso3166 region code
	 * @property {String} location_region_name - The name of the region
	 * @property {String} location_city_name - The name of the city
	 * @property {String} share_url - The URL that should be used to share this
	 *                                high score.
	 * @property {String} share_image - The URL to an image that displays this
	 *                                  high score.
	 */
	
	var level_name:String;
	var level_version:String;
	var score:Int;
	var score_string:String;
	
	var ranks:Dynamic;
	var data:Dynamic;
	
	var uids:String;
	var timestamp:Int;
	var nicknames:String;
	var relationship:String;
	
	var location_country_code:String;
	var location_country_name:String;
	var location_region_code:String;
	var location_region_name:String;
	var location_city_name:String;
	
	var share_url:String;
	var share_image:String;
	
}