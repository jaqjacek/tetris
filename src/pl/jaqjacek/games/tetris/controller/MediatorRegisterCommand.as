package pl.jaqjacek.games.tetris.controller 
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	import pl.jaqjacek.games.tetris.view.BoardMediator;
	import pl.jaqjacek.games.tetris.view.CurrentBlockMediator;
	import pl.jaqjacek.games.tetris.view.debug.DebugBlockMediator;
	import pl.jaqjacek.games.tetris.view.NextBlockMediator;
	
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
			facade.registerMediator(new DebugBlockMediator("debug_block_mediator_", notification.getBody()));
			facade.registerMediator(new NextBlockMediator(notification.getBody()));
			facade.registerMediator(new CurrentBlockMediator(notification.getBody()));
			facade.registerMediator(new BoardMediator(notification.getBody()));
			facade.registerMediator(new KeyboardControllerMediator(notification.getBody()));
			facade.registerMediator(new TimeControlerMediator(notification.getBody()));
		}
		
	}

}