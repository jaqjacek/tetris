package pl.jaqjacek.games.tetris.controller.board 
{
	import flash.geom.Point;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	import pl.jaqjacek.games.tetris.model.BlockVO;
	import pl.jaqjacek.games.tetris.model.BoardBlockVO;
	import pl.jaqjacek.games.tetris.model.BoardSpliceVO;
	import pl.jaqjacek.games.tetris.notifications.AppNotifications;
	
	/**
	 * ...
	 * @author jaq
	 */
	public class CheckFullLinesOnBoardCommand extends SimpleCommand 
	{
		
		public function CheckFullLinesOnBoardCommand() 
		{
			super();
		}
		
		override public function execute(notification:INotification):void 
		{
			var board:BoardBlockVO = notification.getBody() as BoardBlockVO;
			var destroyedLinesAmmount:int = 0;
			for (var i:int = board.blockHeight-1; i >=0 ; i--) 
			{
				if (board.isRowFull(i) )
				{
					for (var j:int = 0; j < board.blockWidth; j++) 
					{
						board.setBlockAt(j, i, 0);
						facade.sendNotification(AppNotifications.UPDATE_BOARD_VIEW, new Point(j, i));
					}
					facade.sendNotification(AppNotifications.BOARD_SPLICE_LINE, new BoardSpliceVO(board,i));
					i++;
					destroyedLinesAmmount++;
				}
			}
			facade.sendNotification(AppNotifications.DESTROYED_LINES_AMOUNT, destroyedLinesAmmount);
		}
		
	}

}