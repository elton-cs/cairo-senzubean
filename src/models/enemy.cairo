use poseidon::PoseidonTrait;
use hash::HashStateTrait;
use traits::Into;
use starknet::ContractAddress;

#[derive(Copy, Drop, Serde)]
#[dojo::model]
struct Dice {
    #[key]
    face_count: u8,
    seed: felt252,
    nonce: felt252,
}

trait DiceTrait {
    fn new(face_count: u8, seed: felt252) -> Dice;
    fn roll(ref self: Dice) -> u8;
}

impl DiceImpl of DiceTrait {
    #[inline(always)]
    fn new(face_count: u8, seed: felt252) -> Dice {
        Dice { face_count, seed, nonce: 0 }
    }

    #[inline(always)]
    fn roll(ref self: Dice) -> u8 {
        let mut state = PoseidonTrait::new();
        state = state.update(self.seed);
        state = state.update(self.nonce);
        self.nonce += 1;
        let random: u256 = state.finalize().into();
        (random % self.face_count.into() + 1).try_into().unwrap()
    }
}

#[derive(Copy, Drop, Serde)]
#[dojo::model]
struct EnemyAttack {
    #[key]
    player_id: ContractAddress,
    location: u8,
}
