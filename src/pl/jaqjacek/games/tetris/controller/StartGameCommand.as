package pl.jaqjacek.games.tetris.controller 
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	import pl.jaqjacek.games.tetris.notifications.AppNotifications;
	
	/**
	 * ...
	 * @author jaq
	 */
	public class StartGameCommand extends SimpleCommand 
	{
		
		public function StartGameCommand() 
		{
			super();
		}
		
		override public function execute(notification:INotification):void 
		{
			trace( "StartGameCommand.execute > notification : " + notification );
			facade.sendNotification(AppNotifications.NEXT_BLOCK_UPDATE);
			facade.sendNotification(AppNotifications.NEXT_CURRENT_BLOCK);
			facade.sendNotification(AppNotifications.SHOW_BOARD);
			facade.sendNotification(AppNotifications.START_TIMER);
		}
		
	}

}