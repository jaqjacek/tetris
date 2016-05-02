package pl.jaqjacek.games.tetris.notifications ;
/**
 * ...
 * @author jaq
 */
class AppNotifications 
{
	static public inline var STARTUP:String = "startup";
	static public inline var CREATE_BLOCK:String="createBlock";
	static public inline var UPDATE_BLOCK:String="updateBlock";
	
	static public inline var REMOVE_BLOCK:String="removeBlock";
	static public inline var SHOW_BLOCK:String="showBlock";
	
	//next block update
	
	static public inline var NEXT_BLOCK_UPDATE:String="nextBlockUpdate";
	
	//current block
	static public inline var MOVE_BLOCK:String = "moveBlock";
	static public inline var MOVE_BLOCK_DOWN:String="moveBlockDown";
	static public inline var ROTATE_BLOCK:String="rotateBlock";
	static public inline var CHECK_BLOCK_ROTATION:String="checkBlockRotation";
	
	
	
	static public inline var START_GAME:String="startGame";
	static public inline var NEXT_CURRENT_BLOCK:String="nextCurrentBlock";
	static public inline var START_SPEEDING_UP:String="startSpeedingUp";
	static public inline var STOP_SPEEDING_UP:String="stopSpeedingUp";
	static public inline var START_TIMER:String="startTimer";
	static public inline var STOP_TIMER:String="stopTimer";
	static public inline var PAUSE_TIMER:String="pauseTimer";
	static public inline var UNPAUSE_TIMER:String="unpauseTimer";
	static public inline var TIMER_TICK:String="timerTick";
	static public inline var CANT_MOVE_BLOCK:String="cantMoveBlock";
	
	//board
	static public inline var SHOW_BOARD:String="showBoard";
	static public inline var HIDE_BOARD:String="hideBoard";
	static public inline var ADD_BLOCK_TO_BOARD:String="addBlockToBoard";
	static public inline var UPDATE_BOARD_VIEW:String="updateBoardView";
	static public inline var CHECK_ADD_BLOCK_TO_BOARD:String="checkAddBlockToBoard";
	static public inline var CHECK_FULL_LINES_ON_BOARD:String="checkFullLinesOnBoard";
	static public inline var BOARD_SPLICE_LINE:String="boardSpliceLine";
	static public inline var CHECK_END_OF_GAME:String="checkEndOfGame";
	static public inline var END_GAME:String="endGame";
	static public inline var DESTROYED_LINES_AMOUNT:String="destroyedLinesAmount";
	
	
	//points
	static public inline var ADD_POINTS:String="addPoints";
	static public inline var RESET_POINTS:String="resetPoints";
	
	//level
	static public inline var UPDATE_LEVEL:String="updateLevel";
	static public inline var BLOCK_TO_LEVEL:String="blockToLevel";
	static public inline var CHECK_MOVE_BLOCK_DOWN:String = "checkMoveBlockDown";
}