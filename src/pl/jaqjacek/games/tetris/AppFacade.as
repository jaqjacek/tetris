package pl.jaqjacek.games.tetris 
{
	import flash.display.Sprite;
	import org.puremvc.as3.interfaces.IFacade;
	import org.puremvc.as3.patterns.facade.Facade;
	import pl.jaqjacek.games.tetris.controller.StartupCommand;
	import pl.jaqjacek.games.tetris.notifications.AppNotifications;
	/**
	 * ...
	 * @author jaq
	 */
	public class AppFacade extends Facade
	{
		
		public function AppFacade() 
		{
			super();
		}
		
		override protected function initializeController():void 
		{
			super.initializeController();
			registerCommand(AppNotifications.STARTUP, StartupCommand);
		}
		
		public function startup(mainMc:Sprite):void
		{
			this.sendNotification(AppNotifications.STARTUP, mainMc);
			//for debug only
			this.sendNotification("startup_debug");
		}
		
		override public function sendNotification(notificationName:String, body:Object = null, type:String = null):void 
		{
			trace(this, notificationName, body, type);
			super.sendNotification(notificationName, body, type);
		}
	}

}