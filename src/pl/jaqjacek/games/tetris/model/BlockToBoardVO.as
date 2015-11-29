package pl.jaqjacek.games.tetris.model 
{
	/**
	 * ...
	 * @author jaq
	 */
	public class BlockToBoardVO 
	{
		public var block:BlockVO;
		public var currentX:int;
		public var currentY:int;
		public var board:BoardBlockVO;
		public var lastX:int;
		public var lastY:int;
		
		public function BlockToBoardVO(board:BoardBlockVO,block:BlockVO,x:int,y:int,lastX:int,lastY:int) 
		{
			this.board = board;
			this.block = block;
			this.currentX = x;
			this.currentY = y;
			this.lastX = lastX;
			this.lastY = lastY;
		}
		
		public function reset():void 
		{
			block = null;
			board = null;
		}
	}

}