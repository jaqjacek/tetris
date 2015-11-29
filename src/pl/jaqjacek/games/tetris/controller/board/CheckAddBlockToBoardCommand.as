package pl.jaqjacek.games.tetris.controller.board
{
	import flash.geom.Point;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	import pl.jaqjacek.games.tetris.model.BlockToBoardVO;
	import pl.jaqjacek.games.tetris.model.ParamsProxy;
	import pl.jaqjacek.games.tetris.notifications.AppNotifications;
	
	/**
	 * ...
	 * @author jaq
	 */
	public class CheckAddBlockToBoardCommand extends SimpleCommand
	{
		
		public function CheckAddBlockToBoardCommand()
		{
			super();
		}
		
		override public function execute(notification:INotification):void
		{
			var blockToBoard:BlockToBoardVO = notification.getBody() as BlockToBoardVO;
			var paramsProxy:ParamsProxy = facade.retrieveProxy(ParamsProxy.NAME) as ParamsProxy;
			var addColor:int;
			var addBlock:Boolean = false;
			var partY:int
			for each (var part:Point in blockToBoard.block.blockParts) 
			{
				partY = blockToBoard.blockY + part.y;
				if (partY >= paramsProxy.gameBoardHeight) {
					addBlock = true;
					break;
				}
				
				if (blockToBoard.board.getBlockAt(blockToBoard.blockX + part.x, partY)) {
					addBlock = true;
					break
				}
			}
			if (addBlock) {
				facade.sendNotification(AppNotifications.ADD_BLOCK_TO_BOARD, blockToBoard);
				facade.sendNotification(AppNotifications.NEXT_CURRENT_BLOCK);
			}
		}
	
	}

}