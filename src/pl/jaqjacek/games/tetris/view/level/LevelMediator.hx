package pl.jaqjacek.games.tetris.view.level ;
import flash.display.Sprite;
import org.puremvc.haxe.interfaces.INotification;
import org.puremvc.haxe.patterns.mediator.Mediator;
import pl.jaqjacek.games.tetris.model.ParamsProxy;
import pl.jaqjacek.games.tetris.notifications.AppNotifications;

/**
 * ...
 * @author jaq
 */
class LevelMediator extends Mediator 
{
	
	public static inline var NAME:String = "LevelMediator_";
	private var _levelView:LevelView;
	
	public function new(viewComponent:Dynamic=null)
	{
		super(NAME, viewComponent);
		
	}
	
	override public function onRegister():Void 
	{
		_levelView=new LevelView();
		viewComponent.addChild(_levelView);
		_levelView.setlevel(1);
		_levelView.y=100;
	}
	
	override public function listNotificationInterests():Array<String> 
	{
		return [
				AppNotifications.UPDATE_LEVEL
		];
	}
	
	override public function handleNotification(notification:INotification):Void 
	{
		var nName:String=notification.getName();
		var nBody:Dynamic=notification.getBody();
		var paramsProxy:ParamsProxy = cast facade.retrieveProxy(ParamsProxy.NAME);
		switch(nName)
		{
			case AppNotifications.UPDATE_LEVEL:
				paramsProxy.currentLevel=Math.floor(paramsProxy.totalBlockPlayed / 10)+1;
				_levelView.setlevel(paramsProxy.currentLevel);
			default:
		}
	}
	
}