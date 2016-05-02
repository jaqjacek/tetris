package pl.jaqjacek.games.tetris.model;
/**
 * ...
 * @author jaq
 */
class BoardSpliceVO 
{
	public var board:BoardBlockVO;
	public var rowIndex:Int;
	
	public function new(board:BoardBlockVO,rowIndex:Int)
	{
		this.rowIndex=rowIndex;
		this.board=board;
	}
	
	public function clean():Void 
	{
		board=null;
	}
	
}