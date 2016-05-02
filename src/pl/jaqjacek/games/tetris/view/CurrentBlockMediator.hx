package pl.jaqjacek.games.tetris.view ;
import org.puremvc.haxe.interfaces.INotification;
import pl.jaqjacek.games.tetris.model.BlockToBoardVO;
import pl.jaqjacek.games.tetris.model.BlockVO;
import pl.jaqjacek.games.tetris.model.BoardBlockVO;
import pl.jaqjacek.games.tetris.model.ParamsProxy;
import pl.jaqjacek.games.tetris.notifications.AppNotifications;
/**
 * ...
 * @author jaq
 */
class CurrentBlockMediator extends BlockMediator 
{
	public static inline var NAME:String = "CurrentBlockMediator_";
	private var _nextTickMoveDown:Int;
	private var _nextTickInc:Int;
	private var _currentSpeed:Float;
	private var paramsProxy:ParamsProxy;
	private var nextViewY:Float;
	
	public function new(viewComponent:Dynamic=null)
	{
		super(NAME, viewComponent);
	}
	
	override public function onRegister():Void 
	{
		paramsProxy=cast facade.retrieveProxy(ParamsProxy.NAME);
		super.onRegister();
		blockSize=paramsProxy.gameBlockSize;
	}
	
	override public function listNotificationInterests():Array<String> 
	{
		var listNotifications:Array<String> = super.listNotificationInterests();
			listNotifications.push(mediatorName+AppNotifications.ROTATE_BLOCK);
			listNotifications.push(mediatorName+AppNotifications.MOVE_BLOCK);
			listNotifications.push(AppNotifications.MOVE_BLOCK_DOWN);
			listNotifications.push(mediatorName+AppNotifications.CHECK_MOVE_BLOCK_DOWN);
			listNotifications.push(AppNotifications.ADD_BLOCK_TO_BOARD);
		return listNotifications;
	}
	
	override public function handleNotification(notification:INotification):Void 
	{
		super.handleNotification(notification);
		var nName:String=notification.getName();
		var nBody:Dynamic=notification.getBody();
		var directionX:Int;
		var directionY:Float;
		var currentTick:Int;
		var lastY:Int;
		var options:Array<String> = [
			mediatorName+AppNotifications.MOVE_BLOCK,
			AppNotifications.MOVE_BLOCK_DOWN,
			mediatorName+AppNotifications.ROTATE_BLOCK,
			mediatorName+AppNotifications.CHECK_MOVE_BLOCK_DOWN,
			AppNotifications.ADD_BLOCK_TO_BOARD
		];
		switch (options.indexOf(nName)) 
		{
			case 0:
				directionX = cast nBody;
				this._blockView.x = paramsProxy.getCurrentBlockViewX();
			case 1:
				moveBlock();
			case 2:
				rotateBlock();
			case 3:
				directionY = cast nBody;
				lastY=paramsProxy.currentBlockBlockPositionY;
				nextViewY=this._blockView.y + directionY;
				paramsProxy.currentBlockBlockPositionY = Math.ceil(nextViewY / paramsProxy.gameBlockSize);
				checkBlockToBoard(paramsProxy.currentBlockBlockPositionX, lastY);
			case 4:
				nextViewY=0;
			default:
				
		}
		//var moveBlockString:String = mediatorName+AppNotifications.MOVE_BLOCK;
		//var moveBlockDown:String = AppNotifications.MOVE_BLOCK_DOWN;
		//var blockRotate:String =  mediatorName+AppNotifications.ROTATE_BLOCK;
		//var checkMoveBlockDown:String =  mediatorName+AppNotifications.CHECK_MOVE_BLOCK_DOWN;
		//switch(nName)
		//{
			//case AppNotifications.ADD_BLOCK_TO_BOARD:
				//nextViewY=0;
		//}
		//
		//if (nName == blockRotate)
		//{
			//rotateBlock();
		//}
		//
		//if (nName == checkMoveBlockDown)
		//{
			//directionY = cast nBody;
			//lastY=paramsProxy.currentBlockBlockPositionY;
			//nextViewY=this._blockView.y + directionY;
			//paramsProxy.currentBlockBlockPositionY = Math.ceil(nextViewY / paramsProxy.gameBlockSize);
			//checkBlockToBoard(paramsProxy.currentBlockBlockPositionX,lastY);
		//}
		//
		//if (nName == moveBlockDown)
		//{
			//moveBlock();
		//}
		//if (nName == moveBlockString)
		//{
			//directionX = cast nBody;
			//this._blockView.x=paramsProxy.getCurrentBlockViewX();
		//}
		
	}
	
	public function moveBlock():Void 
	{
		this._blockView.y = nextViewY;
		nextViewY = 0;
	}
	
	
	override public function setBlock(block:BlockVO):Void 
	{
		super.setBlock(block);
		_blockView.x=paramsProxy.getCurrentBlockViewX();
		_blockView.y=paramsProxy.getCurrentBlockViewY();
	}
	
	public function rotateBlock():Void 
	{
		_block.goToNextFormation();
		super.setBlock(_block);
	}
	
	public function checkBlockToBoard(lastX:Int,lastY:Int):Void 
	{
		var boardBlock:BoardBlockVO=cast(facade.retrieveMediator(BoardMediator.NAME),BoardMediator).boardBlock;
		var blockToBoard:BlockToBoardVO = new BlockToBoardVO(boardBlock, _block, paramsProxy.currentBlockBlockPositionX, paramsProxy.currentBlockBlockPositionY, lastX, lastY);
		facade.sendNotification(AppNotifications.CHECK_ADD_BLOCK_TO_BOARD, blockToBoard);
	}
	
}