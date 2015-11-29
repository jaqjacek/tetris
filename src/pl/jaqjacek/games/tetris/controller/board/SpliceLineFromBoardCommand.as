package pl.jaqjacek.games.tetris.controller.board 
{
	import flash.geom.Point;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	import pl.jaqjacek.games.tetris.model.BoardBlockVO;
	import pl.jaqjacek.games.tetris.model.BoardSpliceVO;
	import pl.jaqjacek.games.tetris.notifications.AppNotifications;
	
	/**
	 * ...
	 * @author jaq
	 */
	public class SpliceLineFromBoardCommand extends SimpleCommand 
	{
		
		public function SpliceLineFromBoardCommand() 
		{
			super();
		}
		
		override public function execute(notification:INotification):void 
		{
			var boardSplice:BoardSpliceVO = notification.getBody() as BoardSpliceVO;
			for (var j:int = 0; j < boardSplice.board.blockWidth; j++) 
			{
				for (var i:int = boardSplice.rowIndex; i >=1 ; i--) 
				{
					boardSplice.board.setBlockAt(j, i, boardSplice.board.getBlockAt(j,i - 1));
					facade.sendNotification(AppNotifications.UPDATE_BOARD_VIEW, new Point(j, i));
				}
			}
			//if lines wast splice from board row 0 should be 0
			for (var jj:int = 0; jj < boardSplice.board.blockWidth; jj++) 
			{
				boardSplice.board.setBlockAt(jj, 0, 0);
				facade.sendNotification(AppNotifications.UPDATE_BOARD_VIEW, new Point(jj, 0));
			}
			boardSplice.clean();
		}
		
	}

}