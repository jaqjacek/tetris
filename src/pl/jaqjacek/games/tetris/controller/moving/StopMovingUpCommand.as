package pl.jaqjacek.games.tetris.controller.moving 
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	import pl.jaqjacek.games.tetris.model.ParamsProxy;
	
	/**
	 * ...
	 * @author jaq
	 */
	public class StopMovingUpCommand extends SimpleCommand 
	{
		
		public function StopMovingUpCommand() 
		{
			super();
		}
		
		override public function execute(notification:INotification):void 
		{
			var proxy:ParamsProxy = facade.retrieveProxy(ParamsProxy.NAME) as ParamsProxy;
			proxy.nextTickInc = 4;
		}
		
	}

}