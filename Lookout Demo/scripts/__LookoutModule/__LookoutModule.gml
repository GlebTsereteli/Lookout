// feather ignore all

function __LookoutModule(_name, _w = 300, _h = 300) constructor {
	__name = _name;
	__w = _w;
	__h = _h;
	
	__enabled = false;
	__prevEnabled = false;
	__view = undefined;
	
	static __Refresh = __LookoutNoop;
	static __Init = __LookoutNoop;
	static __Tick = function() {
		if (__enabled != __prevEnabled) {
			__prevEnabled = __enabled;
			
			if (__enabled) {
				var _w = 300;
				var _x = (window_get_width() - _w) / 2;
				__view = dbg_view($"Lookout: {__name}", true, _x, __LOOKOUT_VIEW_Y, __w, __h);
				
				__Init();
			}
			else {
				dbg_view_delete(__view);
			}
		}
		else if (__enabled) {
			__Refresh();
		}
	};
}
