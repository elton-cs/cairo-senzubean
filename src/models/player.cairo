use starknet::ContractAddress;
use dojo_starter::models::common::Vec2D;

#[derive(Copy, Drop, Serde)]
#[dojo::model]
struct Player {
    #[key]
    player_id: ContractAddress,
    position: Vec2D,
    health: u8,
}
