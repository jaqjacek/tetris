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
	var _sprite:Sprite;
	public var name:String;
	
	public var x(get, set):Float;
	public var y(get, set):Float;
	
	public var width(get, set):Float;
	public var height(get, set):Float;
	
	
	public function new() 
	{
		_block = new Container();
		_sprite = new Sprite();
	}
	
	public function gotoAndStop(blockColor:Int) 
	{
		var path:String = 'assets/img/block_';
		var color:String = 'white';
		switch (blockColor) 
		{
			case 1:
				color = 'yellow';
			case 2:
				color = 'red';
			case 3:
				color = 'purple';
			case 4:
				color = 'orange';
			case 5:
				color = 'green';
			case 6:
				color = 'cyan';
			case 7:
				color = 'blue';
			default:
				
		}
		while (_block.children.length > 0) {
			_block.removeChildAt(0);
		}
		while (_sprite.children.length > 0) {
			_sprite.removeChildAt(0);
		}
		path = path + color + '.png';
		var texture = Texture.fromImage(path);
		_sprite = new Sprite(texture);
		_block.addChild(_sprite);
		_sprite.width  = 50;
		_sprite.height  = 50;
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
		return _sprite.width = newWidth;
	}
	
	public function get_width():Float
	{
		return _sprite.width;
	}
	
	public function set_height(newHeight:Float) 
	{
		return _sprite.height = newHeight;
	}
	
	public function get_height():Float
	{
		return _sprite.height;
	}
	
	public function getContainer():Container 
	{
		return _block;
	}
}