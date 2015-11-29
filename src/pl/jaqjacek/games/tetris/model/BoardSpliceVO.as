package pl.jaqjacek.games.tetris.model 
{
	/**
	 * ...
	 * @author jaq
	 */
	public class BoardSpliceVO 
	{
		public var board:BoardBlockVO;
		public var rowIndex:int;
		
		public function BoardSpliceVO(board:BoardBlockVO,rowIndex:int) 
		{
			this.rowIndex = rowIndex;
			this.board = board;
		}
		
		public function clean():void 
		{
			board = null;
		}
		
	}

}