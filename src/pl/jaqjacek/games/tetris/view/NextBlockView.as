package pl.jaqjacek.games.tetris.view 
{
	import flash.display.MovieClip;
	import flash.text.TextField;
	/**
	 * ...
	 * @author jaq
	 */
	public class NextBlockView extends BlockView 
	{
		public var nextBlockLabel:TextField;
		
		public function NextBlockView() 
		{
			super();
			nextBlockLabel = new TextField();
			nextBlockLabel.text = "NEXT BLOCK";
			nextBlockLabel.y = 120;
		}
		
		public function showLabel():void 
		{
			addChild(nextBlockLabel);
		}
		
	}

}