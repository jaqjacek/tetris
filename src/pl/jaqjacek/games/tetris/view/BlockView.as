package pl.jaqjacek.games.tetris.view 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author jaq
	 */
	public class BlockView extends Sprite
	{
		public function BlockView() 
		{
			
		}
		
		public function show():void 
		{
			visible = true;
		}
		
		public function hide():void 
		{
			visible = false;
		}
		
		public function createBlockAt(x:int,y:int,block:MovieClip):void 
		{
			block.x = x*block.width; 
			block.y = y*block.height;
			addChild(block);
			block.name = getBlockName(x, y);
		}
		
		public function getBlockName(x:int, y:int):String
		{
			return "block_" + x + "_" + y;
		}
		
		public function getBlockAt(x:int,y:int):MovieClip
		{
			return getChildByName(getBlockName(x, y)) as MovieClip;
		}
		
		public function clean():void 
		{
			while (numChildren > 0 ) {
				removeChildAt(0);
			}
		}
		
	}

}