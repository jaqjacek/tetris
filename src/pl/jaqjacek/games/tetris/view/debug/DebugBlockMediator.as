package pl.jaqjacek.games.tetris.view.debug 
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import org.puremvc.as3.interfaces.INotification;
	import pl.jaqjacek.games.tetris.model.BlockVO;
	import pl.jaqjacek.games.tetris.notifications.debug.DebugNotifications;
	import pl.jaqjacek.games.tetris.view.BlockMediator;
	
	/**
	 * ...
	 * @author jaq
	 */
	public class DebugBlockMediator extends BlockMediator 
	{
		
		public function DebugBlockMediator(mediatorName:String=null, viewComponent:Object=null) 
		{
			super(mediatorName, viewComponent);
		}
		
		override public function listNotificationInterests():Array 
		{
			return [
				mediatorName+DebugNotifications.SHOW_BLOCK,
				mediatorName+DebugNotifications.UPDATE_BLOCK,
				mediatorName+DebugNotifications.REMOVE_BLOCK,
				mediatorName+DebugNotifications.ROTATE_BLOCK
			];
		}
		
		override public function handleNotification(notification:INotification):void 
		{
			trace( "DebugBlockMediator.handleNotification > notification : " + notification );
			var nName:String = notification.getName();
			var nBody:Object = notification.getBody();
			switch (nName) 
			{
				case mediatorName+DebugNotifications.SHOW_BLOCK:
					getStage().addChild(_blockView);
				break;
				case mediatorName+DebugNotifications.UPDATE_BLOCK:
					setBlock(nBody as BlockVO);
				break;
				default:
			}
		}
		
		
		
	}

}