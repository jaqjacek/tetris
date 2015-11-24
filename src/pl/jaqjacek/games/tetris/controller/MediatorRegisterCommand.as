package pl.jaqjacek.games.tetris.controller 
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	import pl.jaqjacek.games.tetris.view.debug.DebugBlockMediator;
	
	/**
	 * ...
	 * @author jaq
	 */
	public class MediatorRegisterCommand extends SimpleCommand 
	{
		
		public function MediatorRegisterCommand() 
		{
			super();
		}
		
		override public function execute(notification:INotification):void 
		{
			facade.registerMediator(new DebugBlockMediator("debug_block_mediator", notification.getBody()));
		}
		
	}

}