#[dojo::interface]
trait IEnemyActions {
    fn set_dice(ref world: IWorldDispatcher);
    fn enemy_attack(ref world: IWorldDispatcher);
}

#[dojo::contract]
mod enemy {
    use super::{IEnemyActions};
    use starknet::{ContractAddress, get_caller_address};
    use dojo_starter::models::player::Player;
    use dojo_starter::models::common::Vec2D;
    use dojo_starter::models::enemy::{Dice, DiceTrait, EnemyAttack};

    const DICE_FACE_COUNT: u8 = 3;
    const DICE_SEED: felt252 = 'SEED';

    #[abi(embed_v0)]
    impl EnemyImpl of IEnemyActions<ContractState> {
        fn set_dice(ref world: IWorldDispatcher) {
            let mut dice = DiceTrait::new(DICE_FACE_COUNT, DICE_SEED);

            set!(world, (dice));
        }

        fn enemy_attack(ref world: IWorldDispatcher) {
            let player_id = get_caller_address();

            let mut dice = get!(world, DICE_FACE_COUNT, (Dice));

            let attack = dice.roll();
            let enemy = EnemyAttack { player_id, location: attack };
            set!(world, (enemy))
        }
    }
}
