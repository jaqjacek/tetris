package pl.jaqjacek.games.tetris.view 
{
	import org.puremvc.as3.patterns.mediator.Mediator;
	import pl.jaqjacek.games.tetris.model.BlockVO;
	
	/**
	 * ...
	 * @author jaq
	 */
	public class BlockMediator extends Mediator 
	{
		public static const NAME:String = "BlockMediator_"
		
		protected var _blockView:BlockView;
		public var _block:BlockVO;
		
		
		public function BlockMediator(mediatorName:String=null, viewComponent:Object=null) 
		{
			mediatorName = mediatorName == null ? NAME:mediatorName;
			super(mediatorName, viewComponent);
		}
		
		override public function onRegister():void 
		{
			_blockView = new BlockView();
		}
		
		public function setBlock(block:BlockVO):void 
		{
			_block = block;
			_blockView.clean();
			for (var i:int = 0; i < _block.blockWidth; i++) 
			{
				for (var j:int = 0; j < _block.blockHeight; j++) 
				{
					if (_block.getBlockAt(j, i)) {
						trace(j, i);
						_blockView.createBlockAt(j*50,i*50,_block.getBlockAt(j, i) * _block.blockColor);
					}
				}
			}
		}
		
		override public function onRemove():void 
		{
			_block = null;
			_blockView.clean();
			_block = null;
		}
		
	}

}