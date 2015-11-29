package pl.jaqjacek.games.tetris.view 
{
	import pl.jaqjacek.games.tetris.model.BlockVO;
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
			_blockView = new NextBlockView();
			blockSize = 30;
			
			_blockView.x = 600;
			_blockView.y = 000;
		}
		
		override public function setBlock(block:BlockVO):void 
		{
			super.setBlock(block);
			(_blockView as NextBlockView).showLabel();
		}
		
	}

}