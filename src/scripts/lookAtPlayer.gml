///This script helps enemy objects determine which player they should be looking at
var player1 = findPlayer(objPlayer1);

if (instance_exists(objPlayer2))
{
    var player2 = findPlayer(objPlayer2);
    
    switch(irandom(objMain.currPlayers))
    {
        default:
        case 0:
            target = player1;
            break;
        case 1:
            target = player2;
            break;
    }
}
else
{
    target = player1;
}
