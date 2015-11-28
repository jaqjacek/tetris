package pl.jaqjacek.games.tetris.model 
{
	import flash.geom.Point;
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
		public var gameBoardWidth:int;
		public var gameBlockSize:int;
		public var gameBoardHeight:int;
		public var gameBoardViewStartX:Number;
		public var gameBoardViewStartY:Number;
		public var currentBlockBlockPositionX:int;
		public var currentBlockBlockPositionY:int;
		
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
			gameBoardWidth = 16;
			gameBoardHeight = 30;
			gameBlockSize = 20;
			gameBoardViewStartX = 200;
			gameBoardViewStartY = 0;
			resetCurrentBlockPosition();
		}
		
		public function resetCurrentBlockPosition():void 
		{
			currentBlockBlockPositionX = Math.floor(gameBoardWidth / 2);
			currentBlockBlockPositionY = Math.floor(gameBoardHeight / 2);
		}
		
		public function getCurrentBlockViewX():Number
		{
			return currentBlockBlockPositionX * gameBlockSize + gameBoardViewStartX;
		}
		
		public function getMoveDownDistance():Number
		{
			return currentSpeedDown * speedMultiplayer;
		}
		
	}

}