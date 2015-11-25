package pl.jaqjacek.games.tetris.model 
{
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	/**
	 * ...
	 * @author jaq
	 */
	public class BlockProxy extends Proxy 
	{
		public static const NAME:String = "BlockProxy_"
		
		private var _blocks:Vector.<BlockVO>;
		
		private var _curentBlock:BlockVO;
		
		public function BlockProxy() 
		{
			super(NAME);
		}
		
		override public function onRegister():void 
		{
			super.onRegister();
			_blocks = new Vector.<BlockVO>();
			initBlockList();
		}
		
		public function initBlockList():void 
		{
			//create standard block list
			_blocks.push(new BlockVO(0,"1|1|1|1"));
			_blocks.push(new BlockVO(1,"11|11"));
			_blocks.push(new BlockVO(2,"111|01"));
			_blocks.push(new BlockVO(3,"111|1"));
			
		}
		
		public function getRandomBlock():BlockVO
		{
			return _blocks[Math.floor(Math.random() * _blocks.length)];
		}
		
	}

}