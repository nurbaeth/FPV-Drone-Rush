// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FPVDroneRush {
    uint public constant MAX_ENERGY = 100;
    uint public constant ENERGY_PER_STEP = 10;
    uint public constant TOTAL_CHECKPOINTS = 5;

    struct Drone {
        uint energy;
        uint checkpoint;
        bool finished;
    }

    mapping(address => Drone) public drones;
    address[] public players;
    address public winner;
    bool public raceStarted;
    uint public startTime;

    modifier onlyBeforeStart() {
        require(!raceStarted, "Race already started");
        _;
    }

    modifier onlyInRace() {
        require(raceStarted, "Race not started");
        require(!drones[msg.sender].finished, "You already finished");
        _;
    }

    function register() external onlyBeforeStart {
        require(drones[msg.sender].energy == 0, "Already registered");
        drones[msg.sender] = Drone(MAX_ENERGY, 0, false);
        players.push(msg.sender);
    }

    function startRace() external onlyBeforeStart {
        require(players.length >= 2, "Need at least 2 players");
        raceStarted = true;
        startTime = block.timestamp;
    }

    function step() external onlyInRace {
        Drone storage drone = drones[msg.sender];
        require(drone.energy >= ENERGY_PER_STEP, "Not enough energy");

        drone.energy -= ENERGY_PER_STEP;
        drone.checkpoint += 1;

        if (drone.checkpoint >= TOTAL_CHECKPOINTS) {
            drone.finished = true;
            if (winner == address(0)) {
                winner = msg.sender;
            }
        }
    }

    function getMyDrone() external view returns (Drone memory) {
        return drones[msg.sender];
    }

    function getAllPlayers() external view returns (address[] memory) {
        return players;
    }
}
