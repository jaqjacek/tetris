package pl.jaqjacek.games.tetris.controller.moving 
{
	import flash.geom.Point;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
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
	public class CheckIfBlockCanBeRotatedCommand extends SimpleCommand 
	{
		
		public function CheckIfBlockCanBeRotatedCommand() 
		{
			super();
		}
		
		override public function execute(notification:INotification):void 
		{
			var boardBlock:BoardBlockVO = (facade.retrieveMediator(BoardMediator.NAME) as BoardMediator).boardBlock;
			var blockProxy:BlockProxy = facade.retrieveProxy(BlockProxy.NAME) as BlockProxy;
			var paramsProxy:ParamsProxy = facade.retrieveProxy(ParamsProxy.NAME) as ParamsProxy;
			var proxy:ParamsProxy = facade.retrieveProxy(ParamsProxy.NAME) as ParamsProxy;
			
			var clonedBlock:BlockVO = blockProxy.curentBlock.cloneBlock();
			clonedBlock.goToNextFormation();
			var canRotate:Boolean = true;
			//check moving outside board
			if (proxy.currentBlockBlockPositionX < 0 || proxy.currentBlockBlockPositionX + clonedBlock.blockWidth > proxy.gameBoardWidth) {
				canRotate = false;
			}
			else
			{
				for each (var part:Point in clonedBlock.blockParts) 
				{
					if (boardBlock.getBlockAt(proxy.currentBlockBlockPositionX + part.x,proxy.currentBlockBlockPositionY+part.y)) {
						canRotate = false;
						break;
					}
				}
			}
			
			if (canRotate) 
			{
				facade.sendNotification(CurrentBlockMediator.NAME+AppNotifications.ROTATE_BLOCK);
			}
		}
		
	}

}