# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: slescure <slescure@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/05/03 23:40:00 by slescure          #+#    #+#              #
#    Updated: 2021/05/03 23:40:01 by slescure         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #
NAME = cub3D

SRCS =  ./engine/parsing/check_map.c					\
		./engine/parsing/check_map2.c					\
		./engine/parsing/check_address.c				\
		./engine/parsing/manage_cub.c					\
		./engine/parsing/manage_errors.c				\
		./engine/parsing/parsing.c						\
		./engine/parsing/save_map.c					\
		./engine/parsing/save_params.c					\
		./engine/parsing/utils.c						\
		./engine/raycasting/raycasting.c				\
		./engine/raycasting/initialize_orientation.c	\
		./engine/raycasting/textures.c					\
		./engine/raycasting/sprites.c					\
		./engine/raycasting/sprites_utils.c			\
		./engine/raycasting/sprites_utils_2.c			\
		./engine/raycasting/textures_utils.c			\
		./engine//display/minilibx_keys.c				\
		./engine//display/movement_keys.c				\
		./engine//display/draw.c						\
		./engine//display/draw_utils.c					\
		./engine//display/handle_hook.c				\
		./engine//display/verif_initialize_param.c		\
		./engine/save/save.c							\
		./engine/save/save_utils.c						\
		./bonus/engine/health.c						\
		./bonus/engine/textures_on_ceiling_floor.c		\
		./bonus/engine/sound.c							\
		./bonus/engine/shadow.c						\
		./main.c


OBJS = $(SRCS:.c=.o)

CC  = gcc

FLAGS =   -L includes/minilibx-linux -lXext -lX11 -lm -lbsd
CFLAGS =  -Wall -Wextra -Werror
SAN = -g3 -fsanitize=address -O3
RM  = rm -f

BLACK		:= $(shell tput -Txterm setaf 0)
RED		:= $(shell tput -Txterm setaf 1)
GREEN		:= $(shell tput -Txterm setaf 2)
YELLOW		:= $(shell tput -Txterm setaf 3)
LIGHTPURPLE	:= $(shell tput -Txterm setaf 4)
PURPLE		:= $(shell tput -Txterm setaf 5)
BLUE		:= $(shell tput -Txterm setaf 6)
WHITE		:= $(shell tput -Txterm setaf 7)
RESET		:= $(shell tput -Txterm sgr0)

ifneq ("$(wildcard $(/libft/libft.a))","")
LIBFT_EXISTS = 1
else
LIBFT_EXISTS = 0
endif

ifneq ("$(wildcard $(/minilibx-linux/libmlx.a))","")
MLX_EXISTS = 1
else
MLX_EXISTS = 0
endif

$(NAME): $(OBJS)
	@echo "$(LIGHTPURPLE)Compilation...$(RESET)"
	if [ LIBFT_EXISTS=0 ]; then make -C libft; fi;
	@echo "$(PURPLE)Libft compiled$(RESET)"
	if [ MLX_EXISTS=0 ]; then make -C minilibx-linux; fi;
	@echo "$(PURPLE)Minilibx compiled$(RESET)"
	@(gcc -o $(NAME) -I include -I include/minilibx-linux $(SRCS) libft/libft.a minilibx-linux/libmlx.a $(FLAGS) $(CFLAGS))
	@echo "$(GREEN)Compilation OK$(RESET)"

all:  $(NAME)

clean:
	@echo "$(RED)Deleting objects$(RESET)"
	make clean -C libft
	make clean -C minilibx-linux
	@($(RM)	$(OBJS))

fclean:  clean
	@echo "$(RED)Deleting executables$(RESET)"
	@($(RM) $(NAME))

re: fclean all

san :
	@(gcc -o $(NAME) -I include -I include/minilibx-linux $(SRCS) libft/libft.a minilibx-linux/libmlx.a $(FLAGS) $(CFLAGS) $(SAN))

.PHONY: all clean fclean re
