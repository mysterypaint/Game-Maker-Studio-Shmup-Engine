audio_stop_all();
            
            var gameOverString = "Game Over!";
            if ((global.playerScore >= global.highScore && (objMain.currPlayers<=1)) || (global.playerScore >= global.highCoScore && (objMain.currPlayers>=2)))
            {
                gameOverString += "##New highscore for ";
                {
                    if objMain.currPlayers<=1
                    {
                        gameOverString += "Single Player!#Your Score: " + string(global.highScore);
                        ini_open("sav");
                        ini_write_string("Game Data","HiScore",string(global.highScore));
                        ini_close();
                    }
                    else
                    {
                        gameOverString += "Multiplayer Co-Op!#Your Score: " + string(global.highCoScore);
                        ini_open("sav");
                        ini_write_string("Game Data","HiCoScore",string(global.highCoScore));
                        ini_close();
                    }
                }   
            }
            show_message(gameOverString);
                global.playerLives = 2;
                global.konCodeLimit = 3;
                global.playerScore = 0;
                game_restart();
