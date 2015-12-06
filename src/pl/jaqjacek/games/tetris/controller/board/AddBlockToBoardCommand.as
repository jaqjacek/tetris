package pl.jaqjacek.games.tetris.controller.board 
{
	import flash.geom.Point;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	import pl.jaqjacek.games.tetris.model.BlockToBoardVO;
	import pl.jaqjacek.games.tetris.notifications.AppNotifications;
	
	/**
	 * ...
	 * @author jaq
	 */
	public class AddBlockToBoardCommand extends SimpleCommand 
	{
		
		public function AddBlockToBoardCommand() 
		{
			super();
		}
		
		override public function execute(notification:INotification):void 
		{
			var blockToBoard:BlockToBoardVO = notification.getBody() as BlockToBoardVO
			var addColor:int;
			var tmpX:int;
			var tmpY:int;
			
			for each (var part:Point in blockToBoard.block.blockParts) 
			{
				addColor =  blockToBoard.block.getBlockAt(part.x, part.y) * blockToBoard.block.blockColor;
				if (addColor) {
					tmpX = blockToBoard.lastX + part.x;
					tmpY = blockToBoard.lastY + part.y;
					blockToBoard.board.setBlockAt(tmpX, tmpY, addColor);
					facade.sendNotification(AppNotifications.UPDATE_BOARD_VIEW, new Point(tmpX, tmpY));
				}
			}
		}
		
	}

}