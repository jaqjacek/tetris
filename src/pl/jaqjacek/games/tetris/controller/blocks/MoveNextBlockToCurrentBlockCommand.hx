package pl.jaqjacek.games.tetris.controller.blocks ;
import org.puremvc.haxe.interfaces.INotification;
import org.puremvc.haxe.patterns.command.SimpleCommand;
import pl.jaqjacek.games.tetris.model.BlockProxy;
import pl.jaqjacek.games.tetris.model.ParamsProxy;
import pl.jaqjacek.games.tetris.notifications.AppNotifications;
import pl.jaqjacek.games.tetris.view.CurrentBlockMediator;

/**
 * ...
 * @author jaq
 */
class MoveNextBlockToCurrentBlockCommand extends SimpleCommand 
{
	
	public function new()
	{
		super();
	}
	
	override public function execute(notification:INotification):Void 
	{
		var proxy:BlockProxy=cast facade.retrieveProxy(BlockProxy.NAME);
		var paramsProxy:ParamsProxy=cast facade.retrieveProxy(ParamsProxy.NAME);
		proxy.curentBlock=proxy.nextBlock;
		paramsProxy.totalBlockPlayed++;
		paramsProxy.resetCurrentBlockPosition();
		facade.sendNotification(AppNotifications.NEXT_BLOCK_UPDATE);
		facade.sendNotification(AppNotifications.NEXT_BLOCK_UPDATE);
		facade.sendNotification(AppNotifications.UPDATE_LEVEL);
		
		facade.sendNotification(CurrentBlockMediator.NAME+AppNotifications.UPDATE_BLOCK,proxy.curentBlock);
		facade.sendNotification(CurrentBlockMediator.NAME+AppNotifications.SHOW_BLOCK);
		facade.sendNotification(AppNotifications.CHECK_END_OF_GAME);
	}
	
}