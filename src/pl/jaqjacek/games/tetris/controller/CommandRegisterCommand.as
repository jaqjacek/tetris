package pl.jaqjacek.games.tetris.controller 
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * ...
	 * @author jaq
	 */
	public class CommandRegisterCommand extends SimpleCommand 
	{
		
		public function CommandRegisterCommand() 
		{
			super();
		}
		
		override public function execute(notification:INotification):void 
		{
			super.execute(notification);
		}
		
	}

}