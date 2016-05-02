package pl.jaqjacek.games.tetris.controller;
import org.puremvc.haxe.interfaces.INotification;
import org.puremvc.haxe.patterns.command.MacroCommand;

/**
 * ...
 * @author jaq
 */
class StartupCommand extends MacroCommand
{
	
	public function new()
	{
		super();
	}
	
	override private function initializeMacroCommand():Void 
	{
		this.addSubCommand(ProxyRegisterCommand);
		this.addSubCommand(MediatorRegisterCommand);
		this.addSubCommand(CommandRegisterCommand);
		//super.initializeMacroCommand();
	}
}