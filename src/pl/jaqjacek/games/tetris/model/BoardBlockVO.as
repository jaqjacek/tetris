package pl.jaqjacek.games.tetris.model 
{
	/**
	 * ...
	 * @author jaq
	 */
	public class BoardBlockVO extends BlockVO 
	{
		
		public function BoardBlockVO(p_blockColor:int = 0, p_blockWidth:int = 10, p_blockHeight:int = 20 ) 
		{
			super(p_blockColor);
			blockHeight = p_blockHeight;
			blockWidth = p_blockWidth;
		}
		
		override public function setFromString(p_blockString:String):void 
		{
			createBlockSlots();
		}
		
	}

}