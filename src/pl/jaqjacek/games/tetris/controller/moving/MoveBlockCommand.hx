package pl.jaqjacek.games.tetris.controller.moving ;
import flash.geom.Point;
import org.puremvc.haxe.interfaces.INotification;
import org.puremvc.haxe.patterns.command.SimpleCommand;
import pl.jaqjacek.games.tetris.model.BlockProxy;
import pl.jaqjacek.games.tetris.model.BoardBlockVO;
import pl.jaqjacek.games.tetris.model.ParamsProxy;
import pl.jaqjacek.games.tetris.notifications.AppNotifications;
import pl.jaqjacek.games.tetris.view.BoardMediator;
import pl.jaqjacek.games.tetris.view.CurrentBlockMediator;

/**
 * ...
 * @author jaq
 */
class MoveBlockCommand extends SimpleCommand 
{
	
	public function new()
	{
		super();
	}
	
	override public function execute(notification:INotification):Void 
	{
		var blockProxy:BlockProxy=cast facade.retrieveProxy(BlockProxy.NAME);
		var proxy:ParamsProxy=cast facade.retrieveProxy(ParamsProxy.NAME);
		var boardBlock:BoardBlockVO=cast(facade.retrieveMediator(BoardMediator.NAME),BoardMediator).boardBlock;
		
		var side:Int=cast notification.getBody();
		var notifiCationToSend:String=CurrentBlockMediator.NAME + AppNotifications.MOVE_BLOCK;
		
		//cauculated if can move outside left side of border
		var leftEmptyColumns:Int=blockProxy.curentBlock.getLeftEmptyColumnsAmount();
		
		//check moving outside board
		if(proxy.currentBlockBlockPositionX + side<-leftEmptyColumns || proxy.currentBlockBlockPositionX + side+blockProxy.curentBlock.blockWidth>proxy.gameBoardWidth){
			notifiCationToSend=AppNotifications.CANT_MOVE_BLOCK;
		}
		else
		{
			for(part in blockProxy.curentBlock.blockParts)
			{
				if(boardBlock.getBlockAt(Std.int(proxy.currentBlockBlockPositionX + side+part.x),Std.int(proxy.currentBlockBlockPositionY+part.y)) != 0){
					notifiCationToSend=AppNotifications.CANT_MOVE_BLOCK;
					break;
				}
			}
			if(notifiCationToSend !=AppNotifications.CANT_MOVE_BLOCK){
				proxy.currentBlockBlockPositionX +=side;
			}
		}
		
		
		facade.sendNotification(notifiCationToSend,side);
	}
	
}