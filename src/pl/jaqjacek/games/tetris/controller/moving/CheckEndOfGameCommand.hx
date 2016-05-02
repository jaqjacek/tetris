package pl.jaqjacek.games.tetris.controller.moving;
import flash.geom.Point;
import org.puremvc.haxe.interfaces.INotification;
import org.puremvc.haxe.patterns.command.SimpleCommand;
import pl.jaqjacek.games.tetris.model.BlockProxy;
import pl.jaqjacek.games.tetris.model.BlockToBoardVO;
import pl.jaqjacek.games.tetris.model.BoardBlockVO;
import pl.jaqjacek.games.tetris.model.ParamsProxy;
import pl.jaqjacek.games.tetris.notifications.AppNotifications;
import pl.jaqjacek.games.tetris.view.BoardMediator;

/**
 * ...
 * @author jaq
 */
class CheckEndOfGameCommand extends SimpleCommand 
{
	
	public function new()
	{
		super();
	}
	
	override public function execute(notification:INotification):Void 
	{
		var boardBlock:BoardBlockVO=cast(facade.retrieveMediator(BoardMediator.NAME),BoardMediator).boardBlock;
		var blockProxy:BlockProxy = cast facade.retrieveProxy(BlockProxy.NAME);
		var paramsProxy:ParamsProxy = cast facade.retrieveProxy(ParamsProxy.NAME);
		var tmpX:Int;
		var tmpY:Int;
		for(part in blockProxy.curentBlock.blockParts)
		{
			tmpX=Std.int(part.x + paramsProxy.currentBlockBlockPositionX);
			tmpY=Std.int(part.y + paramsProxy.currentBlockBlockPositionY);
			if(boardBlock.getBlockAt(tmpX, tmpY) != 0){
				facade.sendNotification(AppNotifications.END_GAME);
				break;
			}
		}
	}
	
}