package pl.jaqjacek.games.tetris.controller ;
import org.puremvc.haxe.interfaces.INotification;
import org.puremvc.haxe.patterns.command.SimpleCommand;
import pl.jaqjacek.games.tetris.controller.blocks.MoveNextBlockToCurrentBlockCommand;
import pl.jaqjacek.games.tetris.controller.blocks.UpdateNextBlockCommand;
import pl.jaqjacek.games.tetris.controller.board.AddBlockToBoardCommand;
import pl.jaqjacek.games.tetris.controller.board.CheckAddBlockToBoardCommand;
import pl.jaqjacek.games.tetris.controller.board.CheckFullLinesOnBoardCommand;
import pl.jaqjacek.games.tetris.controller.board.SpliceLineFromBoardCommand;
import pl.jaqjacek.games.tetris.controller.moving.CheckEndOfGameCommand;
import pl.jaqjacek.games.tetris.controller.moving.CheckIfBlockCanBeRotatedCommand;
import pl.jaqjacek.games.tetris.controller.moving.MoveAfterTickCommand;
import pl.jaqjacek.games.tetris.controller.moving.MoveBlockCommand;
import pl.jaqjacek.games.tetris.controller.moving.StartMovingUpCommand;
import pl.jaqjacek.games.tetris.controller.moving.StopMovingUpCommand;
import pl.jaqjacek.games.tetris.controller.points.LinesToPointsCauculatorCommand;
import pl.jaqjacek.games.tetris.notifications.AppNotifications;

/**
 * ...
 * @author jaq
 */
class CommandRegisterCommand extends SimpleCommand 
{
	
	public function new()
	{
		super();
	}
	
	override public function execute(notification:INotification):Void 
	{
		//standard events
		facade.registerCommand(AppNotifications.NEXT_BLOCK_UPDATE, UpdateNextBlockCommand);
		facade.registerCommand(AppNotifications.NEXT_CURRENT_BLOCK, MoveNextBlockToCurrentBlockCommand);
		facade.registerCommand(AppNotifications.TIMER_TICK, MoveAfterTickCommand);
		
		//kayboard controler
		facade.registerCommand(AppNotifications.START_SPEEDING_UP, StartMovingUpCommand);
		facade.registerCommand(AppNotifications.STOP_SPEEDING_UP, StopMovingUpCommand);
		
		//moving block

		facade.registerCommand(AppNotifications.MOVE_BLOCK, MoveBlockCommand);
		facade.registerCommand(AppNotifications.CHECK_BLOCK_ROTATION, CheckIfBlockCanBeRotatedCommand);
		
		//board
		facade.registerCommand(AppNotifications.ADD_BLOCK_TO_BOARD, AddBlockToBoardCommand);
		facade.registerCommand(AppNotifications.CHECK_ADD_BLOCK_TO_BOARD, CheckAddBlockToBoardCommand);
		facade.registerCommand(AppNotifications.CHECK_FULL_LINES_ON_BOARD, CheckFullLinesOnBoardCommand);
		facade.registerCommand(AppNotifications.BOARD_SPLICE_LINE, SpliceLineFromBoardCommand);
		facade.registerCommand(AppNotifications.CHECK_END_OF_GAME, CheckEndOfGameCommand);
		facade.registerCommand(AppNotifications.DESTROYED_LINES_AMOUNT, LinesToPointsCauculatorCommand);
		
		//game
		facade.registerCommand(AppNotifications.START_GAME, StartGameCommand);
		facade.registerCommand(AppNotifications.END_GAME, EndGameCommand);
	}
	
}