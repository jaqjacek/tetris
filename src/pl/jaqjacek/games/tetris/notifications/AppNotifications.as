package pl.jaqjacek.games.tetris.notifications 
{
	/**
	 * ...
	 * @author jaq
	 */
	public class AppNotifications 
	{
		static public const STARTUP:String = "startup"
		static public const START_GAME:String = "startGame";
		static public const NEXT_CURRENT_BLOCK:String = "nextCurrentBlock";
		static public const START_SPEEDING_UP:String = "startSpeedingUp";
		static public const STOP_SPEEDING_UP:String = "stopSpeedingUp";
		static public const START_TIMER:String = "startTimer";
		static public const STOP_TIMER:String = "stopTimer";
		static public const PAUSE_TIMER:String = "pauseTimer";
		static public const UNPAUSE_TIMER:String = "unpauseTimer";
		static public const TIMER_TICK:String = "timerTick";
		static public const CANT_MOVE_BLOCK:String = "cantMoveBlock";
		static public const END_GAME:String = "endGame";
		static public const CHECK_END_OF_GAME:String = "checkEndOfGame";
		
		//next block update
		static public const NEXT_BLOCK_UPDATE:String = "nextBlockUpdate";
		
		//current block
		static public const MOVE_BLOCK:String = "moveBlock"
		static public const MOVE_BLOCK_DOWN:String = "moveBlockDown";
		static public const ROTATE_BLOCK:String = "rotateBlock";
		static public const CHECK_BLOCK_ROTATION:String = "checkBlockRotation";
		static public const CHECK_MOVE_BLOCK_DOWN:String = "checkMoveBlockDown";
		static public const CREATE_BLOCK:String = "createBlock";
		static public const UPDATE_BLOCK:String = "updateBlock";
		static public const REMOVE_BLOCK:String = "removeBlock";
		static public const SHOW_BLOCK:String = "showBlock";
		
		//board
		static public const SHOW_BOARD:String = "showBoard";
		static public const HIDE_BOARD:String = "hideBoard";
		static public const ADD_BLOCK_TO_BOARD:String = "addBlockToBoard";
		static public const UPDATE_BOARD_VIEW:String = "updateBoardView";
		static public const CHECK_ADD_BLOCK_TO_BOARD:String = "checkAddBlockToBoard";
		static public const CHECK_FULL_LINES_ON_BOARD:String = "checkFullLinesOnBoard";
		static public const BOARD_SPLICE_LINE:String = "boardSpliceLine";
		static public const DESTROYED_LINES_AMOUNT:String = "destroyedLinesAmount";
		
		//points
		static public const ADD_POINTS:String = "addPoints";
		static public const RESET_POINTS:String = "resetPoints";
		
		//level
		static public const UPDATE_LEVEL:String = "updateLevel";
		static public const BLOCK_TO_LEVEL:String = "blockToLevel";
	}

}