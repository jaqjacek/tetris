package pl.jaqjacek.games.tetris.view 
{
	import org.puremvc.as3.interfaces.INotification;
	import pl.jaqjacek.games.tetris.model.BlockVO;
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
		
		public function CurrentBlockMediator(viewComponent:Object=null) 
		{
			super(NAME, viewComponent);
		}
		
		override public function onRegister():void 
		{
			super.onRegister();
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
					directionX = nBody as int
					this._blockView.x += directionX * blockSize;
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
			_blockView.x = 200;
			_blockView.y = 100;
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