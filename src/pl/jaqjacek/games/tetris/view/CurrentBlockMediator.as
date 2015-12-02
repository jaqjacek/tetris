package pl.jaqjacek.games.tetris.view 
{
	import org.puremvc.as3.interfaces.INotification;
	import pl.jaqjacek.games.tetris.model.BlockToBoardVO;
	import pl.jaqjacek.games.tetris.model.BlockVO;
	import pl.jaqjacek.games.tetris.model.BoardBlockVO;
	import pl.jaqjacek.games.tetris.model.ParamsProxy;
	import pl.jaqjacek.games.tetris.notifications.AppNotifications;
	/**
	 * ...
	 * @author jaq
	 */
	public class CurrentBlockMediator extends BlockMediator 
	{
		public static const NAME:String = "CurrentBlockMediator_"
		private var _nextTickMoveDown:int;
		private var _nextTickInc:int;
		private var _currentSpeed:Number;
		private var paramsProxy:ParamsProxy;
		private var nextViewY:Number;
		
		public function CurrentBlockMediator(viewComponent:Object=null) 
		{
			super(NAME, viewComponent);
		}
		
		override public function onRegister():void 
		{
			paramsProxy= facade.retrieveProxy(ParamsProxy.NAME) as ParamsProxy;
			super.onRegister();
			blockSize = paramsProxy.gameBlockSize;
		}
		
		override public function listNotificationInterests():Array 
		{
			var listNotifications:Array = super.listNotificationInterests();
			listNotifications.push(mediatorName+AppNotifications.ROTATE_BLOCK);
			listNotifications.push(mediatorName+AppNotifications.MOVE_BLOCK);
			listNotifications.push(mediatorName+AppNotifications.MOVE_BLOCK_DOWN);
			listNotifications.push(AppNotifications.ADD_BLOCK_TO_BOARD);
			return listNotifications;
		}
		
		override public function handleNotification(notification:INotification):void 
		{
			super.handleNotification(notification);
			var nName:String = notification.getName();
			var nBody:Object = notification.getBody();
			var directionX:int;
			var directionY:Number;
			var currentTick:int;
			var lastY:int;
			switch (nName) 
			{
				case mediatorName+AppNotifications.MOVE_BLOCK:
					directionX = nBody as int
					this._blockView.x = paramsProxy.getCurrentBlockViewX();
				break;
				
				case mediatorName+AppNotifications.MOVE_BLOCK_DOWN:
					directionY = nBody as Number;
					lastY = paramsProxy.currentBlockBlockPositionY;
					nextViewY = this._blockView.y + directionY;
					this._blockView.y = nextViewY;
					if (nextViewY - (paramsProxy.currentBlockBlockPositionY * paramsProxy.gameBlockSize) >= 1) {
						paramsProxy.currentBlockBlockPositionY = Math.floor(nextViewY / paramsProxy.gameBlockSize);
						//lastY = paramsProxy.currentBlockBlockPositionY - 1;
						checkBlockToBoard(paramsProxy.currentBlockBlockPositionX,lastY);
					}
					
				break;
				
				case AppNotifications.ADD_BLOCK_TO_BOARD:
					nextViewY = 0;
				break;
				
				case mediatorName+AppNotifications.ROTATE_BLOCK:
					rotateBlock();
				break;
				default:
			}
		}
		
		override public function setBlock(block:BlockVO):void 
		{
			super.setBlock(block);
			_blockView.x = paramsProxy.getCurrentBlockViewX();
			_blockView.y = paramsProxy.getCurrentBlockViewY();
		}
		
		public function rotateBlock():void 
		{
			_block.goToNextFormation();
			super.setBlock(_block);
		}
		
		public function checkBlockToBoard(lastX:int,lastY:int):void 
		{
			var boardBlock:BoardBlockVO = (facade.retrieveMediator(BoardMediator.NAME) as BoardMediator).boardBlock;
			var blockToBoard:BlockToBoardVO = new BlockToBoardVO(boardBlock, _block, paramsProxy.currentBlockBlockPositionX, paramsProxy.currentBlockBlockPositionY,lastX,lastY)
			facade.sendNotification(AppNotifications.CHECK_ADD_BLOCK_TO_BOARD, blockToBoard);
		}
		
	}

}