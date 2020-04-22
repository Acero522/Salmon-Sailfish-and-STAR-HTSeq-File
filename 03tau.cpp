#include <iostream>
#include <fstream>
#include <string>
#include<iomanip>
using namespace std;
#define max 27655
#define tau 2      //阈值


int main()
{   
     ifstream myfile("D:\\newFo\\SRR8570506\\complete.txt");
	ofstream outfile("D:\\newFo\\SRR8570506\\biao.txt", ios::trunc);

	if (!myfile.is_open())
	{
	    cout << "can not open this file" << endl;
	    return 0;
	}
	string str[max];
	double a[max];
	double b[max];
	double c[max];	    
	
	for (int i = 0; i < max; i++) {
	    myfile >> str[i];
	    myfile >> a[i];
	    myfile >> b[i];
	    myfile >> c[i];
	}

	for (int i = 0; i < max; i++)
	{
	    if (log2(a[i] / b[i]) > tau || log2(b[i] / a[i]) > tau || log2(a[i] / c[i]) > tau || log2(c[i] / a[i]) > tau || log2(b[i] / c[i]) > tau || log2(c[i] / b[i]) > tau)
	    {
		   if (a[i]!=0&&b[i]!=0&&c[i]!=0)
		   {
			  outfile <<fixed<< setprecision(6) << str[i] << "             " << a[i] << "             " << b[i] << "             " << c[i] << endl;
		   }
	    }
	}
	myfile.close();
	outfile.close();
     return 0;
}

