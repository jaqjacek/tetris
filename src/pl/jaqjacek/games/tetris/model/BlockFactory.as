package pl.jaqjacek.games.tetris.model 
{
	/**
	 * ...
	 * @author jaq
	 */
	public class BlockFactory 
	{
		
		static public function getRandomBlock():BlockVO
		{
			//TODO return random block from diffrent block TYPES
			var tmpBlock:BlockVO = new BlockVO(2, 2, 0, "11|10");
			return tmpBlock
		}
		
	}

}