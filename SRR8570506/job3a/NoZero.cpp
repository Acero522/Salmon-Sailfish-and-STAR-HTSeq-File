#include <iostream>
#include <fstream>
#include <string>
#include<iomanip>
using namespace std;
#define max 27655

int main()
{
    ifstream myfile("D:\\newFo\\SRR8570506\\job2\\TPMcontrol3.txt");
    ofstream outfile("D:\\newFo\\SRR8570506\\job2\\T3.txt", ios::trunc);

    if (!myfile.is_open())
    {
	   cout << "can not open this file" << endl;
	   return 0;
    }
    string str[max];
   
    double a1[max];
    double a2[max];
    double a3[max];
    double a4[max];
    double mark[max];
  

    for (int i = 0; i < max; i++) {
	   myfile >> str[i];
	   myfile >> a1[i];
	   myfile >> a2[i];
	   myfile >> a3[i];
	   myfile >> a4[i];
    }
 
    
    for (int i = 0; i < max; i++) {
	   if (a1[i]==0||a2[i]==0|| a3[i] == 0|| a3[i] == 0){
		  mark[i] = 0;
	   }
	   else {

	   }
    }

    //将数据输出至out.txt文件中
    for (int i = 0; i < max; i++)
    {
	   if (mark[i] != 0) {
		  outfile << fixed << setprecision(6) << str[i] << "    " << a1[i] << "    "<<a2[i]<< "    "<<a3[i]<< "    "<<a4[i]<<endl;
	   }
    }

    myfile.close();
    outfile.close();
    return 0;
}


