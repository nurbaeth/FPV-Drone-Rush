# 🚀 FPV Drone Rush            
             
**FPV Drone Rush** is the **first fully on-chain FPV racing simulator** built with Solidity. Compete in drone races, manage your energy, pass checkpoints, and be the first to reach the finish line — all on Ethereum.   
              
---            
        
## 🎮 Gameplay           
      
- Players register their drones before the race starts.            
- Each drone has **100 energy points**.            
- Every step forward **costs 10 energy** and moves you to the next checkpoint.        
- There are **5 total checkpoints**.        
- The **first player to finish all checkpoints** wins the race!       
           
---   
     
## ⚙️ Smart Contract Features      
  
- ✅ On-chain drone registration      
- 🔋 Energy management system    
- 🏁 Checkpoint tracking        
- 👑 Automatic winner detection  
- 🛑 Race locking mechanism once started   
   
---      
      
## 🧠 How It Works
 
1. Players call `register()` to enter the race. 
2. When ready, someone calls `startRace()` to lock in players and begin.    
3. Players take steps using `step()` to move through checkpoints. 
4. Energy is consumed with each step. 
5. The first to reach **checkpoint 5** is declared the winner. 

---   

## 🧪 Example

```solidity
register();   // Join the race
startRace();  // Start the race
step();       // Move to checkpoint 1
step();       // Move to checkpoint 2
...
