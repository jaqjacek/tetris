package pl.jaqjacek.games.tetris.controller.blocks 
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	import pl.jaqjacek.games.tetris.model.BlockProxy;
	import pl.jaqjacek.games.tetris.model.ParamsProxy;
	import pl.jaqjacek.games.tetris.notifications.AppNotifications;
	import pl.jaqjacek.games.tetris.view.CurrentBlockMediator;
	
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
			var paramsProxy:ParamsProxy = facade.retrieveProxy(ParamsProxy.NAME) as ParamsProxy;
			proxy.curentBlock = proxy.nextBlock;
			paramsProxy.resetCurrentBlockPosition();
			facade.sendNotification(AppNotifications.NEXT_BLOCK_UPDATE);
			facade.sendNotification(CurrentBlockMediator.NAME+AppNotifications.SHOW_BLOCK);
			facade.sendNotification(CurrentBlockMediator.NAME+AppNotifications.UPDATE_BLOCK,proxy.curentBlock);
		}
		
	}

}