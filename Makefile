# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kesaitou <kesaitou@student.42tokyo.jp>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/10/18 16:54:22 by kesaitou          #+#    #+#              #
#    Updated: 2025/11/19 09:04:32 by kesaitou         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a
CC = cc
CFLAGS = -Wall -Werror -Wextra
AR = ar
ARFLAGS = rcs

LIBFTDIR = libft
LIBFT = $(LIBFTDIR)/libft.a

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

$(LIBFT):
	$(MAKE) -C $(LIBFTDIR)
	
$(NAME): $(OBJS) $(LIBFT)
	cp $(LIBFT) $(NAME)
	$(AR) $(ARFLAGS) $(NAME) $(OBJS)

%.o : %.c
	$(CC) $(CFLAGS) $(INCS) -c $< -o $@

clean:
	rm -f $(OBJS)
	$(MAKE) -C $(LIBFTDIR) clean

fclean: clean
	rm -f $(NAME) $(LIBFT)
	$(MAKE) -C $(LIBFTDIR) fclean

re: fclean all

.PHONY: all clean fclean re 
