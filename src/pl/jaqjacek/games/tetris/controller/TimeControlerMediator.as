package pl.jaqjacek.games.tetris.controller 
{
	import flash.display.InteractiveObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	import pl.jaqjacek.games.tetris.notifications.AppNotifications;
	
	/**
	 * ...
	 * @author jaq
	 */
	public class TimeControlerMediator extends Mediator 
	{
		public static const NAME:String = "TimeControlerMediator_"
		private var _currentTick:int;
		
		public function TimeControlerMediator(viewComponent:Object=null) 
		{
			super(NAME, viewComponent);
		}
		
		override public function onRegister():void 
		{
			super.onRegister();
			_currentTick = 0;
		}
		
		override public function listNotificationInterests():Array 
		{
			return [ 	AppNotifications.START_TIMER,
						AppNotifications.STOP_TIMER,
						AppNotifications.PAUSE_TIMER,
						AppNotifications.UNPAUSE_TIMER
			]
		}
		
		override public function handleNotification(notification:INotification):void 
		{
			var nName:String = notification.getName();
			var nBody:Object = notification.getBody();
			
			switch (nName) 
			{
				case AppNotifications.START_TIMER:
					_currentTick = 0;
					Sprite(viewComponent).addEventListener(Event.ENTER_FRAME, enterFrameHandler);
				break;
				case AppNotifications.STOP_TIMER:
					_currentTick = 0;
					Sprite(viewComponent).removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
				break;
				default:
			}
		}
		
		private function enterFrameHandler(e:Event):void 
		{
			_currentTick++;
			facade.sendNotification(AppNotifications.TIMER_TICK, _currentTick);
		}
		
	}

}