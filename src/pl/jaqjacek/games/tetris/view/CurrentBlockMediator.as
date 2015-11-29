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
			switch (nName) 
			{
				case mediatorName+AppNotifications.MOVE_BLOCK:
					//directionX = nBody as int
					this._blockView.x = paramsProxy.getCurrentBlockViewX();
					
				break;
				
				case mediatorName+AppNotifications.MOVE_BLOCK_DOWN:
					directionY = nBody as Number;
					this._blockView.y += directionY;
					trace( "this._blockView.y % paramsProxy.currentBlockBlockPositionY : " + this._blockView.y % paramsProxy.currentBlockBlockPositionY );
					if (this._blockView.y - (paramsProxy.currentBlockBlockPositionY *paramsProxy.gameBlockSize) >= 1) {
						paramsProxy.currentBlockBlockPositionY++;
						checkIfBlockIsDown();
					}
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
			trace(block, _blockView, paramsProxy);
			_blockView.x = paramsProxy.getCurrentBlockViewX();
			_blockView.y = paramsProxy.getCurrentBlockViewY();
		}
		
		public function rotateBlock():void 
		{
			_block.goToNextFormation();
			super.setBlock(_block);
		}
		
		public function checkIfBlockIsDown():void 
		{
			var boardBlock:BoardBlockVO = (facade.retrieveMediator(BoardMediator.NAME) as BoardMediator).boardBlock;
			var blockToBoard:BlockToBoardVO = new BlockToBoardVO(boardBlock, _block, paramsProxy.currentBlockBlockPositionX, paramsProxy.currentBlockBlockPositionY)
			facade.sendNotification(AppNotifications.CHECK_ADD_BLOCK_TO_BOARD, blockToBoard);
			//var shouldAddBlockToBoard:Boolean = false;
			//if (paramsProxy.currentBlockBlockPositionY + _block.blockHeight >= paramsProxy.gameBoardHeight ) {
				//paramsProxy.currentBlockBlockPositionY = paramsProxy.gameBoardHeight - _block.blockHeight;
				//shouldAddBlockToBoard = true;
			//}
			//if (shouldAddBlockToBoard) {
//
				//facade.sendNotification(AppNotifications.ADD_BLOCK_TO_BOARD,blockToBoard);
				//facade.sendNotification(AppNotifications.NEXT_CURRENT_BLOCK);
			//}
		}
		
	}

}