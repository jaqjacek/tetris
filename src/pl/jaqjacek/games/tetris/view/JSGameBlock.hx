package pl.jaqjacek.games.tetris.view;
import pixi.core.display.Container;
import pixi.core.sprites.Sprite;
import pixi.core.textures.Texture;

/**
 * ...
 * @author jaq
 */
class JSGameBlock implements IGameBlock
{
	var _block:Container;
	public var name:String;
	
	public var x(get, set):Float;
	public var y(get, set):Float;
	
	public var width(get, set):Float;
	public var height(get, set):Float;
	
	
	public function new() 
	{
		_block = new Container();
		var texture = Texture.fromImage("block_blue.png");
		_block.addChild(new Sprite(texture));
	}
	
	public function gotoAndStop(blockColor:Int) 
	{
		//_block.gotoAndStop(blockColor);
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
	
	public function getContainer():Container 
	{
		return _block;
	}
}