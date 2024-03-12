#ifndef LIBSAM_H
#define LIBSAM_H

#include <stdio.h>

typedef unsigned long s_size_t;

typedef struct s_list
{
	void *data;
	struct s_list *next;
} t_list;

size_t		ft_strlen(const char *str);
char		*ft_strcpy(char *dest, const char *src);
s_size_t	ft_strcmp(const char *s1, const char *s2);
s_size_t	ft_write(int fd, const void *buf, size_t nbyte);
s_size_t	ft_read(int fd, char *buf, size_t nbyte);
char		*ft_strdup(const char *str);

int			ft_atoi_base(const char *str, const char *base);
void		ft_list_push_front(t_list **begin_list, void *data);
size_t		ft_list_size(t_list *begin_list);
void		ft_list_sort(t_list **begin_list, s_size_t (*cmp)());
void		ft_list_remove_if(t_list **begin_list, void *data_ref, s_size_t (*cmp)(), void (*free_fct)());

#endif