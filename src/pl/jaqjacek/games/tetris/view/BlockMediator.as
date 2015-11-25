package pl.jaqjacek.games.tetris.view 
{
	import flash.display.MovieClip;
	import org.puremvc.as3.patterns.mediator.Mediator;
	import pl.jaqjacek.games.tetris.model.BlockProxy;
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
			var blockProxy:BlockProxy = facade.retrieveProxy(BlockProxy.NAME) as BlockProxy;
			var blockProxy:BlockProxy = facade.retrieveProxy(BlockProxy.NAME) as BlockProxy;
			_block = block;
			_blockView.clean();
			for (var i:int = 0; i < _block.blockWidth; i++) 
			{
				for (var j:int = 0; j < _block.blockHeight; j++) 
				{
					if (_block.getBlockAt(i, j)) {
						addBlockToView(i, j, blockProxy.getBlockMedia(_block.blockColor));
					}
				}
			}
		}
		
		public function addBlockToView(x:int,y:int,block:MovieClip):void 
		{
			_blockView.createBlockAt(x,y,block);
		}
		
		override public function onRemove():void 
		{
			_block = null;
			_blockView.clean();
			_block = null;
		}
		
	}

}