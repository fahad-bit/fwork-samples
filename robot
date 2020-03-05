#include <vector>
#include <iostream>
#include <string>
#include <algorithm>
using namespace std;
string process(string const& s)
{
	// function to get instructions from the string where seperated by commas 
	string::size_type pos = s.find(',');
	if (pos != string::npos)
	{
		return s.substr(0, pos);
	}
	else
	{
		return s;
	}
}
int main()
{
	// declaratuion of variables and the arrays containing the instructions
	string check = "false";
	string s;
	string firstINS;
	string secondINS;
	string trimsecondINS;
	string thirdINS;
	string trimthirdINS;
	string object[] = { "orange","apple","car","bus","diamond" };
	string action[] = { "recognise","eat","see","lift","drop","fetch" };
	string time[] = { "1second","2second","5seconds","unlimited" };
	string move[] = { "left","right","forward","backward","stop" };
	string size[] = { "small","big","little","massive" };
	string location[] = { "door","kitchen","table" };

	cout << "\nEnter the instructions for Baxter the Robot seperated by commas only no spaces\n";// message for input instructions 
	cin >> s;
	int n = std::count(s.begin(), s.end(), ',');
	if (n!=1&& n != 2&& n != 3) // checking if the instructions are inputted with the commas only
	{
		cout << "Wrong Entry! Only input instructions with commas no spaces " << endl;
		cin.clear(); // if no commas or more commas found the input is cleared and ignored
		cin.ignore(1000,'\n');// upto thousna dcharaters ignored until new line 
		return main(); // returns to main
	}
	else
	{
		if (n == 2)  // if seperated by 2 commas means three instructions
		{
			firstINS = process(s); // gets the first instrction from string which is before the very first comma
			trimsecondINS = s.substr(firstINS.size() + 1, s.size() - 0); // trims the first instruction out of the original string
			secondINS = process(trimsecondINS); // gets the second instruction from the trimmed string 
			thirdINS = trimsecondINS.substr(secondINS.size() + 1, trimsecondINS.size() - 0); // trims the string again using the second instruction to get the final instruction 
			cout << "Instructions Entered: " << firstINS << " " << secondINS <<" "<<thirdINS<< endl; // prints out the instructions 
			for (int i = 5; i >= 0; i--) // for loop to go through all the elemets of the array and compare
			{
				if (firstINS == object[i]) // checks if the first instruction is from the the array object or not 
				{
					for (int i = 6; i >= 0; i--) // for loop to go through all the elemets of the array and compare
					{
						if (secondINS == action[i])// checks if the second instruction is from the the array action or not 
						{
							for (int i = 4; i >= 0; i--)// for loop to go through all the elemets of the array and compare
							{
								if (thirdINS == time[i])// checks if the third instruction is from the the array time or not
								{
									cout << "Instruction structure is Correct \nInstruction Structure: " << "<Object><Action><Time>" << endl; // prints out correct if all the instrctions are correct 
									check = "correct"; // variable check being assigned correct for being further used in code 
									//if it stays false then error message will be displayed that instrctions not matched 
								}
							}
						}
					}
				}
			}
			for (int i = 5; i >= 0; i--)// for loop to go through all the elemets of the array and compare
			{
				if (firstINS == object[i])// checks if the first instruction is from the the array object or not 
				{
					for (int i = 4; i >= 0; i--) // for loop to go through all the elemets of the array and compare
					{
						if (secondINS == size[i])// checks if the second instruction is from the the array size or not 
						{
							for (int i = 6; i >= 0; i--)// for loop to go through all the elemets of the array and compare
							{
								if (thirdINS == action[i])// checks if the third instruction is from the the array action or not 
								{
									cout << "Instruction structure is Correct \nInstruction Structure: " << "<Object><Size><Action>" << endl; // prints out correct if all the instrctions are correct
									check = "correct"; // variable check being assigned correct for being further used in code 
									//if it stays false then error message will be displayed that instrctions not matched 
								}
							}
						}
					}
				}
			}
			for (int i = 3; i >= 0; i--)// for loop to go through all the elemets of the array and compare
			{
				if (firstINS == location[i])// checks if the first instruction is from the the array location or not 
				{
					for (int i = 6; i >= 0; i--)// for loop to go through all the elemets of the array and compare
					{
						if (secondINS == action[i])// checks if the second instruction is from the the array action or not
						{
							for (int i = 5; i >= 0; i--)// for loop to go through all the elemets of the array and compare
							{
								if (thirdINS == object[i])// checks if the third instruction is from the the array object or not
								{
									cout << "Instruction structure is Correct \nInstruction Structure: " << "<Location><Action><Object>" << endl;// prints out correct if all the instrctions are correct
									check = "correct";// variable check being assigned correct for being further used in code 
									//if it stays false then error message will be displayed that instrctions not matched 
								}
							}
						}
					}
				}
			}
		}
		else if (n == 1) // if seperate dby one comma means 2 instructions
		{
			firstINS = process(s);// gets the first instrction from string which is before the very first comma
			secondINS = s.substr(firstINS.size() + 1, s.size() - 0);// trims the first instruction out of the original string and gets the second instruction
			cout << "Instructions Entered: " << firstINS << " " << secondINS << endl; // prints out the instructions 
				for (int i = 5; i >= 0; i--)// for loop to go through all the elemets of the array and compare
				{
					if (firstINS == move[i])// checks if the fisrt instruction is from the the array move or not
					{
						for (int i = 4; i >= 0; i--)// for loop to go through all the elemets of the array and compare
						{
							if (secondINS == time[i])// checks if the second instruction is from the the array time or not
							{
								cout << "Instruction structure is Correct \nInstruction Structure: " << "<Move><Time>" << endl;// prints out correct if all the instrctions are correct
								check = "correct";// variable check being assigned correct for being further used in code 
									//if it stays false then error message will be displayed that instrctions not matched 
							}
						}
					}
				}
		}
		else if (n == 3)// if seperate dby one comma means 4 instructions
		{
			firstINS = process(s);// gets the first instrction from string which is before the very first comma
			trimsecondINS = s.substr(firstINS.size() + 1, s.size() - 0);// trims the first instruction out of the original string
			secondINS = process(trimsecondINS); // gets the second instruction from the trimmed string 
			trimthirdINS = trimsecondINS.substr(secondINS.size() + 1, trimsecondINS.size() - 0); // trims the string again using the second instruction
			thirdINS = process(trimthirdINS);// // gets the third instruction from the trimmed string 
			string fourthINS = trimthirdINS.substr(thirdINS.size() + 1, trimthirdINS.size() - 0); // trims the string again using the third instruction to get the final instruction 
			cout << "Instructions Entered: " << firstINS << " " << secondINS << " " << thirdINS <<" "<<fourthINS<<endl; // prints out the instructions 
			for (int i = 5; i >= 0; i--) // for loop to go through all the elemets of the array and compare
			{
				if (firstINS == move[i])// checks if the fisrt instruction is from the the array move or not
				{
					for (int i = 4; i >= 0; i--) // for loop to go through all the elemets of the array and compare
					{
						if (secondINS == time[i])// checks if the second instruction is from the the array time or not
						{
							for (int i = 5; i >= 0; i--)// for loop to go through all the elemets of the array and compare
							{
								if (thirdINS== move[i])// checks if the third instruction is from the the array move or not
								{
									for (int i = 4; i >= 0; i--)// for loop to go through all the elemets of the array and compare
									{
										if (fourthINS== time[i]) // checks if the fourth instruction is from the the array time or not
										{
											cout << "Instruction structure is Correct \nInstruction Structure: " << "<Move><Time><Move><Time>" << endl; // prints out correct if all the instrctions are correct
											check = "true";// variable check being assigned correct for being further used in code 
									//if it stays false then error message will be displayed that instrctions not matched 
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}

	if (check == "false") // checks if check is still false or changed to correct 
	{      // if its still false the no instructions were matched means the input might be wrong so displays this message 
		cout << "Cannot recognise Instruction \nThe Correct Instruction Structures are:\n" << "<Move><Time><Move><Time>\n<Move><Time>\n<Object><Size><Action>\n<Location><Action><Object>\n<Object><Action><Time>" << endl;
		return main(); // returns to main
	}

	char y;
	cout << "\nDo you want to input Another Instruction? Enter 'Y' for yes and any Character to exit." << endl;// prints to ask if want to re-run the program
	cin >> y;
	while (y == 'Y' || y == 'y') // keeps re running the program until you keep entring y if you enter any other letter program ends 
	{
		return main(); // returns to main 
	}
	return 0; // end of program
}
