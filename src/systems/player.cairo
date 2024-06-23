#[dojo::interface]
trait IPlayerActions {
    fn spawn_player(ref world: IWorldDispatcher);
    fn move(ref world: IWorldDispatcher, tile: felt252);
}

#[dojo::contract]
mod player {
    use super::{IPlayerActions};
    use starknet::{ContractAddress, get_caller_address};
    use dojo_starter::models::player::Player;
    use dojo_starter::models::common::Vec2D;

    #[abi(embed_v0)]
    impl PlayerImpl of IPlayerActions<ContractState> {
        fn spawn_player(ref world: IWorldDispatcher) {
            let player_id = get_caller_address();

            let player = Player { player_id, position: Vec2D { x: 1, y: 2 }, health: 3 };

            set!(world, (player));
        }

        fn move(ref world: IWorldDispatcher, tile: felt252) {
            let player_id = get_caller_address();

            let mut player = get!(world, player_id, (Player));
            let current_position = player.position;
            let new_position = new_position(current_position, tile);
            player.position = new_position;

            set!(world, (player));
        }
    }

    fn new_position(mut position: Vec2D, tile: felt252) -> Vec2D {
        position.x += 1;
        match tile {
            0 => position.y = 1,
            1 => position.y = 2,
            2 => position.y = 3,
            _ => panic!("Invalid tile selected!")
        }
        position
    }
}
