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
			var tmpBlock:BlockVO = new BlockVO(3, 3, 0, "111|010");
			return tmpBlock
		}
		
	}

}