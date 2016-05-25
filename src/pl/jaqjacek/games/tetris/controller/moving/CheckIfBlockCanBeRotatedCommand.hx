package pl.jaqjacek.games.tetris.controller.moving ;
#if flash
import flash.geom.Point;
#elseif js
import pixi.core.math.Point;
#end
import org.puremvc.haxe.interfaces.INotification;
import org.puremvc.haxe.patterns.command.SimpleCommand;
import pl.jaqjacek.games.tetris.model.BlockProxy;
import pl.jaqjacek.games.tetris.model.BlockVO;
import pl.jaqjacek.games.tetris.model.BoardBlockVO;
import pl.jaqjacek.games.tetris.model.ParamsProxy;
import pl.jaqjacek.games.tetris.notifications.AppNotifications;
import pl.jaqjacek.games.tetris.view.BoardMediator;
import pl.jaqjacek.games.tetris.view.CurrentBlockMediator;

/**
 * ...
 * @author jaq
 */
class CheckIfBlockCanBeRotatedCommand extends SimpleCommand 
{
	
	public function new()
	{
		super();
	}
	
	override public function execute(notification:INotification):Void 
	{
		var boardBlock:BoardBlockVO=cast(facade.retrieveMediator(BoardMediator.NAME),BoardMediator).boardBlock;
		var blockProxy:BlockProxy=cast facade.retrieveProxy(BlockProxy.NAME);
		var paramsProxy:ParamsProxy=cast facade.retrieveProxy(ParamsProxy.NAME);
		var proxy:ParamsProxy=cast facade.retrieveProxy(ParamsProxy.NAME);
		
		var clonedBlock:BlockVO=blockProxy.curentBlock.cloneBlock();
		clonedBlock.goToNextFormation();
		var canRotate:Bool=true;
		
		//check moving outside board
		if(proxy.currentBlockBlockPositionX<0 || proxy.currentBlockBlockPositionX + clonedBlock.blockWidth>proxy.gameBoardWidth){
			canRotate=false;
		}
		else
		{
			for(part in clonedBlock.blockParts)
			{
				if (boardBlock.getBlockAt(Std.int(proxy.currentBlockBlockPositionX + part.x), Std.int(proxy.currentBlockBlockPositionY + part.y)) != 0)
				{
					canRotate=false;
					break;
				}
			}
		}
		
		if(canRotate)
		{
			facade.sendNotification(CurrentBlockMediator.NAME+AppNotifications.ROTATE_BLOCK);
		}
		clonedBlock.clean();
	}
	
}