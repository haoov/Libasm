#include "libasm.h"
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>

int main() {
	int res = 0;

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

	//ft_read testing
	printf("\nft_read:\n");
	char buf[5];
	printf("buf size = 5\tbuf = ''\n");
	printf("call to ft_read(0, buf, 5)\n");
	res = ft_read(0, buf, 5);
	printf("buf: '%s'\t\t\tresult = %d\n", buf, res);
	printf("call to ft_read(6, buf, 5)\n");
	res = ft_read(6, buf, 5);
	printf("result = %d\terrno = %d\n", res, errno);

	//ft_strdup testing
	printf("\nft_strdup:\n");
	char *str = ft_strdup("test");
	printf("string: 'test'\t\tresult: '%s'\n", str);
	printf("string: ''\t\tresult: '%s'\n", ft_strdup(""));
	free(str);

	//ft_atoi_base testing
	printf("\nft_atoi_base:\n");
	printf("string: '  ++12'\tbase: '0123456789'\tresult: %d\n", ft_atoi_base("12", "0123456789"));
	printf("string: '-12'\t\tbase: '0123456789'\tresult: %d\n", ft_atoi_base("-12", "0123456789"));
	printf("string: '11111111'\tbase: '01'\t\tresult: %d\n", ft_atoi_base("11111111", "01"));
	printf("string: '546567'\tbase: '+0123'\t\tresult: %d\n", ft_atoi_base("12", "+0123"));

	//ft_list_push_front testing
	printf("\nft_list_push_front:\n");
	t_list *list = NULL;
	ft_list_push_front(&list, "2test");
	printf("list->data: '%s'\t\tlist->next: %p\n", (char*)list->data, list->next);
	ft_list_push_front(&list, "1test");
	printf("list->data: '%s'\t\tlist->next: %p\n", (char*)list->data, list->next);
	printf("list->next->data: '%s'\tlist->next->next: %p\n", (char*)list->next->data, list->next->next);

	//ft_list_size testing
	printf("\nft_list_size:\n");
	printf("list size: %ld\n", ft_list_size(list));

	//ft_list_sort testing
	printf("\nft_list_sort:\n");
	ft_list_sort(&list, ft_strcmp);
	printf("list->data: '%s'\t\tlist->next->data: %s\n", (char*)list->data, (char*)list->next->data);

	return (0);
}