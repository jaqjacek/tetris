package pl.jaqjacek.games.tetris.controller ;
import org.puremvc.haxe.interfaces.INotification;
import org.puremvc.haxe.patterns.command.SimpleCommand;
import pl.jaqjacek.games.tetris.model.BlockProxy;
import pl.jaqjacek.games.tetris.model.ParamsProxy;

/**
 * ...
 * @author jaq
 */
class ProxyRegisterCommand extends SimpleCommand 
{
	
	public function new()
	{
		super();
	}
	
	override public function execute(notification:INotification):Void 
	{
		facade.registerProxy(new BlockProxy());
		facade.registerProxy(new ParamsProxy());
	}
	
}