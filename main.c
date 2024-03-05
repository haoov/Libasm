#include "libasm.h"
#include <stdio.h>
#include <errno.h>

int main() {
	//ft_strlen testing
	printf("ft_strlen:\n");
	printf("string: 'test'\t\tlen: %ld\n", ft_strlen("test"));
	printf("string: ''\t\tlen: %ld\n", ft_strlen(""));

	//ft_strcpy testing
	printf("\nft_strcpy:\n");
	char dest[5];
	printf("dest size = 5\n");
	ft_strcpy(dest, "test");
	printf("string: 'test'\t\tdest: '%s'\n", dest);
	ft_strcpy(dest, "");
	printf("string: ''\t\tdest: '%s'\n", dest);

	//ft_strcmp testing
	printf("\nft_strcmp:\n");
	printf("string1: 'test'\tstring2: 'test'\tresult: %ld\n", ft_strcmp("test", "test"));
	printf("string1: 'test'\tstring2: 'tes'\tresult: %ld\n", ft_strcmp("test", "tes"));
	printf("string1: 'tes'\tstring2: 'test'\tresult: %ld\n", ft_strcmp("tes", "test"));
	printf("string1: 'test'\tstring2: ''\tresult: %ld\n", ft_strcmp("test", "tesd"));

	//ft_write testing
	printf("\nft_write:\n");
	printf("string: 'test\\n'\t\tresult: %ld\n", ft_write(1, "test\n", 5));
	printf("string: 'test\\n'\t\tresult: %ld\n", ft_write(6, "test\n", 4));
	printf("errno = %d\n", errno);
	return (0);
}