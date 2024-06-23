use starknet::ContractAddress;
use dojo_starter::models::common::Vec2D;

#[derive(Copy, Drop, Serde)]
#[dojo::model]
struct Senzubean {
    #[key]
    player_id: ContractAddress,
    point: Vec2D,
    is_eaten: bool,
}
