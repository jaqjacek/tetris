package pl.jaqjacek.games.tetris.controller.blocks;
import org.puremvc.haxe.interfaces.INotification;
import org.puremvc.haxe.patterns.command.SimpleCommand;
import pl.jaqjacek.games.tetris.model.BlockProxy;
import pl.jaqjacek.games.tetris.notifications.AppNotifications;
import pl.jaqjacek.games.tetris.view.NextBlockMediator;

/**
 * ...
 * @author jaq
 */
class UpdateNextBlockCommand extends SimpleCommand 
{
	
	public function new()
	{
		super();
	}
	
	override public function execute(notification:INotification):Void 
	{
		var proxy:BlockProxy=cast facade.retrieveProxy(BlockProxy.NAME);
		proxy.nextBlock=proxy.getRandomBlock();
		proxy.nextBlock.reset();
		facade.sendNotification(NextBlockMediator.NAME+AppNotifications.SHOW_BLOCK);
		facade.sendNotification(NextBlockMediator.NAME+AppNotifications.UPDATE_BLOCK,proxy.nextBlock);
	}
	
}