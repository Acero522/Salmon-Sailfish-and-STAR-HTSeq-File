#include <iostream>
#include <fstream>
#include <string>
#include<iomanip>
using namespace std;
#define Max 48268

int main()
{   
     ifstream myfile("D:\\newFo\\DRR016127\\salmon_quant\\TPM2.txt");
	ofstream outfile("D:\\newFo\\DRR016127\\salmon_quant\\out.txt", ios::trunc);

	if (!myfile.is_open())
	{
	    cout << "can not open this file" << endl;
	    return 0;
	}
	string str[Max];
	double a[Max];
	
	for (int i = 0; i < Max; i++)
	{		   
	    	   myfile >> str[i];

		   myfile >> a[i];

		   if (str[i] == str[i - 1]) 
		   {
			  a[i] += a[i - 1]; //str和前一项一样则和i-1的int相加
			  a[i - 1] = 0;	//前一项int和str归0；
			  str[i - 1] = "0";	 
		   }
	}
	
	//将数据输出至out.txt文件中
	for (int i = 0; i < Max; i++)
	{
	    if (str[i] == "0") {			//str为0则不写入文件
	    }
	    else {
		   outfile <<fixed<<setprecision(6) << str[i] << "    " << a[i] << "    " << endl;
	    }
	}

	myfile.close();
	outfile.close();
     return 0;
}

