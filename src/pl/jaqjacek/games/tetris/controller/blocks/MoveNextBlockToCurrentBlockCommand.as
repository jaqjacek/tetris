package pl.jaqjacek.games.tetris.controller.blocks 
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	import pl.jaqjacek.games.tetris.model.BlockProxy;
	import pl.jaqjacek.games.tetris.notifications.AppNotifications;
	
	/**
	 * ...
	 * @author jaq
	 */
	public class MoveNextBlockToCurrentBlockCommand extends SimpleCommand 
	{
		
		public function MoveNextBlockToCurrentBlockCommand() 
		{
			super();
		}
		
		override public function execute(notification:INotification):void 
		{
			var proxy:BlockProxy = facade.retrieveProxy(BlockProxy.NAME) as BlockProxy;
			proxy.curentBlock = proxy.nextBlock;
			facade.sendNotification(AppNotifications.NEXT_BLOCK_UPDATE);
		}
		
	}

}