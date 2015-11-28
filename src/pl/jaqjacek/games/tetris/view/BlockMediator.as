package pl.jaqjacek.games.tetris.view 
{
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	import pl.jaqjacek.games.tetris.model.BlockProxy;
	import pl.jaqjacek.games.tetris.model.BlockVO;
	import pl.jaqjacek.games.tetris.notifications.AppNotifications;
	
	/**
	 * ...
	 * @author jaq
	 */
	public class BlockMediator extends Mediator 
	{
		public static const NAME:String = "BlockMediator_"
		
		protected var _blockView:BlockView;
		public var _block:BlockVO;
		public var blockSize:Number;
		
		
		public function BlockMediator(mediatorName:String=null, viewComponent:Object=null) 
		{
			mediatorName = mediatorName == null ? NAME:mediatorName;
			super(mediatorName, viewComponent);
		}
		
		override public function onRegister():void 
		{
			_blockView = new BlockView();
			blockSize = 20;
		}
		
		public function setBlock(block:BlockVO):void 
		{
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
			block.width = block.height = blockSize;
			_blockView.createBlockAt(x,y,block);
		}
		
		override public function onRemove():void 
		{
			_block = null;
			_blockView.clean();
			_block = null;
		}
		
		override public function listNotificationInterests():Array 
		{
			return [
				mediatorName+AppNotifications.SHOW_BLOCK,
				mediatorName+AppNotifications.UPDATE_BLOCK,
				mediatorName+AppNotifications.REMOVE_BLOCK,
			];
		}
		
		override public function handleNotification(notification:INotification):void 
		{
			var nName:String = notification.getName();
			var nBody:Object = notification.getBody();
			switch (nName) 
			{
				case mediatorName+AppNotifications.SHOW_BLOCK:
					showBlock();
				break;
				case mediatorName+AppNotifications.UPDATE_BLOCK:
					setBlock(nBody as BlockVO);
				break;
				default:
			}
		}
		
		public function showBlock():void 
		{
			getStage().addChild(_blockView);
		}
		
		protected function getStage():DisplayObjectContainer
		{
			return viewComponent as DisplayObjectContainer;
		}
		
	}

}