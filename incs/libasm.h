#ifndef LIBSAM_H
#define LIBSAM_H

__SIZE_TYPE__ ft_strlen(const char *str);
char *ft_strcpy(char *dest, const char *src);
__SIZE_TYPE__ ft_strcmp(const char *s1, const char *s2);
__SIZE_TYPE__ ft_write(int fd, const char *buf, __SIZE_TYPE__ nbyte);
__SIZE_TYPE__ ft_read(int fd, char *buf, __SIZE_TYPE__ nbyte);
char *ft_strdup(const char *str);

#endif