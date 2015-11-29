package pl.jaqjacek.games.tetris.controller.moving 
{
	import flash.geom.Point;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
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
	public class MoveBlockCommand extends SimpleCommand 
	{
		
		public function MoveBlockCommand() 
		{
			super();
		}
		
		override public function execute(notification:INotification):void 
		{
			var blockProxy:BlockProxy = facade.retrieveProxy(BlockProxy.NAME) as BlockProxy;
			var proxy:ParamsProxy = facade.retrieveProxy(ParamsProxy.NAME) as ParamsProxy;
			var boardBlock:BoardBlockVO = (facade.retrieveMediator(BoardMediator.NAME) as BoardMediator).boardBlock;
			
			var side:int = notification.getBody() as int;
			var notifiCationToSend:String = CurrentBlockMediator.NAME + AppNotifications.MOVE_BLOCK;
			
			//cauculated if can move outside left side of border
			var leftEmptyColumns:int = blockProxy.curentBlock.getLeftEmptyColumnsAmount();
			
			//check moving outside board
			if (proxy.currentBlockBlockPositionX + side < -leftEmptyColumns || proxy.currentBlockBlockPositionX + side+blockProxy.curentBlock.blockWidth > proxy.gameBoardWidth) {
				notifiCationToSend = AppNotifications.CANT_MOVE_BLOCK;
			}
			else
			{
				for each (var part:Point in blockProxy.curentBlock.blockParts) 
				{
					if (boardBlock.getBlockAt(proxy.currentBlockBlockPositionX + side+part.x,proxy.currentBlockBlockPositionY+part.y)) {
						notifiCationToSend = AppNotifications.CANT_MOVE_BLOCK;
						break;
					}
				}
				if (notifiCationToSend != AppNotifications.CANT_MOVE_BLOCK) {
					proxy.currentBlockBlockPositionX += side;
				}
			}
			
			
			facade.sendNotification(notifiCationToSend,side);
		}
		
	}

}