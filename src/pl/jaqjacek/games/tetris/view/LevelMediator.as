package pl.jaqjacek.games.tetris.view 
{
	import flash.display.Sprite;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	import pl.jaqjacek.games.tetris.model.ParamsProxy;
	import pl.jaqjacek.games.tetris.notifications.AppNotifications;
	
	/**
	 * ...
	 * @author jaq
	 */
	public class LevelMediator extends Mediator 
	{
		
		public static const NAME:String = "LevelMediator_"
		private var _levelView:LevelView;
		
		public function LevelMediator(viewComponent:Object=null) 
		{
			super(NAME, viewComponent);
			
		}
		
		override public function onRegister():void 
		{
			_levelView = new LevelView();
			(viewComponent as Sprite).addChild(_levelView);
			_levelView.setlevel(1);
			_levelView.y = 100;
		}
		
		override public function listNotificationInterests():Array 
		{
			return [
					AppNotifications.UPDATE_LEVEL
			];
		}
		
		override public function handleNotification(notification:INotification):void 
		{
			var nName:String = notification.getName();
			var nBody:Object = notification.getBody();
			var paramsProxy:ParamsProxy = facade.retrieveProxy(ParamsProxy.NAME) as ParamsProxy;
			switch (nName) 
			{
				case AppNotifications.UPDATE_LEVEL:
					paramsProxy.currentLevel = Math.floor(paramsProxy.totalBlockPlayed / 10)+1;
					_levelView.setlevel(paramsProxy.currentLevel);
				break;
				default:
			}
		}
		
	}

}