package pl.jaqjacek.games.tetris.controller.moving ;
import org.puremvc.haxe.interfaces.INotification;
import org.puremvc.haxe.patterns.command.SimpleCommand;
import pl.jaqjacek.games.tetris.model.ParamsProxy;

/**
 * ...
 * @author jaq
 */
class StartMovingUpCommand extends SimpleCommand 
{
	
	public function new()
	{
		super();
	}
	
	override public function execute(notification:INotification):Void 
	{
		var proxy:ParamsProxy=cast facade.retrieveProxy(ParamsProxy.NAME);
		proxy.nextTickInc=1;
	}
	
}