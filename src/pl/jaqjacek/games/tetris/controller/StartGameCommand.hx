package pl.jaqjacek.games.tetris.controller;
import org.puremvc.haxe.interfaces.INotification;
import org.puremvc.haxe.patterns.command.SimpleCommand;
import pl.jaqjacek.games.tetris.notifications.AppNotifications;

/**
 * ...
 * @author jaq
 */
class StartGameCommand extends SimpleCommand 
{
	
	public function new()
	{
		super();
	}
	
	override public function execute(notification:INotification):Void 
	{
		facade.sendNotification(AppNotifications.NEXT_BLOCK_UPDATE);
		facade.sendNotification(AppNotifications.NEXT_CURRENT_BLOCK);
		facade.sendNotification(AppNotifications.SHOW_BOARD);
		facade.sendNotification(AppNotifications.START_TIMER,notification.getBody());
	}
	
}