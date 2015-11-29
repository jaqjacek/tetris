package pl.jaqjacek.games.tetris.controller.moving 
{
	import flash.geom.Point;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
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
	public class CheckEndOfGameCommand extends SimpleCommand 
	{
		
		public function CheckEndOfGameCommand() 
		{
			super();
		}
		
		override public function execute(notification:INotification):void 
		{
			var boardBlock:BoardBlockVO = (facade.retrieveMediator(BoardMediator.NAME) as BoardMediator).boardBlock;
			var blockProxy:BlockProxy = facade.retrieveProxy(BlockProxy.NAME) as BlockProxy;
			var paramsProxy:ParamsProxy = facade.retrieveProxy(ParamsProxy.NAME) as ParamsProxy;
			var tmpX:int;
			var tmpY:int;
			for each (var part:Point in blockProxy.curentBlock.blockParts) 
			{
				tmpX = part.x + paramsProxy.currentBlockBlockPositionX;
				tmpY = part.y + paramsProxy.currentBlockBlockPositionY;
				if (boardBlock.getBlockAt(tmpX, tmpY)) {
					facade.sendNotification(AppNotifications.END_GAME);
					break;
				}
			}
		}
		
	}

}