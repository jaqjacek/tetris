package pl.jaqjacek.games.tetris.controller.blocks 
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	import pl.jaqjacek.games.tetris.model.BlockProxy;
	import pl.jaqjacek.games.tetris.notifications.AppNotifications;
	import pl.jaqjacek.games.tetris.view.NextBlockMediator;
	
	/**
	 * ...
	 * @author jaq
	 */
	public class UpdateNextBlockCommand extends SimpleCommand 
	{
		
		public function UpdateNextBlockCommand() 
		{
			super();
		}
		
		override public function execute(notification:INotification):void 
		{
			var proxy:BlockProxy = facade.retrieveProxy(BlockProxy.NAME) as BlockProxy;
			proxy.nextBlock = proxy.getRandomBlock();
			proxy.nextBlock.reset();
			facade.sendNotification(NextBlockMediator.NAME+AppNotifications.SHOW_BLOCK);
			facade.sendNotification(NextBlockMediator.NAME+AppNotifications.UPDATE_BLOCK,proxy.nextBlock);
		}
		
	}

}