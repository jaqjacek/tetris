package pl.jaqjacek.games.tetris.view 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	/**
	 * ...
	 * @author jaq
	 */
	public class PointsView extends Sprite
	{
		private var _scoreLabel:TextField;
		private var _scorePoints:TextField;
		
		public function PointsView() 
		{
			_scoreLabel = new TextField();
			_scoreLabel.text = "POINTS : ";
			_scorePoints = new TextField();
			addChild(_scoreLabel);
			addChild(_scorePoints);
			_scorePoints.x = _scoreLabel.width + 10;
		}
		
		public function show():void 
		{
			this.visible = true;
		}
		
		public function hide():void 
		{
			this.visible = false;
		}
		
		public function setScore(scoreAmount:int):void 
		{
			_scorePoints.text = scoreAmount.toString();
		}
		
	}

}