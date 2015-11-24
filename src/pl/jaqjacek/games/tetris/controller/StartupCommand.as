package pl.jaqjacek.games.tetris.controller 
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.MacroCommand;
	
	/**
	 * ...
	 * @author jaq
	 */
	public class StartupCommand extends MacroCommand
	{
		
		public function StartupCommand() 
		{
			super();
		}
		
		override protected function initializeMacroCommand():void 
		{
			this.addSubCommand(MediatorRegisterCommand);
			this.addSubCommand(ProxyRegisterCommand);
			this.addSubCommand(CommandRegisterCommand);
			//super.initializeMacroCommand();
		}
	}

}