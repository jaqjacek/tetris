package pl.jaqjacek.games.tetris.controller.moving 
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	import pl.jaqjacek.games.tetris.notifications.AppNotifications;
	import pl.jaqjacek.games.tetris.model.ParamsProxy;
	import pl.jaqjacek.games.tetris.view.CurrentBlockMediator;
	
	/**
	 * ...
	 * @author jaq
	 */
	public class MoveAfterTickCommand extends SimpleCommand 
	{
		
		public function MoveAfterTickCommand() 
		{
			super();
		}
		
		override public function execute(notification:INotification):void 
		{
			
			var tick:int = notification.getBody() as int;
			var proxy:ParamsProxy = facade.retrieveProxy(ParamsProxy.NAME) as ParamsProxy;
			if (tick >= proxy.nextTickMoveDown) {
				proxy.nextTickMoveDown = tick + proxy.nextTickInc;
				facade.sendNotification(CurrentBlockMediator.NAME+AppNotifications.MOVE_BLOCK_DOWN, proxy.getMoveDownDistance() );
			}
		}
		
	}

}