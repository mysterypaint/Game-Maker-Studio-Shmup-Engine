# Game-Maker-Studio-Shmup-Engine
Open-Source Gradius Shmup Engine for Game Maker: Studio
This engine is heavily reliant on knowledge of GML.
As long as all assets are replaced with your own, you may use this source code royalty-free. (Credit isn't required, but appreciated)
  
See it in action here: https://github.com/mysterypaint/Game-Maker-Studio-Shmup-Engine/releases

This engine features:
  - Dynamic game state system (Opening credits, titlescreen, game mode, pausing, cutscene mode, game over mode, "START" mode [The START window before the player gains control])
  - Window resizing hotkeys (1, 2, 3, Alt+Enter, Holding Esc closes game)
  - Tilemap loading (.oel OGMO Tilemap format: http://www.ogmoeditor.com/)
  - Real-time tilemap modification and export
  - The standard Gradius arsenal and HUD
  - Commented code (At least, I tried!)
  - Title Screen menu, including customizing controls (Default controls use keyboard Z/X/C, UDLR, and Enter)
  - Cheat codes on the pause screen

The engine also has many debug features (Press Q to toggle debug mode):
  - E: Toggle cutscene game state
  - R: Set X camera scroll to 0.3
  - T: Increase the player's speed
  - U: Trigger Kon.Code (Unlimited uses)
  - I: Give the player a Speedup
  - Numpad +/-: Increment/decrement player lives
  - Right/Left-click: Change tile value the mouse is currently hovered over
  - P: Export the current level to a new .eol in the game's "working_directory"
  - B: Kill the player (Suicide button)
