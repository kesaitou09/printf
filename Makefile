# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kesaitou <kesaitou@student.42tokyo.jp>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/10/18 16:54:22 by kesaitou          #+#    #+#              #
#    Updated: 2025/11/12 20:44:15 by kesaitou         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a
CC = cc
CFLAGS = -Wall -Werror -Wextra
AR = ar
ARFLAGS = rcs


MAND_SRCS = \
	    ft_printf.c\
		libft_utils.c\
		uxx_helper.c\
		parse.c\
		print_csper.c\
		print_di.c\
		print_uxx.c\
		print_p.c\
		print.c\
		utils.c\

OBJS = $(MAND_SRCS:.c=.o)
all : $(NAME)

$(NAME): $(OBJS)
	$(AR) $(ARFLAGS) $(NAME) $(OBJS)

bonus:all

%.o : %.c
	$(CC) $(CFLAGS) $(INCS) -c $< -o $@

clean:
	rm -f $(OBJS)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re
