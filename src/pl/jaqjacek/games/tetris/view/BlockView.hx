package pl.jaqjacek.games.tetris.view;
import pixi.core.display.Container;
#if flash
import flash.display.Sprite;
#elsif js
#end
/**
 * ...
 * @author jaq
 */
#if flash
class BlockView extends Sprite
#elseif js
class BlockView extends Container
#end
{
	var _blocks:Array<IGameBlock>;
	public function new()
	{
		super();
		_blocks = [];
	}
	
	public function show():Void 
	{
		visible=true;
	}
	
	public function hide():Void 
	{
		visible=false;
	}
	
	public function createBlockAt(x:Int,y:Int,block:IGameBlock):Void 
	{
		block.x = x * block.width;
		block.y = y * block.height;
		addChild(block.getContainer());
		block.name = getBlockName(x, y);
		_blocks.push(block);
	}
	
	public function getBlockName(x:Int, y:Int):String
	{
		return "block_" + x + "_" + y;
	}
	
	public function getBlockAt(x:Int,y:Int):IGameBlock
	{
		for (block in _blocks) 
		{
			if (block.name == getBlockName(x, y)) {
				return block;
			}
		}
		return null;
	}
	
	public function clean():Void 
	{
		#if flash
		while(numChildren>0){
			removeChildAt(0);
		}
		#end
		#if js
			while (children.length > 0) {
				removeChildAt(0);
			}
		#end
		//TODO nead clean in js target
	}
	
}