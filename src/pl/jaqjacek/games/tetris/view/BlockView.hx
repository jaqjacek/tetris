package pl.jaqjacek.games.tetris.view;
import flash.display.Sprite;
/**
 * ...
 * @author jaq
 */
class BlockView extends Sprite
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
		while(numChildren>0){
			removeChildAt(0);
		}
	}
	
}