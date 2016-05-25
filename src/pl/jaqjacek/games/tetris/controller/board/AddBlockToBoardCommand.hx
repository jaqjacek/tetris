package pl.jaqjacek.games.tetris.controller.board ;
#if flash
import flash.geom.Point;
#elseif js
import pixi.core.math.Point;
#end
import org.puremvc.haxe.interfaces.INotification;
import org.puremvc.haxe.patterns.command.SimpleCommand;
import pl.jaqjacek.games.tetris.model.BlockToBoardVO;
import pl.jaqjacek.games.tetris.notifications.AppNotifications;

/**
 * ...
 * @author jaq
 */
class AddBlockToBoardCommand extends SimpleCommand 
{
	
	public function new()
	{
		super();
	}
	
	override public function execute(notification:INotification):Void 
	{
		var blockToBoard:BlockToBoardVO = cast notification.getBody();
		var addColor:Int;
		var tmpX:Int;
		var tmpY:Int;
		//CurrentBlockY should by -- //TODO fix this not nice way
		
		for(part in blockToBoard.block.blockParts)
		{
			addColor=blockToBoard.block.getBlockAt(Std.int(part.x), Std.int(part.y))* blockToBoard.block.blockColor;
			if (addColor != 0){
				
				tmpX=Std.int(blockToBoard.lastX + part.x);
				tmpY=Std.int(blockToBoard.lastY + part.y);

				blockToBoard.board.setBlockAt(tmpX, tmpY, addColor);
				facade.sendNotification(AppNotifications.UPDATE_BOARD_VIEW, new Point(tmpX, tmpY));
			}
		}
	}
	
}