package pl.jaqjacek.games.tetris.controller 
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	import pl.jaqjacek.games.tetris.controller.blocks.MoveNextBlockToCurrentBlockCommand;
	import pl.jaqjacek.games.tetris.controller.blocks.UpdateNextBlockCommand;
	import pl.jaqjacek.games.tetris.controller.debug.SetDebugBlockMediatorCommand;
	import pl.jaqjacek.games.tetris.notifications.AppNotifications;
	import pl.jaqjacek.games.tetris.notifications.debug.DebugNotifications;
	
	/**
	 * ...
	 * @author jaq
	 */
	public class CommandRegisterCommand extends SimpleCommand 
	{
		
		public function CommandRegisterCommand() 
		{
			super();
		}
		
		override public function execute(notification:INotification):void 
		{
			trace( "CommandRegisterCommand.execute > notification : " + notification );
			//debug
			facade.registerCommand(DebugNotifications.STARTUP, SetDebugBlockMediatorCommand);
			
			
			//standard events
			facade.registerCommand(AppNotifications.NEXT_BLOCK_UPDATE, UpdateNextBlockCommand);
			facade.registerCommand(AppNotifications.START_GAME, StartGameCommand);
			facade.registerCommand(AppNotifications.NEXT_CURRENT_BLOCK, MoveNextBlockToCurrentBlockCommand);
			
			//kayboard controler
		}
		
	}

}