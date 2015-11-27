package pl.jaqjacek.games.tetris.notifications 
{
	/**
	 * ...
	 * @author jaq
	 */
	public class AppNotifications 
	{
		static public const STARTUP:String = "startup"
		static public const CREATE_BLOCK:String = "createBlock";
		static public const UPDATE_BLOCK:String = "updateBlock";
		
		static public const REMOVE_BLOCK:String = "removeBlock";
		static public const SHOW_BLOCK:String = "showBlock";
		
		//next block update
		
		static public const NEXT_BLOCK_UPDATE:String = "nextBlockUpdate";
		
		//current block
		static public const MOVE_BLOCK:String = "moveBlock"
		static public const MOVE_BLOCK_DOWN:String = "moveBlockDown";
		static public const ROTATE_BLOCK:String = "rotateBlock";
		
		
		
		static public const START_GAME:String = "startGame";
		static public const NEXT_CURRENT_BLOCK:String = "nextCurrentBlock";
		static public const START_SPEEDING_UP:String = "startSpeedingUp";
		static public const STOP_SPEEDING_UP:String = "stopSpeedingUp";
		static public const START_TIMER:String = "startTimer";
		static public const STOP_TIMER:String = "stopTimer";
		static public const PAUSE_TIMER:String = "pauseTimer";
		static public const UNPAUSE_TIMER:String = "unpauseTimer";
		static public const TIMER_TICK:String = "timerTick";
	}

}