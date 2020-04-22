#include <iostream>
#include <fstream>
#include <string>
#include<iomanip>
using namespace std;
#define max 27655
#define max2 27270

int main()
{   
     ifstream myfile("D:\\newFo\\DRR016125\\outSailfish.txt");
	ifstream myfile2("D:\\newFo\\DRR016125\\outSTAR.txt");
	ofstream outfile("D:\\newFo\\DRR016125\\STARFull.txt", ios::trunc);

	if (!myfile.is_open())
	{
	    cout << "can not open this file" << endl;
	    return 0;
	}
	string str[max];
	string str2[max];
	double a[max];
	double a2[max];
	
	for (int i = 0; i < max; i++) {
	    myfile >> str[i];
	    myfile >> a[i];

	}
	for (int i = 0; i < max2; i++) {
	    myfile2 >> str2[i];
	    myfile2 >> a2[i];

	}
	int tail = max2;
	int count = 0;
	
	for (int i = 0; i < max; i++) 
	{
	    	    
	    for (int j = 0; j < max2; j++) 
	    {
		   if (str[i] == str2[j]) 
		   {
			  count++;
			  break;
		   }
	    }
	    if (count == 0) {
		   str2[tail] = str[i];
		   a2[tail] = 0;
		   tail++;
	   }
	   count = 0;
	}

	
	//将数据输出至out.txt文件中
	for (int i = 0; i < max; i++)
	{
	    if (str[i] == "0") {			//str为0则不写入文件
	    }
	    else {
		   outfile <<fixed<<setprecision(6) << str2[i] <<"    "<<a2[i]<< endl;
	    }
	}

	myfile.close();
	myfile2.close();
	outfile.close();
     return 0;
}

