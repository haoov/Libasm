#include "libasm.h"
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>
#include <unistd.h>

void print_list(t_list *list) {
	int i = 0;
	while (list) {
		printf("list elem %d data: %s\t next: %p\n", i, (char*)list->data, list->next);
		list = list->next;
		i++;
	}
}

int main() {
	int res = 0;

	//ft_strlen testing
	printf("FT_STRLEN:\n\n");
	printf("string: 'test'\t\tlen: %ld\n", ft_strlen("test"));
	printf("string: ''\t\tlen: %ld\n", ft_strlen(""));

	//ft_strcpy testing
	printf("\nFT_STRCPY:\n\n");
	char dest[5];
	printf("dest size = 5\n");
	ft_strcpy(dest, "test");
	printf("string: 'test'\t\tdest: '%s'\n", dest);
	ft_strcpy(dest, "");
	printf("string: ''\t\tdest: '%s'\n", dest);

	//ft_strcmp testing
	printf("\nFT_STRCMP:\n\n");
	int tripouille[42];
	int r = ft_strcmp("", "");
	tripouille[41] = 42;
	printf("string1: ''\tstring2: ''\tresult: %ld\n", ft_strcmp("", ""));
	printf("string1: 'test'\tstring2: 'test'\tresult: %ld\n", ft_strcmp("test", "test"));
	printf("string1: 'test'\tstring2: 'tes'\tresult: %ld\n", ft_strcmp("test", "tes"));
	printf("string1: 'tes'\tstring2: 'test'\tresult: %ld\n", ft_strcmp("tes", "test"));
	printf("string1: 'test'\tstring2: ''\tresult: %ld\n", ft_strcmp("test", "tesd"));

	//ft_write testing
	printf("\nFT_WRITE:\n\n");
	printf("call to ft_write(1, 'test\\n', 5)\n");
	printf("string: 'test\\n'\t\tresult: %ld\n", ft_write(1, "test\n", 5));
	printf("call to ft_write(6, 'test\\n', 4)\n");
	printf("string: 'test\\n'\t\tresult: %ld\n", ft_write(6, "test\n", 4));
	printf("errno = %d\n", errno);

	//ft_read testing
	printf("\nFT_READ:\n\n");
	char buf[6] = {0};
	printf("buf size = 6\tbuf = ''\n");
	printf("call to ft_read(0, buf, 5)\n");
	res = ft_read(0, buf, 5);
	printf("\nbuf: '%s'\t\t\tresult = %d\n", buf, res);
	printf("call to ft_read(6, buf, 5)\n");
	res = ft_read(6, buf, 5);
	printf("result = %d\terrno = %d\n", res, errno);

	//ft_strdup testing
	printf("\nFT_STRDUP:\n\n");
	char *str = ft_strdup("test");
	printf("string: 'test'\t\tresult: '%s'\n", str);
	free(str);
	str = ft_strdup("");
	printf("string: ''\t\tresult: '%s'\n", str);
	free(str);

	//ft_atoi_base testing
	printf("\nFT_ATOI_BASE:\n\n");
	printf("string: '501'\t\tbase: 'null'\t\tresult: %d\n", ft_atoi_base("10", NULL));
	printf("string: '  ++12'\tbase: '0123456789'\tresult: %d\n", ft_atoi_base(" ++12", "0123456789"));
	printf("string: '-12'\t\tbase: '0123456789'\tresult: %d\n", ft_atoi_base("-12", "0123456789"));
	printf("string: '11111111'\tbase: '01'\t\tresult: %d\n", ft_atoi_base("11111111", "01"));
	printf("string: '546567'\tbase: '+0123'\t\tresult: %d\n", ft_atoi_base("12", "+0123"));

	//ft_list_push_front testing
	printf("\nFT_LIST_PUSH_FRONT:\n\n");
	t_list *list = NULL;
	printf("call to ft_list_push front, data = '1test'\n");
	ft_list_push_front(&list, strdup("1test"));
	printf("call to ft_list_push_front, data = '2test'\n");
	ft_list_push_front(&list, strdup("2test"));
	printf("list state:\n");
	print_list(list);

	//ft_list_size testing
	printf("\nFT_LIST_SZIE:\n\n");
	printf("call to ft_list_push front, data = '1test'\n");
	ft_list_push_front(&list, strdup("1test"));
	printf("call to ft_list_push_front, data = '3test'\n");
	ft_list_push_front(&list, strdup("3test"));
	printf("list state:\n");
	print_list(list);
	printf("list size: %ld\n", ft_list_size(list));

	//ft_list_sort testing
	printf("\nFT_LIST_SORT:\n\n");
	ft_list_sort(&list, ft_strcmp);
	printf("list state:\n");
	print_list(list);

	//ft_list_remove_if testing
	printf("\nFT_LIST_REMOVE_IF:\n\n");
	printf("call to ft_list_remove_if, data_ref = '3test'\n");
	ft_list_remove_if(&list, "3test", ft_strcmp, free);
	printf("list state:\n");
	print_list(list);
	printf("call to ft_list_remove_if, data_ref = '1test'\n");
	ft_list_remove_if(&list, "1test", ft_strcmp, free);
	printf("list state:\n");
	print_list(list);
	printf("call to ft_list_remove_if, data_ref = '2test'\n");
	ft_list_remove_if(&list, "2test", ft_strcmp, free);
	printf("list state:\n");
	print_list(list);

	return (0);
}