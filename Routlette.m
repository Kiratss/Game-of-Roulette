%Aim - To create a game of roulette which runs 10 games and tells the user
%how much they spent and earned in tota (profit or loss).
clc;
clear all;

%Assigning variables to audio files for use during the run of the game.
IntroSound = audioread("music.mp3");
Spinner = audioread("Spinning sound.mp3");
OutroSound = audioread("music.mp3");

%Using first audio file
soundsc(IntroSound, 44100);
%Main menu screen of the game.
fprintf ('Welcome to the game of Roulette.\n'); 
disp(" ");
gamePlayerName = input("Please enter your name: " ,"s");
disp(" ");

%Assigning vectors which contains numbers assigned to colors on the
%roulette spinner. 
Red=[1,3,5,7,9,12,14,16,18,19,21,23,25,27,30,32,34,36];
Black=[2,4,6,8,10,11,13,15,17,20,22,24,26,28,29,31,33,35];
Green =[0];

%Introducing to the game of roulette and explaining the rules. 
disp ("Hello there " + gamePlayerName + "!");
%Using pauses in order for the music to play.
pause (2)
disp(" ");
fprintf ('Welcome to the game of Roulette. There will be 10 games in total. \n');
pause (2)
disp(" ");
fprintf ('There are 3 colors, Red, Black and Green. You can choose to use or not use the green slots before game starts.\n');
disp(" ");
pause (2)
%Displaying the values of the spinner for each color: Red, Black and Green
%Reference - https://au.mathworks.com/matlabcentral/answers/423743-how-to-use-fprintf-to-display-vector
fprintf ('The numbers are as follows for the following colors: Red - [');
fprintf ('%g ', Red);
fprintf ('] \n');
fprintf ('Black - [');
fprintf ('%g ', Black);
fprintf ('] \n');
fprintf ('Green - [');
fprintf ('%g ', Green);
fprintf ('] \n');
disp(" ");
pause (2)
fprintf ('At the end of the games, you will find out how much money you spent and have in total. Enjoy! \n');

%Assigning empty vectors so that values can be stored and used later
%towards the end.
spinnerNumber = [];
spinnerColour = [];
userColour = [];
gameBank = [];
userBet = [];
userFinal = [];
disp (" ");

%Allowing user to choose whether they want to have green slots (number 0).
gameChoose = input ("Do you want to allow green slots (0=No, 1=Yes)? ");
disp (" ");

%If user chose to allow the usage of green slots.
if gameChoose == 1
    %Using a for loop in order for the games to run 10 times.
    for i = 1:10 
        %Allowing user to input how much they want to bet.Bank starts at $0
        %and changes after they bet and if they win/lose.
        userBet(i) = input ("Please enter how much money would you like to bet: ");
        %Letting the user choose what number they want to bet on. 
        userNumber = input("Please input a number between 0 and 36: ");
        %Randi function generates number between 0 and 36. 
        spinnerNumber = randi([0, 36]);
        %Sound added for roulette spinner effect.
        soundsc(Spinner, 44100);
        pause (3)
        disp ("Please wait for the spinner to generate the number.");
        pause (3)
        %Displaying the number generated from the spinner.
        disp ("The number generated from the spinner is: " + spinnerNumber);
        pause (2)
    %Using strfind if the color and spinnerNumber is not equal to 0      
    if strfind(Black,spinnerNumber) ~= 0
        spinnerColour = "Black";
    elseif strfind(Red,spinnerNumber) ~= 0
        spinnerColour = "Red";
    elseif strfind(Green,spinnerNumber) ~= 0
        spinnerColour = "Green";
    end
    
    %Using strfind if the color and userNumber is not equal to 0  
    if strfind(Black,userNumber) ~= 0
        userColour = "Black";
    elseif strfind(Red,userNumber) ~= 0
        userColour = "Red";
    elseif strfind(Green,userNumber) ~= 0
        userColour = "Green";
    end
    
    %Setting odds for every game the player wins or loses.
    if userNumber == spinnerNumber
        gameBank(i) = (userBet(i) * 2);
        disp ("You won $" + userBet(i) * 2);
        disp (" ");
    elseif userColour == spinnerColour & userNumber ~= spinnerNumber
        gameBank(i) = (userBet(i) * 1.5);
        disp ("You won $" + userBet(i) * 1.5);
        disp (" ");
    else
        disp ("You lost $" + userBet(i));
        disp (" ");
end
    end
%If user chose to not allow the usage of green slots.
elseif gameChoose == 0
    %Using a for loop in order for the games to run 10 times.
    for i = 1:10 
        %Allowing user to input how much they want to bet.Bank starts at $0
        %and changes after they bet and if they win/lose.
        userBet(i) = input ("Please enter how much money would you like to bet: ");
        %Letting the user choose what number they want to bet on. 
        userNumber = input("Please input a number between 1 and 36: ");
        %Randi function generates number between 1 and 36.
        spinnerNumber = randi([1, 36]);
        %Sound added for roulette spinner effect.
        soundsc(Spinner, 44100);
        pause (3)
        disp ("Please wait for the spinner to generate the number.");
        pause (3)
        %Displaying the number generated from the spinner.
        disp ("The number generated from the spinner is: " + spinnerNumber);
        pause (2)
        
    %Using strfind if the color and spinnerNumber is not equal to 0 
    if strfind(Black,spinnerNumber) ~= 0
        spinnerColour = "Black";
    elseif strfind(Red,spinnerNumber) ~= 0
        spinnerColour = "Red";
    end
    
    %Using strfind if the color and userNumber is not equal to 0 
    if strfind(Black,userNumber) ~= 0
        userColour = "Black";
    elseif strfind(Red,userNumber) ~= 0
        userColour = "Red";
    end
    
    %Setting odds for every game the player wins or loses.
    if userNumber == spinnerNumber
        gameBank(i) = (userBet(i) * 2);
        disp ("You won $" + userBet(i) * 2);
        disp (" ");
    elseif userColour == spinnerColour && userNumber ~= spinnerNumber
        gameBank(i) = (userBet(i) * 1.5);
        disp ("You won $" + userBet(i) * 1.5);
        disp (" ");
    else
        disp ("You lost $" + userBet(i));
        disp (" ");
    end
end
end

%Using final audio file
soundsc(OutroSound, 44100);
%Calculating the final amount of money user has.
userFinal = sum(gameBank) - sum(userBet);
%Display functions to display total bet and profit amount. 
disp ("You placed bets of $" + sum(userBet) + ".");
disp ("You had total profits of $" + sum(gameBank) + ".");
%Dislaying how much money the user has or lost.
disp ("You have $" + userFinal + " in total.");