package pl.jaqjacek.games.tetris.controller.board;
import flash.geom.Point;
import org.puremvc.haxe.interfaces.INotification;
import org.puremvc.haxe.patterns.command.SimpleCommand;
import pl.jaqjacek.games.tetris.model.BoardBlockVO;
import pl.jaqjacek.games.tetris.model.BoardSpliceVO;
import pl.jaqjacek.games.tetris.notifications.AppNotifications;

/**
 * ...
 * @author jaq
 */
class SpliceLineFromBoardCommand extends SimpleCommand 
{
	
	public function new()
	{
		super();
	}
	
	override public function execute(notification:INotification):Void 
	{
		var boardSplice:BoardSpliceVO = cast notification.getBody();
		for(j in 0...boardSplice.board.blockWidth)
		{
			var i:Int = boardSplice.rowIndex;
			while(i > 0)
			{
				boardSplice.board.setBlockAt(j, i, boardSplice.board.getBlockAt(j,i - 1));
				facade.sendNotification(AppNotifications.UPDATE_BOARD_VIEW, new Point(j, i));
				i--;
			}
		}
		//if lines wast splice from board row 0 should be 0
		for(jj in 0...boardSplice.board.blockWidth)
		{
			boardSplice.board.setBlockAt(jj, 0, 0);
			facade.sendNotification(AppNotifications.UPDATE_BOARD_VIEW, new Point(jj, 0));
		}
		boardSplice.clean();
	}
	
}