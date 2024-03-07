#ifndef LIBSAM_H
#define LIBSAM_H

typedef struct s_list
{
	void *data;
	struct s_list *next;
} t_list;

__SIZE_TYPE__ ft_strlen(const char *str);
char *ft_strcpy(char *dest, const char *src);
__SIZE_TYPE__ ft_strcmp(const char *s1, const char *s2);
__SIZE_TYPE__ ft_write(int fd, const char *buf, __SIZE_TYPE__ nbyte);
__SIZE_TYPE__ ft_read(int fd, char *buf, __SIZE_TYPE__ nbyte);
char *ft_strdup(const char *str);

int ft_atoi_base(const char *str, const char *base);
void ft_list_push_front(t_list **begin_list, void *data);
__SIZE_TYPE__ ft_list_size(t_list *begin_list);
void ft_list_sort(t_list **begin_list, __SIZE_TYPE__ (*cmp)());

#endif