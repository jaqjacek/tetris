package pl.jaqjacek.games.tetris.view 
{
	/**
	 * ...
	 * @author jaq
	 */
	public class NextBlockMediator extends BlockMediator 
	{
		public static const NAME:String = "NextBlockMediator_"
		
		public function NextBlockMediator(viewComponent:Object=null) 
		{
			super(NAME, viewComponent);
		}
		
		override public function onRegister():void 
		{
			super.onRegister();
			_blockView.scaleX = _blockView.scaleY = 3;
			_blockView.x = 600;
			_blockView.y = 000;
		}
		
	}

}