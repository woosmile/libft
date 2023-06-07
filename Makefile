NAME = libft.a

CC = cc
CFLAGS = -Werror -Wall -Wextra

AR = ar
ARFLAGS = rcs

RM = rm
RMFLAGS = -rf

MANDATORY_SRCS = \
ft_atoi.c \
ft_bzero.c \
ft_calloc.c \
ft_isalnum.c \
ft_isalpha.c \
ft_isascii.c \
ft_isdigit.c \
ft_isprint.c \
ft_itoa.c \
ft_memchr.c \
ft_memcmp.c \
ft_memcpy.c \
ft_memmove.c \
ft_memset.c \
ft_putchar_fd.c \
ft_putendl_fd.c \
ft_putnbr_fd.c \
ft_putstr_fd.c \
ft_split.c \
ft_strchr.c \
ft_strdup.c \
ft_striteri.c \
ft_strjoin.c \
ft_strlcat.c \
ft_strlcpy.c \
ft_strlen.c \
ft_strmapi.c \
ft_strnstr.c \
ft_strrchr.c \
ft_strtrim.c \
ft_substr.c \
ft_tolower.c \
ft_toupper.c \
ft_strncmp.c
MANDATORY_OBJS = $(MANDATORY_SRCS:.c=.o)

BONUS_SRCS = \
ft_lstadd_back_bonus.c \
ft_lstadd_front_bonus.c \
ft_lstclear_bonus.c \
ft_lstdelone_bonus.c \
ft_lstiter_bonus.c \
ft_lstlast_bonus.c \
ft_lstmap_bonus.c \
ft_lstnew_bonus.c \
ft_lstsize_bonus.c
BONUS_OBJS = $(BONUS_SRCS:.c=.o)

ifdef WITH_BONUS
	FINAL_OBJS = $(MANDATORY_OBJS) $(BONUS_OBJS)
else
	FINAL_OBJS = $(MANDATORY_OBJS)
endif

all : $(NAME)

bonus : 
	make WITH_BONUS=1 all

$(NAME) : $(FINAL_OBJS)
	$(AR) $(ARFLAGS) $@ $^

$(MANDATORY_OBJS) : $(MANDATORY_SRCS)
	$(CC) $(CFLAGS) -c $(MANDATORY_SRCS)
$(BONUS_OBJS) : $(MANDATORY_SRCS) $(BONUS_SRCS)
	$(CC) $(CFLAGS) -c $(BONUS_SRCS)

clean :
	$(RM) $(RMFLAGS) $(MANDATORY_OBJS)
	$(RM) $(RMFLAGS) $(BONUS_OBJS)
fclean : clean
	$(RM) $(RMFLAGS) $(NAME)
re : fclean all

.PHONY : all bonus clean fclean re