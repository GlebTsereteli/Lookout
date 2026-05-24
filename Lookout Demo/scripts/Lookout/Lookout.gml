// feather ignore all

function Lookout() {
	static __modules = [
		new __LookoutResources(),
		new __LookoutInstances(),
		new __LookoutDisplay(),
		new __LookoutRooms(),
		new __LookoutAudioEffects(),
	];
	
	static __tick = time_source_create(time_source_global, 1, time_source_units_frames, function() {
		if (not is_debug_overlay_open()) return;
		
		array_foreach(Lookout.__modules, function(_module) {
			_module.__Tick();
		});
	}, [], -1);
	time_source_start(__tick);
	
	static __view = __LookoutCreateView("Lookout", true, 250, 60 + array_length(__modules) * 23);
	
	dbg_section("Modules", true);
	array_foreach(__modules, function(_module) {
		dbg_checkbox(ref_create(_module, "__enabled"), _module.__name);
	});
}
