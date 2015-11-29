package pl.jaqjacek.games.tetris.controller.points 
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	import pl.jaqjacek.games.tetris.model.ParamsProxy;
	import pl.jaqjacek.games.tetris.notifications.AppNotifications;
	
	/**
	 * ...
	 * @author jaq
	 */
	public class LinesToPointsCauculatorCommand extends SimpleCommand 
	{
		
		public function LinesToPointsCauculatorCommand() 
		{
			super();
		}
		
		override public function execute(notification:INotification):void 
		{
			var destroyedLines:int = notification.getBody() as int;
			var resultPoints:int = 0;
			var paramsProxy:ParamsProxy = facade.retrieveProxy(ParamsProxy.NAME) as ParamsProxy;
			for (var i:int = 0; i < destroyedLines; i++) 
			{
				resultPoints += paramsProxy.gameBoardWidth * (i +1);
			}
			
			facade.sendNotification(AppNotifications.ADD_POINTS, resultPoints);
			
		}
		
	}

}