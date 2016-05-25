package pl.jaqjacek.games.tetris.controller.board;
#if flash
import flash.geom.Point;
#elseif js
import pixi.core.math.Point;
#end
import org.puremvc.haxe.interfaces.INotification;
import org.puremvc.haxe.patterns.command.SimpleCommand;
import pl.jaqjacek.games.tetris.model.BoardBlockVO;
import pl.jaqjacek.games.tetris.model.BoardSpliceVO;
import pl.jaqjacek.games.tetris.notifications.AppNotifications;

/**
 * ...
 * @author jaq
 */
class CheckFullLinesOnBoardCommand extends SimpleCommand 
{
	
	public function new()
	{
		super();
	}
	
	override public function execute(notification:INotification):Void 
	{
		var board:BoardBlockVO = cast notification.getBody();
		var destroyedLinesAmmount:Int = 0;
		var i:Int = board.blockHeight -1;
		while(i >= 0)
		{
			if(board.isRowFull(i))
			{
				for(j in 0...board.blockWidth)
				{
					board.setBlockAt(j, i, 0);
					facade.sendNotification(AppNotifications.UPDATE_BOARD_VIEW, new Point(j, i));
				}
				facade.sendNotification(AppNotifications.BOARD_SPLICE_LINE, new BoardSpliceVO(board,i));
				i++;
				destroyedLinesAmmount++;
			}
			i--;
		}
		facade.sendNotification(AppNotifications.DESTROYED_LINES_AMOUNT, destroyedLinesAmmount);
	}
	
}