enum OptionType {
	loadRoom,
	closeGame
}

contents = [
	[OptionType.loadRoom, "Nicholas Test Room", rm_Test_001],
	[OptionType.loadRoom, "Nikki Test Room", rm_Test_002],
	[OptionType.closeGame, "Close Game"]
];

option_index = 0;
game_controller = instance_find(obj_Game, 0);