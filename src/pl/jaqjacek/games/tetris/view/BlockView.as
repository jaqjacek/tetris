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
		}
		
		public function clean():void 
		{
			while (numChildren > 0 ) {
				removeChildAt(0);
			}
		}
		
	}

}