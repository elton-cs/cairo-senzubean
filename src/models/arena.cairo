use starknet::ContractAddress;
use dojo_starter::models::common::Vec2D;

#[derive(Copy, Drop, Serde)]
#[dojo::model]
struct Arena {
    #[key]
    player_id: ContractAddress,
    bounds: Vec2D,
}
