package pl.jaqjacek.games.tetris.controller.points;
import org.puremvc.haxe.interfaces.INotification;
import org.puremvc.haxe.patterns.command.SimpleCommand;
import pl.jaqjacek.games.tetris.model.ParamsProxy;
import pl.jaqjacek.games.tetris.notifications.AppNotifications;

/**
 * ...
 * @author jaq
 */
class LinesToPointsCauculatorCommand extends SimpleCommand 
{
	
	public function new()
	{
		super();
	}
	
	override public function execute(notification:INotification):Void 
	{
		var destroyedLines:Int=cast notification.getBody();
		var resultPoints:Int=0;
		var paramsProxy:ParamsProxy=cast facade.retrieveProxy(ParamsProxy.NAME);
		for(i in 0...destroyedLines)
		{
			resultPoints +=paramsProxy.gameBoardWidth *(i +1);
		}
		
		facade.sendNotification(AppNotifications.ADD_POINTS, resultPoints);
		
	}
	
}