package pl.jaqjacek.games.tetris.controller 
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	import pl.jaqjacek.games.tetris.notifications.AppNotifications;
	
	/**
	 * ...
	 * @author jaq
	 */
	public class EndGameCommand extends SimpleCommand 
	{
		
		public function EndGameCommand() 
		{
			super();
		}
		
		override public function execute(notification:INotification):void 
		{
			super.execute(notification);
			facade.sendNotification(AppNotifications.STOP_TIMER);
		}
		
	}

}