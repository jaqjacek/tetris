package pl.jaqjacek.games.tetris;

import org.puremvc.haxe.patterns.facade.Facade;
import pl.jaqjacek.games.tetris.controller.StartupCommand;
import pl.jaqjacek.games.tetris.notifications.AppNotifications;
/**
 * ...
 * @author jaq
 */
class AppFacade extends Facade
{
	
	public function new()
	{
		super();
	}
	
	override private function initializeController():Void 
	{
		super.initializeController();
		registerCommand(AppNotifications.STARTUP, StartupCommand);
	}
	
	public function startup(mainMc:Dynamic):Void
	{
		this.sendNotification(AppNotifications.STARTUP, mainMc);
		this.sendNotification(AppNotifications.START_GAME);
	}
	
	override public function sendNotification(notificationName:String, body:Dynamic=null, type:String=null):Void 
	{
		//don't show timer tick sending event
		//if(notificationName.indexOf("timerTick")==-1 && notificationName.indexOf("moveBlockDown")==-1){
			trace(this, notificationName, body, type);
		//}
		super.sendNotification(notificationName, body, type);
	}
}