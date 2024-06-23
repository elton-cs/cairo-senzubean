#[dojo::interface]
trait ISenzubeanActions {
    fn spawn_senzubean(ref world: IWorldDispatcher);
}

#[dojo::contract]
mod senzubean {
    use super::{ISenzubeanActions};
    use starknet::{ContractAddress, get_caller_address};
    use dojo_starter::models::senzubean::Senzubean;
    use dojo_starter::models::common::Vec2D;

    #[abi(embed_v0)]
    impl SenzubeanImpl of ISenzubeanActions<ContractState> {
        fn spawn_senzubean(ref world: IWorldDispatcher) {
            let player = get_caller_address();
            let senzubean = Senzubean {
                player_id: player, point: Vec2D { x: 6, y: 2 }, is_eaten: false
            };

            set!(world, (senzubean));
        }
    }
}
