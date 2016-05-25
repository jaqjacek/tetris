package pl.jaqjacek.games.tetris.view;

import flash.display.DisplayObject;
import flash.display.MovieClip;
import pl.jaqjacek.games.tetris.media.Block;
/**
 * ...
 * @author jaq
 */
class FlashGameBlock implements IGameBlock
{
	var _block:MovieClip;
	public var name:String;
	
	public var x(get, set):Float;
	public var y(get, set):Float;
	
	public var width(get, set):Float;
	public var height(get, set):Float;
	
	
	public function new() 
	{
		_block = new Block();
	}
	
	public function gotoAndStop(blockColor:Int) 
	{
		_block.gotoAndStop(blockColor);
	}
	
	public function set_x(newX:Float) 
	{
		return _block.x = newX;
	}
	
	public function get_x():Float
	{
		return _block.x;
	}
	
	public function set_y(newY:Float) 
	{
		return _block.y = newY;
	}
	
	public function get_y():Float
	{
		return _block.y;
	}
	
	public function set_width(newWidth:Float) 
	{
		return _block.width = newWidth;
	}
	
	public function get_width():Float
	{
		return _block.width;
	}
	
	public function set_height(newHeight:Float) 
	{
		return _block.height = newHeight;
	}
	
	public function get_height():Float
	{
		return _block.height;
	}
	
	public function getContainer():DisplayObject 
	{
		return _block;
	}
}