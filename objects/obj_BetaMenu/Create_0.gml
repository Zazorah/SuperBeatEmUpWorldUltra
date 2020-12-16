enum OptionType {
	loadRoom,
	closeGame
}

contents = [
	[OptionType.loadRoom, "Empty Test Room (Nicholas)", rm_Test_001],
	[OptionType.loadRoom, "Empty Test Room (Nikki)", rm_Test_002],
	[OptionType.loadRoom, "Arcade Test Room (Nicholas)", rm_Test_Arcade],
	[OptionType.closeGame, "Close Game"]
];

option_index = 0;
game_controller = instance_find(obj_Game, 0);