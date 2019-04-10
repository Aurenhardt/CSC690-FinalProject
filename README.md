# CSC690-FinalProject
CSC690-FinalProject, implementing a Galaga Clone in Swift/Xcode

Proposal:
- I want to create a Galaga Clone on in xcode in swift. I intend to follow a tutorial initially then attempt to
  write it again from scratch with my own custom features.
  
- With this it will have the following MUST-Have features (Based of the tutorial):
  - It shall have a ship that the user can move left or right.
  - This ship can fire when and hit other enemy ships. 
  - If the user lets a ship pass or gets hit by another ship the user loses a life.
  - As the user plays they will have a score that increments as you destroy enemy ships.
  - If the user runs out of lives it is game over.
  - The game will display your score and the high score which must be saved on the iPhone storage.
  - At this screen you will have a button where you can restart and try again.
 
 - After this I have a few goals to make this app my own. I will say these are the NICE-TO-HAVE features:
  - The user can reach threshold in score where they unlock a new ship and a new way to fire bullets.
  - An example will be if the user hits 1000 pts they unlock a ship with a new sprite and the ability to fire faster, 
    which they can access after they lose the session and equip for the next session. This there will ideally be 3 ships.
  - Also ideal, is a feature where the user can customize the color of the ship they are using, Either with preset pallets
    or a color wheel of some kind.
    
- How long this will take:
  - The tutorial that I will be taking as reference is about 4 hours long. It is divided into 7 parts and can be seen
    here: https://www.youtube.com/playlist?list=PLrL5aCF7Ods-6C7QjzXibUZoYjMzhWBfL
  - This gives me a minimum amount of time i need to make this app initially. I estimate it will take me an addtional 
    4 hours to re-do the entire thing.
  - After this, it should fulfill all of the MUST-HAVE features I have listen above.
  - With the initial part done, as well as the redo done I will start implementing my NICE-TO-HAVE features in this order.
    - Firstly: I will figure out how to alter the way bullets are fired for the custom ships. The 3 tiers of firing will be:
        Increased Fire Rate, Increased Projectile Size, Hold Down and Fire Laser. (Estimated 1-3 hours)
    - Secondly: I will find a way to make it so the user can select ships. I plan to have on object for the ship and in the object
        it can access all 3 variants as per the user's choice. Selecting the ship should be nothing more than changing the sprite and
        way the ship fires. (Estimated 2-4 hours)
    - Lastly I will find a way to let the user customize the color of the ship, after doing all of the above I should hopefully find a
        way to do this quickly. (Estimated 1-2 hours)
  - This means that the total amount of hours to do this at its worst case will be 15 hours of work. By my estimates, but this does not
    include the projects I have for other classes. I also plan to create my own assets for this project, which may take me 1-2 hours 
    making the actual work time at its worst to be close to 20 hours, but I personally do not count that since I do not know if I will 
    have the time to do so and may just fallback on free assets either from the tutorial or the internat as a whole.
    
- Workload:
  - Since I will be going in alone I will be working on all of this at once. I, at the writting of this README, do not have a 
    partner to review my code and hopefully I find one to do this. 
    
  
