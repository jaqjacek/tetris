package pl.jaqjacek.games.tetris;
import org.puremvc.haxe.patterns.facade.Facade;
import pixi.core.display.Container;
#if js
import pixi.core.text.Text;
#end
import pixi.plugins.app.Application;
import pl.jaqjacek.games.tetris.controller.StartupCommand;
import pl.jaqjacek.games.tetris.notifications.AppNotifications;
/**
 * ...
 * @author jaq
 */
class AppFacade extends Facade
{
	#if js
	var mainMc:Application;
	var output:Text;
	#end
	public function new()
	{
		super();
	}
	
	override private function initializeController():Void 
	{
		super.initializeController();
		registerCommand(AppNotifications.STARTUP, StartupCommand);
	}
	
	public function startup(mainMc:Application):Void
	{
		#if js
		this.mainMc = mainMc;
		#end
		this.sendNotification(AppNotifications.STARTUP, mainMc.stage);
		this.sendNotification(AppNotifications.START_GAME,mainMc);
	}
	
	override public function sendNotification(notificationName:String, body:Dynamic=null, type:String=null):Void 
	{
		#if js
		if (output == null) {
			output = new Text('test');
			mainMc.stage.addChild(output);
			output.x = 20;
			output.y = 400;
		}
		var tmpArray:Array<String> = output.text.split("\n");
		if (tmpArray.length > 3) {
			output.text = tmpArray.pop()+"\n";
		}
		output.text = output.text + "\n" + notificationName+" "+body;
		#end
		super.sendNotification(notificationName, body, type);
	}
}