%program1.m
%
%Author: Michael Moloney
%Account: mmoloney1@student.gsu.edu
%CSC 4630/6630 Program #1
%
%Due date: September 20, 2018
%
%Description:
%Proram 1 gives the user the option to convert a number from
%celsius to farenheit or farenheit to celsius. The program will continue to
%run until the user decides to quit.
%Input:
%Menu choices(c, f, or q. any other input is locked out). Number to convert
%(user's choice, but anything other than a number is locked out).
%
%Output:
%Celsius or farenheit conversion
%
%Usage:
%Example: 'c' for farenheit to celsius. 70 as user input. '70 degrees 
%ferenheit converts to 21.11 degrees celsius.' as output.

%Main Program:
%The whileCheck variable is used in a whileloop to continuously run the 
%program until the user decides to quit.
whileCheck = true;
while whileCheck == true
%main menu outputs:
    disp('Press C to convert fahrenheit to celsius.');
    disp('Press F to convert celsius to fahrenheit.');
    disp('Press Q to quit program.');
%This whileCheck2 variable is used in a second while loop to continually
%prompt the user for the correct input until a valid input is recieved.
    whileCheck2 = true;
    while whileCheck2 == true
%User input is collected for main menu choice.
        userIn = input('Please enter your choice: ','s');
%A combination of else/if and try/catch are used to insure the proper input
%for the main menu is recieved. Input can be either capital or lowercase.
%Once the proper input is recieved, the corresponding function is called,
%and the whileCheck2 variable is updated to exit the whileloop
        try
            if userIn == 'c' || userIn == 'C'
                farToCel()
                whileCheck2 = false;
            elseif userIn == 'f' || userIn == 'F'
                celToFar()
                whileCheck2 = false;
%For 'Q' both whileCheck variables are assigned false to exit the program.                
            elseif userIn == 'q' || userIn == 'Q'
                disp('Quitting');
                whileCheck2 = false;                
                whileCheck = false;
            else
                disp('Input must be C, F, or Q. ');
            end
        catch wronginput
            disp('Input must be C, F, or Q. ');
        end
    end
end
%Function 1:
%this function converts fahrenheit to celsius.
%Input:
%user input is assigned to variable x. Expected input is a number.
%Output:
%The original input and celcius conversion are displayed.
function farToCel()
%Any unauthorized variable assignments will default x to a character. This
%will advance the function to the while loop that continues until the
%proper input is recieved.
try
    x = input('Enter fahrenheit degree to be converted to celsius: ');
catch
    x = 'c';
end
%This while loop will continually request input until it recieves no more
%than one float number
while (isfloat(x) ~= 1 || length(x) ~= 1)
%Try/catch is used again to prevent invalid variables such as asdfr223 or
%inputs with spaces such as 44 44 44
    try
        x = input('Input must be a single number. Enter fahrenheit degree to be converted to celsius: ');
    catch
        x= 'c';
    end
end
%After the while loop the acutal fahrenheit to celsius equation is applied
%to variable x and saved to variable y
y = (x-32)*5/9;
%The outcome is printed.
fprintf('%8.2f degrees Fahrenheit converts to %10.2f degrees Celsius.\n',x,y);
end

%Function 2:
%This function converts celsius to farhenheit.
%This function operates in the same fashion as Function 1 with the only
%difference being the equation used for the conversion and the wording of
%the input prompt and output display.
function celToFar()
try
%Input prompt requests fahrenheit.
    x = input('Enter fahrenheit degree to be converted to celsius: ');
catch
    x = 'c';
end
while (isfloat(x) ~= 1 || length(x) ~= 1)
    try
        x = input('Input must be a single number. Enter celcius degree to be converted to fahrenheit: ');
    catch
        x = 'c';
    end
end
y = x*9/5+32;
%Output display reads celsius to fahrenheit.
fprintf('%8.2f degrees Celsius converts to %10.2f degrees Fahrenheit.\n',x,y);
end
%
%Note:
%this program handles complex numbers as is. It will take the complex
%numbers as input and provide an output.