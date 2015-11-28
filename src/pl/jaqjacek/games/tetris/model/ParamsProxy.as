package pl.jaqjacek.games.tetris.model 
{
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	/**
	 * ...
	 * @author jaq
	 */
	public class ParamsProxy extends Proxy 
	{
		public static const NAME:String = "ParamsProxy_"
		public var currentSpeedDown:Number;
		public var speedMultiplayer:int;
		public var currentLevel:int;
		public var nextTickMoveDown:int;
		public var nextTickInc:int;
		
		public function ParamsProxy() 
		{
			super(NAME);
		}
		
		override public function onRegister():void 
		{
			currentSpeedDown = 5;
			speedMultiplayer = 1;
			currentLevel = 1;
			nextTickInc = 4;
			trace('register params proxy');
		}
		
		public function getMoveDownDistance():Number
		{
			return currentSpeedDown * speedMultiplayer;
		}
		
	}

}