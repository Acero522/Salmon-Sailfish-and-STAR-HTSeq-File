#include <iostream>
#include <fstream>
#include <string>
#include<iomanip>
using namespace std;
#define max 109
#define max2 27655

int main()
{
    ifstream myfile("D:\\newFo\\SRR8570506\\job4\\2.txt");
    ifstream myfile2("D:\\newFo\\SRR8570506\\job4\\complete.txt");
    ofstream outfile("D:\\newFo\\SRR8570506\\job4\\T.txt", ios::trunc);

    if (!myfile.is_open())
    {
	   cout << "can not open this file" << endl;
	   return 0;
    }
    string str[max];
    string str1[max];

    string str2[max2];
    double a1[max2];
    double a2[max2];
    double a3[max2];

    double b1[max];
    double b2[max];
    double b3[max];

    for (int i = 0; i < max; i++) {
	   myfile >> str[i];
	   myfile >> str1[i];
    }
    for (int i = 0; i < max2; i++) {
	   myfile2 >> str2[i];
	   myfile2 >> a1[i];
	   myfile2 >> a2[i];
	   myfile2 >> a3[i];
    }

    for (int i = 0; i < max; i++) {
	   for (int j = 0; j < max2; j++) {
		  if (str[i] == str2[j]) {
			 b1[i] = a1[j];
			 b2[i] = a2[j];
			 b3[i] = a3[j];
		  }
	   }
    }

    //将数据输出至out.txt文件中
    for (int i = 0; i < max; i++)
    {

	   outfile << fixed << setprecision(6) << str[i] << "    " << str1[i]<<"    " <<b1[i]  <<"    " << b2[i] << "    " << b3[i] << endl;
    }

    myfile.close();
    myfile2.close();
    outfile.close();
    return 0;
}

