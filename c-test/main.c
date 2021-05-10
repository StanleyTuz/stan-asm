

void strcpy2(char x[], char y[])
{
	int i;

	i = 0;
	while((x[i] = y[i]) != '\0')
		i+=1;
}

int main()
{
	char *x = "hello";
	char *y;
	
	strcpy2(x, y);
}
