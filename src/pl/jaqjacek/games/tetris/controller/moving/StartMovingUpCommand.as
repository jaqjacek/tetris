package pl.jaqjacek.games.tetris.controller.moving 
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	import pl.jaqjacek.games.tetris.model.ParamsProxy;
	
	/**
	 * ...
	 * @author jaq
	 */
	public class StartMovingUpCommand extends SimpleCommand 
	{
		
		public function StartMovingUpCommand() 
		{
			super();
		}
		
		override public function execute(notification:INotification):void 
		{
			var proxy:ParamsProxy = facade.retrieveProxy(ParamsProxy.NAME) as ParamsProxy;
			proxy.nextTickInc = 1;
		}
		
	}

}