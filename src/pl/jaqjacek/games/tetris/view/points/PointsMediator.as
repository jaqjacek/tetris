package pl.jaqjacek.games.tetris.view.points 
{
	import flash.display.Sprite;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	import pl.jaqjacek.games.tetris.notifications.AppNotifications;
	
	/**
	 * ...
	 * @author jaq
	 */
	public class PointsMediator extends Mediator 
	{
		public static const NAME:String = "PointsMediator_"
		private var _pointsView:PointsView;
		private var _points:int;
		
		public function PointsMediator(viewComponent:Object=null) 
		{
			super(NAME, viewComponent);
			
		}
		
		override public function onRegister():void 
		{
			_pointsView = new PointsView();
			_points = 0;
			(viewComponent as Sprite).addChild(_pointsView);
			_pointsView.setScore(0);
		}
		
		override public function listNotificationInterests():Array 
		{
			return [
					AppNotifications.ADD_POINTS,
					AppNotifications.RESET_POINTS
			];
		}
		
		override public function handleNotification(notification:INotification):void 
		{
			var nName:String = notification.getName();
			var nBody:Object = notification.getBody();
			
			switch (nName) 
			{
				case AppNotifications.ADD_POINTS:
					_points += (nBody as int);
					_pointsView.setScore(_points);
				break;
				
				case AppNotifications.RESET_POINTS:
					_points = 0;
					_pointsView.setScore(_points);
				break;
				default:
			}
		}
		
	}

}