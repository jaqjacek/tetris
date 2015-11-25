package pl.jaqjacek.games.tetris.controller 
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	import pl.jaqjacek.games.tetris.model.BlockProxy;
	
	/**
	 * ...
	 * @author jaq
	 */
	public class ProxyRegisterCommand extends SimpleCommand 
	{
		
		public function ProxyRegisterCommand() 
		{
			super();
		}
		
		override public function execute(notification:INotification):void 
		{
			facade.registerProxy(new BlockProxy());
		}
		
	}

}