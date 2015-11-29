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
			//CurrentBlockY should by -- //TODO fix this not nice way
			blockToBoard.blockY--;
			
			for (var i:int = 0; i < blockToBoard.block.blockWidth; i++) 
			{
				for (var j:int = 0; j < blockToBoard.block.blockHeight; j++) 
				{
					addColor =  blockToBoard.block.getBlockAt(i, j) * blockToBoard.block.blockColor;
					if (addColor) {
						tmpX = blockToBoard.blockX + i;
						tmpY = blockToBoard.blockY + j;

						blockToBoard.board.setBlockAt(tmpX, tmpY, addColor);
						facade.sendNotification(AppNotifications.UPDATE_BOARD_VIEW, new Point(tmpX, tmpY));
					}
				}
			}
		}
		
	}

}