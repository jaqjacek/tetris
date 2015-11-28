package pl.jaqjacek.games.tetris.view 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	import pl.jaqjacek.games.tetris.model.BlockProxy;
	import pl.jaqjacek.games.tetris.model.BoardBlockVO;
	import pl.jaqjacek.games.tetris.notifications.AppNotifications;
	
	/**
	 * ...
	 * @author jaq
	 */
	public class BoardMediator extends Mediator 
	{
		private var _boardBlock:BoardBlockVO;
		private var _boardView:BoardView;
		
		public static const NAME:String = "BoardMediator_";
		
		public function BoardMediator(viewComponent:Object=null) 
		{
			super(NAME, viewComponent);
		}
		
		override public function onRegister():void 
		{
			_boardBlock = new BoardBlockVO(2, 15, 20);
			_boardView = new BoardView();
		}
		
		override public function listNotificationInterests():Array 
		{
			return [
				AppNotifications.SHOW_BOARD,
				AppNotifications.HIDE_BOARD
			];
		}
		
		override public function handleNotification(notification:INotification):void 
		{
			var nName:String = notification.getName();
			var nBody:Object = notification.getBody();
			
			switch (nName) 
			{
				case AppNotifications.SHOW_BOARD:
					Sprite(viewComponent).addChildAt(_boardView,0);
					showBoard();
				break;
				case AppNotifications.HIDE_BOARD:
					Sprite(viewComponent).addChild(_boardView);
				break;
				
				default:
			}
		}
		
		public function showBoard():void 
		{
			_boardView.clean();
			var blockProxy:BlockProxy = facade.retrieveProxy(BlockProxy.NAME) as BlockProxy;
			for (var i:int = 0; i < _boardBlock.blockWidth; i++) 
			{
				for (var j:int = 0; j < _boardBlock.blockHeight; j++) 
				{
					addBlockToView(i, j, blockProxy.getBlockMedia(_boardBlock.blockColor));
				}
			}
		}
		
		public function addBlockToView(x:int,y:int,block:MovieClip):void 
		{
			block.width = block.height = 20;
			_boardView.createBlockAt(x,y,block);
		}
		
	}

}