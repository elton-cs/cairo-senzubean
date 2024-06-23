#[dojo::interface]
trait IArenaActions {
    fn spawn_arena(ref world: IWorldDispatcher);
}

#[dojo::contract]
mod arena {
    use super::{IArenaActions};
    use starknet::{ContractAddress, get_caller_address};
    use dojo_starter::models::arena::Arena;
    use dojo_starter::models::common::Vec2D;

    #[abi(embed_v0)]
    impl ArenaImpl of IArenaActions<ContractState> {
        fn spawn_arena(ref world: IWorldDispatcher) {
            let player_id = get_caller_address();
            let arena = Arena { player_id, bounds: Vec2D { x: 7, y: 3 } };

            set!(world, (arena));
        }
    }
}
