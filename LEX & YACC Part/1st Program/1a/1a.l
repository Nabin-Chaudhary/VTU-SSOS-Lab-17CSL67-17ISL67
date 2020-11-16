%{
#include<stdio.h>
#include<string.h>
int noprt=0, nopnd=0,valid=1,top=-1,l=0,j=0,m=0;
char opnd[10][10],oprt[10][10],a[100];
%}
%%
"(" {top++;a[top]='(';}
")" {if (a[top]!='(') { valid=0; return 0;}
else
top--;
}
"+" {noprt++;
strcpy(oprt[l],yytext);
l++;}
"*" {noprt++;
strcpy(oprt[m],yytext);
m++;}
[0-9]+ {nopnd++;strcpy(opnd[j],yytext);
j++;}
%%
int main()
{
int k;
printf("Enter the arithmetic expression: ");
yylex();
if(valid==1 && top==-1 && (nopnd-noprt)==1)
{
printf("\nvalid arithmetic expression\n");
printf("The number of addition operators are %d\n",l);
printf("The number of mul operators are %d\n",m);
printf("The number of operands are %d\n",j);
for(k=0;k<j;k++)
printf("%s \n",opnd[k]);
}
else
printf("the expression is invalid\n");
}
int yywrap()
{
return 1;}
