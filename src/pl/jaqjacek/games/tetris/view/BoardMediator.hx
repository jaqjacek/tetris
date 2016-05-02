package pl.jaqjacek.games.tetris.view;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.geom.Point;
import org.puremvc.haxe.interfaces.INotification;
import org.puremvc.haxe.patterns.mediator.Mediator;
import pl.jaqjacek.games.tetris.model.BlockProxy;
import pl.jaqjacek.games.tetris.model.BlockVO;
import pl.jaqjacek.games.tetris.model.BoardBlockVO;
import pl.jaqjacek.games.tetris.model.ParamsProxy;
import pl.jaqjacek.games.tetris.notifications.AppNotifications;

/**
 * ...
 * @author jaq
 */
class BoardMediator extends Mediator 
{
	private var _boardBlock:BoardBlockVO;
	private var _boardView:BoardView;
	
	public static inline var NAME:String="BoardMediator_";
	
	public function new(viewComponent:Dynamic=null)
	{
		super(NAME, viewComponent);
	}
	
	override public function onRegister():Void 
	{
		var proxy:ParamsProxy=cast facade.retrieveProxy(ParamsProxy.NAME);
		_boardBlock=new BoardBlockVO(BlockVO.EMPTY_COLOR, proxy.gameBoardWidth, proxy.gameBoardHeight);
		_boardView=new BoardView();
	}
	
	override public function listNotificationInterests():Array<String> 
	{
		return [
			AppNotifications.SHOW_BOARD,
			AppNotifications.UPDATE_BOARD_VIEW,
			AppNotifications.HIDE_BOARD
		];
	}
	
	override public function handleNotification(notification:INotification):Void 
	{
		var nName:String=notification.getName();
		var nBody:Dynamic=notification.getBody();
		var updatePoint:Point;
		switch(nName)
		{
			case AppNotifications.SHOW_BOARD:
				viewComponent.addChildAt(_boardView,0);
				showBoard();
			case AppNotifications.HIDE_BOARD:
				viewComponent.addChild(_boardView);
			case AppNotifications.UPDATE_BOARD_VIEW:
				updatePoint = cast nBody;
				if(updatePoint !=null){
					var blockColor:Int = _boardBlock.getBlockAt(Std.int(updatePoint.x), Std.int(updatePoint.y));
					blockColor = blockColor == 0? BlockVO.EMPTY_COLOR:blockColor;
					_boardView.getBlockAt(Std.int(updatePoint.x), Std.int(updatePoint.y)).gotoAndStop(blockColor);
				}
			default:
		}
	}
	
	public function showBoard():Void 
	{
		_boardView.clean();
		var blockProxy:BlockProxy=cast facade.retrieveProxy(BlockProxy.NAME);
		for(i in 0..._boardBlock.blockWidth)
		{
			for(j in 0..._boardBlock.blockHeight)
			{
				addBlockToView(i, j, blockProxy.getBlockMedia(_boardBlock.blockColor));
			}
		}
		var proxy:ParamsProxy=cast facade.retrieveProxy(ParamsProxy.NAME);
		_boardView.x=proxy.gameBoardViewStartX;
		_boardView.y=proxy.gameBoardViewStartY;

	}
	
	public function addBlockToView(x:Int,y:Int,block:MovieClip):Void 
	{
		var proxy:ParamsProxy=cast facade.retrieveProxy(ParamsProxy.NAME);
		block.width=block.height=proxy.gameBlockSize;
		_boardView.createBlockAt(x,y,block);
	}
	
	public var boardBlock(get_boardBlock, null):BoardBlockVO;
 	private function get_boardBlock():BoardBlockVO 
	{
		return _boardBlock;
	}
	
}