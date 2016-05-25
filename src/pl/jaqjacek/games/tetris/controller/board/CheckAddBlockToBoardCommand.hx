package pl.jaqjacek.games.tetris.controller.board;
import org.puremvc.haxe.interfaces.INotification;
import org.puremvc.haxe.patterns.command.SimpleCommand;
import pl.jaqjacek.games.tetris.model.BlockToBoardVO;
import pl.jaqjacek.games.tetris.model.ParamsProxy;
import pl.jaqjacek.games.tetris.notifications.AppNotifications;

/**
 * ...
 * @author jaq
 */
class CheckAddBlockToBoardCommand extends SimpleCommand
{
	
	public function new()
	{
		super();
	}
	
	override public function execute(notification:INotification):Void
	{
		var blockToBoard:BlockToBoardVO=cast notification.getBody();
		var paramsProxy:ParamsProxy=cast facade.retrieveProxy(ParamsProxy.NAME);
		var addColor:Int;
		var addBlock:Bool=false;
		var partY:Int;
		var lastY:Int;
		var partX:Int;

		for(part in blockToBoard.block.blockParts)
		{
			partY=Std.int(blockToBoard.currentY + part.y);
			lastY=Std.int(blockToBoard.lastY + part.y);
			partX=Std.int(blockToBoard.currentX + part.x);

			if(partY>=paramsProxy.gameBoardHeight || lastY >= paramsProxy.gameBoardHeight){
				addBlock=true;
				break;
			}
			
			if(blockToBoard.board.getBlockAt(partX, partY) > 0 || blockToBoard.board.getBlockAt(partX,lastY) > 0){
				addBlock=true;
				break;
			}
		}
		if(addBlock){
			facade.sendNotification(AppNotifications.ADD_BLOCK_TO_BOARD, blockToBoard);
			facade.sendNotification(AppNotifications.NEXT_CURRENT_BLOCK);
			facade.sendNotification(AppNotifications.CHECK_FULL_LINES_ON_BOARD,blockToBoard.board);
		}
		else 
		{
			facade.sendNotification(AppNotifications.MOVE_BLOCK_DOWN);
		}
	}

}