# Onigiri (Formerly "Senzubean") Cairo Smart Contracts

This repo consists of the Onigiri backend setup, which include the following:
- Cairo smart contracts
- Katana sequencer
- Torii server
- Game transaction scripts


## Instructions

Running the contracts locally have already been setup via bash scripts that run the relevant `sozo` commands. 

1. instantiate the Katana sequencer in terminal #1
```
scarb run katana
```

2. instantiate the Torii indexer in terminal #2
```
scarb run torii
```

3. compile and deploy onigiri contracts in terminal #3
```
scarb run migrate
```

4. At this point, the backend and contracts are setup to start the Onigiri frontend over at the [bevy-senzubean](https://github.com/elton-cs/bevy-senzubean) repo. Follow the instructions there to have a graphical display of the game.  

5. Once all contracts have successfully been migrated and applied to the running katana sequencer, run the setup script to start the game in terminal #3 (or another new terminal)
```
scarb run setup_game
```

6. Lastly, we can move the player using one of the following scripts per round:
```
scarb run move_left
scarb run move_middle
scarb run move_right
```

To reset the player's position (so the character doesn't keep going right and off the screen), simply run step 5 again. 

## Future Work
the entire game functionality is currently still incomplete, but I have plans to finish it up in the near future when time permits. I unfortunately spent way too much time on the frontend and Bevy integration with the torii client, so only the movement implementation was complete by the end of StarkHack. 

The following still needs to be implemented: 
- Enemy that chooses a random lane and throws a projectile at the player every round
- Player health display and logic to have health be deducted when attacked
- Win screen after player reaches the onigiri
- And all the relevant front end updates that come with the listed logic above