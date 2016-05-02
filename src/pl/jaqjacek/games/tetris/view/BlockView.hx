package pl.jaqjacek.games.tetris.view;
import flash.display.MovieClip;
import flash.display.Sprite;
/**
 * ...
 * @author jaq
 */
class BlockView extends Sprite
{
	public function new()
	{
		super();
	}
	
	public function show():Void 
	{
		visible=true;
	}
	
	public function hide():Void 
	{
		visible=false;
	}
	
	public function createBlockAt(x:Int,y:Int,block:MovieClip):Void 
	{
		block.x=x*block.width;
		block.y=y*block.height;
		addChild(block);
		block.name=getBlockName(x, y);
	}
	
	public function getBlockName(x:Int, y:Int):String
	{
		return "block_" + x + "_" + y;
	}
	
	public function getBlockAt(x:Int,y:Int):MovieClip
	{
		return cast getChildByName(getBlockName(x, y));
	}
	
	public function clean():Void 
	{
		while(numChildren>0){
			removeChildAt(0);
		}
	}
	
}