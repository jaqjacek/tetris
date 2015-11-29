package pl.jaqjacek.games.tetris.controller 
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	import pl.jaqjacek.games.tetris.controller.blocks.MoveNextBlockToCurrentBlockCommand;
	import pl.jaqjacek.games.tetris.controller.blocks.UpdateNextBlockCommand;
	import pl.jaqjacek.games.tetris.controller.board.AddBlockToBoardCommand;
	import pl.jaqjacek.games.tetris.controller.moving.MoveAfterTickCommand;
	import pl.jaqjacek.games.tetris.controller.moving.MoveBlockCommand;
	import pl.jaqjacek.games.tetris.controller.moving.StartMovingUpCommand;
	import pl.jaqjacek.games.tetris.controller.moving.StopMovingUpCommand;
	import pl.jaqjacek.games.tetris.notifications.AppNotifications;
	
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
			
			//standard events
			facade.registerCommand(AppNotifications.NEXT_BLOCK_UPDATE, UpdateNextBlockCommand);
			facade.registerCommand(AppNotifications.START_GAME, StartGameCommand);
			facade.registerCommand(AppNotifications.NEXT_CURRENT_BLOCK, MoveNextBlockToCurrentBlockCommand);
			facade.registerCommand(AppNotifications.TIMER_TICK, MoveAfterTickCommand);
			
			//kayboard controler
			facade.registerCommand(AppNotifications.START_SPEEDING_UP, StartMovingUpCommand);
			facade.registerCommand(AppNotifications.STOP_SPEEDING_UP, StopMovingUpCommand);
			
			//moving block

			facade.registerCommand(AppNotifications.MOVE_BLOCK, MoveBlockCommand);
			
			//board
			facade.registerCommand(AppNotifications.ADD_BLOCK_TO_BOARD, AddBlockToBoardCommand);
		}
		
	}

}