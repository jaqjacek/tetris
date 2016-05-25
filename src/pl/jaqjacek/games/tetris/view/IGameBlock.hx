package pl.jaqjacek.games.tetris.view;

/**
 * @author jaq
 */
interface IGameBlock 
{
	public var name:String;
	//
	public var x(get, set):Float;
	public var y(get, set):Float;
	
	public var width(get, set):Float;
	public var height(get, set):Float;
	
	function gotoAndStop(blockColor:Int):Void; 
	
	//function set_x(newX:Float):Float; 
	//
	//function get_x():Float;
	//
	//function set_y(newY:Float):Float; 
	//
	//function get_y():Float;
	//
	//function set_width(newWidth:Float):Float; 
	//
	//function get_width():Float;
	
	//function set_height(newHeight:Float):Float; 
	//
	//function get_height():Float;
	
	function getContainer():Dynamic;
}