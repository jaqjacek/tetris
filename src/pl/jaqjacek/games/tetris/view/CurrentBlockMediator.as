package pl.jaqjacek.games.tetris.view 
{
	import org.puremvc.as3.interfaces.INotification;
	import pl.jaqjacek.games.tetris.model.BlockVO;
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
					checkIfBlockIsDown();
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
			_blockView.y = paramsProxy.gameBoardViewStartY+paramsProxy.gameBlockSize;
		}
		
		public function rotateBlock():void 
		{
			_block.goToNextFormation();
			super.setBlock(_block);
		}
		
		public function checkIfBlockIsDown():void 
		{
			if (_blockView.y > 400) {
				facade.sendNotification(AppNotifications.NEXT_CURRENT_BLOCK);
			}
		}
		
	}

}