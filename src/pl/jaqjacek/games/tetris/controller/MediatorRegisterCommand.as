package pl.jaqjacek.games.tetris.controller 
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	import pl.jaqjacek.games.tetris.view.BoardMediator;
	import pl.jaqjacek.games.tetris.view.CurrentBlockMediator;
	import pl.jaqjacek.games.tetris.view.NextBlockMediator;
	import pl.jaqjacek.games.tetris.view.PointsMediator;
	
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
			facade.registerMediator(new NextBlockMediator(notification.getBody()));
			facade.registerMediator(new CurrentBlockMediator(notification.getBody()));
			facade.registerMediator(new BoardMediator(notification.getBody()));
			facade.registerMediator(new KeyboardControllerMediator(notification.getBody()));
			facade.registerMediator(new TimeControlerMediator(notification.getBody()));
			facade.registerMediator(new PointsMediator(notification.getBody()));
		}
		
	}

}