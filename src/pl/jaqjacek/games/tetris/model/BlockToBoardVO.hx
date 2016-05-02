package pl.jaqjacek.games.tetris.model ;
/**
 * ...
 * @author jaq
 */
class BlockToBoardVO 
{
	public var block:BlockVO;
	public var currentX:Int;
	public var currentY:Int;
	public var board:BoardBlockVO;
	public var lastX:Int;
	public var lastY:Int;
	
	public function new(board:BoardBlockVO,block:BlockVO,x:Int,y:Int,lastX:Int,lastY:Int)
	{
		this.board=board;
		this.block=block;
		this.currentX=x;
		this.currentY=y;
		this.lastX=lastX;
		this.lastY=lastY;
	}
	
	public function reset():Void 
	{
		block=null;
		board=null;
	}
}