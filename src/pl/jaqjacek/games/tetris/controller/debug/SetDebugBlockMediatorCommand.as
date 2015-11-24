package pl.jaqjacek.games.tetris.controller.debug 
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	import pl.jaqjacek.games.tetris.model.BlockFactory;
	import pl.jaqjacek.games.tetris.notifications.debug.DebugNotifications;
	
	/**
	 * ...
	 * @author jaq
	 */
	public class SetDebugBlockMediatorCommand extends SimpleCommand 
	{
		
		public function SetDebugBlockMediatorCommand() 
		{
			super();
		}
		
		override public function execute(notification:INotification):void 
		{
			facade.sendNotification(DebugNotifications.SHOW_BLOCK);
			facade.sendNotification(DebugNotifications.SHOW_BLOCK);
			facade.sendNotification(DebugNotifications.UPDATE_BLOCK,BlockFactory.getRandomBlock());
		}
		
	}

}