#include <iostream>
#include <fstream>
#include <string>
#include<iomanip>
using namespace std;
#define max 27655
#define max2 33323

int main()
{
    ifstream myfile("D:\\newFo\\SRR8570506\\job2\\complete.txt");
    ifstream myfile2("D:\\newFo\\SRR8570506\\job2\\control2.txt");
    ofstream outfile("D:\\newFo\\SRR8570506\\job2\\T.txt", ios::trunc);

    if (!myfile.is_open())
    {
	   cout << "can not open this file" << endl;
	   return 0;
    }
    string str[max];
    string str2[max2];
    double a[max];
    double a2[max2];

    for (int i = 0; i < max; i++) {
	   myfile >> str[i];
    }
    for (int i = 0; i < max2; i++) {
	   myfile2 >> str2[i];
	   myfile2 >> a2[i];
    }
    
    for (int i = 0; i < max; i++) {
	   for (int j = 0; j < max2; j++) {
		  if (str[i] == str2[j]) {
			 a[i] = a2[j];
		  }
		  else {

		  }
	   }
    }

    //将数据输出至out.txt文件中
    for (int i = 0; i < max; i++)
    {	  
	   outfile << fixed << setprecision(6) << str[i] << "    " << a[i] << endl;
    }

    myfile.close();
    myfile2.close();
    outfile.close();
    return 0;
}

