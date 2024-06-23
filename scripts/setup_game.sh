#!/bin/bash

# Order of transactions
sozo execute dojo_starter::systems::arena::arena spawn_arena --wait
sozo execute dojo_starter::systems::senzubean::senzubean spawn_senzubean --wait
sozo execute dojo_starter::systems::player::player spawn_player --wait
sozo execute dojo_starter::systems::enemy::enemy set_dice --wait

