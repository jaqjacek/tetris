package pl.jaqjacek.games.tetris.view ;
import org.puremvc.haxe.interfaces.INotification;
import org.puremvc.haxe.patterns.mediator.Mediator;
import pl.jaqjacek.games.tetris.model.BlockProxy;
import pl.jaqjacek.games.tetris.model.BlockVO;
import pl.jaqjacek.games.tetris.notifications.AppNotifications;

/**
 * ...
 * @author jaq
 */
class BlockMediator extends Mediator 
{
	public static inline var NAME:String = "BlockMediator_";
	
	private var _blockView:BlockView;
	public var _block:BlockVO;
	public var blockSize:Float;
	
	
	public function new(mediatorName:String=null, viewComponent:Dynamic=null)
	{
		mediatorName=mediatorName==null ? NAME:mediatorName;
		super(mediatorName, viewComponent);
	}
	
	override public function onRegister():Void 
	{
		_blockView=new BlockView();
	}
	
	public function setBlock(block:BlockVO):Void 
	{
		var blockProxy:BlockProxy=cast facade.retrieveProxy(BlockProxy.NAME);
		_block=block;
		_blockView.clean();
		
		for(i in 0..._block.blockWidth)
		{
			for(j in 0..._block.blockHeight)
			{
				if(_block.getBlockAt(i, j) != 0){
					addBlockToView(i, j, blockProxy.getBlockMedia(_block.blockColor));
				}
			}
		}
	}
	
	public function addBlockToView(x:Int,y:Int,block:IGameBlock):Void 
	{
		block.width=block.height=blockSize;
		_blockView.createBlockAt(x,y,block,blockSize);
	}
	
	override public function onRemove():Void 
	{
		_block=null;
		_blockView.clean();
		_block=null;
	}
	
	override public function listNotificationInterests():Array<String> 
	{
		return [
			mediatorName+AppNotifications.SHOW_BLOCK,
			mediatorName+AppNotifications.UPDATE_BLOCK,
			mediatorName+AppNotifications.REMOVE_BLOCK,
		];
	}
	
	override public function handleNotification(notification:INotification):Void 
	{
		var nName:String=cast notification.getName();
		var nBody:Dynamic = notification.getBody();
		var showBlockString:String = mediatorName+AppNotifications.SHOW_BLOCK;
		var updateBlockString:String = mediatorName+AppNotifications.UPDATE_BLOCK;
		if (nName == showBlockString) {
			showBlock();
		}
		if (nName == updateBlockString) {
			setBlock(cast nBody);
		}
	}
	
	public function showBlock():Void 
	{
		viewComponent.addChild(_blockView);
	}
	
}