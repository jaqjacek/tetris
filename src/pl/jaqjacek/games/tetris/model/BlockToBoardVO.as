package pl.jaqjacek.games.tetris.model 
{
	/**
	 * ...
	 * @author jaq
	 */
	public class BlockToBoardVO 
	{
		public var block:BlockVO;
		public var blockX:int;
		public var blockY:int;
		public var board:BoardBlockVO;
		
		public function BlockToBoardVO(board:BoardBlockVO,block:BlockVO,x:int,y:int) 
		{
			this.board = board;
			this.block = block;
			this.blockX = x;
			this.blockY = y;
		}
		
		public function reset():void 
		{
			block = null;
			board = null;
		}
	}

}