package pl.jaqjacek.games.tetris.controller.moving 
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	import pl.jaqjacek.games.tetris.model.BlockProxy;
	import pl.jaqjacek.games.tetris.model.ParamsProxy;
	import pl.jaqjacek.games.tetris.notifications.AppNotifications;
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
			
			var side:int = notification.getBody() as int;
			//check moving outside board
			var notifiCationToSend:String = AppNotifications.CANT_MOVE_BLOCK;
			switch (side) 
			{
				case -1:
					if (proxy.currentBlockBlockPositionX  > 0) {
						proxy.currentBlockBlockPositionX--;
						notifiCationToSend = CurrentBlockMediator.NAME + AppNotifications.MOVE_BLOCK
					}
				break;
				case 1:
					if (proxy.currentBlockBlockPositionX  < proxy.gameBoardWidth - blockProxy.curentBlock.blockWidth) {
						proxy.currentBlockBlockPositionX++;
						notifiCationToSend = CurrentBlockMediator.NAME + AppNotifications.MOVE_BLOCK
					}
				break;
				default:
			}
			facade.sendNotification(notifiCationToSend);
		}
		
	}

}