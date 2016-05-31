package pl.jaqjacek.games.tetris.controller;
#if flash
import flash.events.Event;
#end
import org.puremvc.haxe.interfaces.INotification;
import org.puremvc.haxe.patterns.mediator.Mediator;
import pl.jaqjacek.games.tetris.notifications.AppNotifications;

/**
 * ...
 * @author jaq
 */
class TimeControlerMediator extends Mediator 
{
	public static inline var NAME:String = "TimeControlerMediator_";
	private var _currentTick:Int;
	
	public function new(viewComponent:Dynamic=null)
	{
		super(NAME, viewComponent);
	}
	
	override public function onRegister():Void 
	{
		super.onRegister();
		_currentTick=0;
	}
	
	override public function listNotificationInterests():Array<String> 
	{
		return [ 	AppNotifications.START_TIMER,
					AppNotifications.STOP_TIMER,
					AppNotifications.PAUSE_TIMER,
					AppNotifications.UNPAUSE_TIMER
		];
	}
	#if flash
	override public function handleNotification(notification:INotification):Void 
	{
		var nName:String=notification.getName();
		var nBody:Dynamic=notification.getBody();
		
		switch(nName)
		{
			case AppNotifications.START_TIMER:
				_currentTick=0;
				viewComponent.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
			case AppNotifications.STOP_TIMER:
				_currentTick=0;
				viewComponent.removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
			default:
		}
	}
	
	private function enterFrameHandler(e:Event):Void 
	{
		_currentTick++;
		facade.sendNotification(AppNotifications.TIMER_TICK, _currentTick);
	}
	#end
	
	#if js
	override public function handleNotification(notification:INotification):Void 
	{
		var nName:String=notification.getName();
		var nBody:Dynamic=notification.getBody();
		
		switch(nName)
		{
			case AppNotifications.START_TIMER:
				_currentTick = 0;
				if (nBody != null) {
					viewComponent = nBody;
				}
				viewComponent.onUpdate = updateJSHandler;
			case AppNotifications.STOP_TIMER:
				_currentTick=0;
				viewComponent.onUpdate = null;
			default:
		}
	}
	
	function updateJSHandler(time:Float=1) 
	{
		_currentTick++;
		facade.sendNotification(AppNotifications.TIMER_TICK, _currentTick);
	}
	#end
	
}