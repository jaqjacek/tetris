package pl.jaqjacek.games.tetris.view.level 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	/**
	 * ...
	 * @author jaq
	 */
	public class LevelView extends Sprite
	{
		private var _levelLabel:TextField;
		private var _levelPoints:TextField;
		
		public function LevelView() 
		{
			_levelLabel = new TextField();
			_levelLabel.text = "LEVEL : ";
			_levelPoints = new TextField();
			addChild(_levelLabel);
			addChild(_levelPoints);
			_levelPoints.x = _levelLabel.width + 10;
		}
		
		public function show():void 
		{
			this.visible = true;
		}
		
		public function hide():void 
		{
			this.visible = false;
		}
		
		public function setlevel(levelAmount:int):void 
		{
			_levelPoints.text = levelAmount.toString();
		}
		
	}

}