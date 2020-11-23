enum OptionType {
	loadRoom,
	closeGame
}

contents = [
	[OptionType.loadRoom, "Test Room", rm_Test_001],
	[OptionType.closeGame, "Close Game"]
];

option_index = 0;
game_controller = instance_find(obj_Game, 0);