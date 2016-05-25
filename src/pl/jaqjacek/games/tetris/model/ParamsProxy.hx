package pl.jaqjacek.games.tetris.model ;
import org.puremvc.haxe.patterns.proxy.Proxy;

/**
 * ...
 * @author jaq
 */
class ParamsProxy extends Proxy 
{
	public static inline var NAME:String = "ParamsProxy_";
	public var currentSpeedDown:Float;
	public var speedMultiplayer:Int;
	public var currentLevel:Int;
	public var nextTickMoveDown:Int;
	public var nextTickInc:Int;
	public var gameBoardWidth:Int;
	public var gameBlockSize:Int;
	public var gameBoardHeight:Int;
	public var gameBoardViewStartX:Float;
	public var gameBoardViewStartY:Float;
	public var currentBlockBlockPositionX:Int;
	public var currentBlockBlockPositionY:Int;
	public var totalBlockPlayed:Int;
	
	
	public function new()
	{
		super(NAME);
	}
	
	override public function onRegister():Void 
	{
		currentSpeedDown=5;
		speedMultiplayer=1;
		currentLevel=1;
		nextTickInc=2;
		gameBoardWidth=16;
		gameBoardHeight=30;
		gameBlockSize=20;
		gameBoardViewStartX=200;
		gameBoardViewStartY=0;
		resetCurrentBlockPosition();
	}
	
	public function resetCurrentBlockPosition():Void 
	{
		currentBlockBlockPositionX=Math.floor(gameBoardWidth / 2);
		currentBlockBlockPositionY=0;
	}
	
	public function getCurrentBlockViewX():Float
	{
		return currentBlockBlockPositionX * gameBlockSize + gameBoardViewStartX;
	}
	
	public function getCurrentBlockViewY():Float
	{
		return currentBlockBlockPositionY * gameBlockSize + gameBoardViewStartY;
	}
	
	public function getMoveDownDistance():Float
	{
		return currentSpeedDown * speedMultiplayer;
	}
	
}