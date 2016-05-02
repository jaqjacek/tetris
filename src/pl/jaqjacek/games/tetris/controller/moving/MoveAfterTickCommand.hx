package pl.jaqjacek.games.tetris.controller.moving;
import org.puremvc.haxe.interfaces.INotification;
import org.puremvc.haxe.patterns.command.SimpleCommand;
import pl.jaqjacek.games.tetris.notifications.AppNotifications;
import pl.jaqjacek.games.tetris.model.ParamsProxy;
import pl.jaqjacek.games.tetris.view.CurrentBlockMediator;

/**
 * ...
 * @author jaq
 */
class MoveAfterTickCommand extends SimpleCommand 
{
	
	public function new()
	{
		super();
	}
	
	override public function execute(notification:INotification):Void 
	{
		
		var tick:Int = cast notification.getBody();
		var proxy:ParamsProxy = cast facade.retrieveProxy(ParamsProxy.NAME);
		if (tick >= proxy.nextTickMoveDown)
		{
			proxy.nextTickMoveDown=tick + proxy.nextTickInc;
			facade.sendNotification(CurrentBlockMediator.NAME+AppNotifications.CHECK_MOVE_BLOCK_DOWN, proxy.getMoveDownDistance());
		}
	}
	
}