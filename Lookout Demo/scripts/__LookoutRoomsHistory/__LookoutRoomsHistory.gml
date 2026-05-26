// feather ignore all

function __LookoutRoomsHistory() constructor {
	__n = 16;
	__pool = array_create(__n, "-");
		
	static __Init = function() {
		dbg_section("History");
		for (var _i = 0; _i < __n; _i++) {
			var _ii = _i + 1;
			var _label = ((_ii < 10) ? $"0{_ii}" : _ii)
			dbg_watch(ref_create(self, "__pool", _i), _label);
		}
	};
	static __Add = function(_room) {
		array_insert(__pool, 0, room_get_name(_room));
		if (array_length(__pool) > __n) {
			array_pop(__pool);
		}
	};
	
	__Add(room);
}
