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
		
		public function createBlockAt(x:int,y:int,color:int=0):void 
		{
			//TODO add movieclip from blocks swc
			var colorSprite:MovieClip = new MovieClip();
			colorSprite.graphics.beginFill(0x00ff00);
			colorSprite.graphics.drawRect(0,0,50,50);
			colorSprite.graphics.endFill();
			colorSprite.x = x; 
			colorSprite.y = y;
			addChild(colorSprite);
		}
		
		public function clean():void 
		{
			while (numChildren > 0 ) {
				removeChildAt(0);
			}
		}
		
	}

}