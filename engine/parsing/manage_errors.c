/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   manage_errors.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: slescure <slescure@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/05/03 18:19:38 by slescure          #+#    #+#             */
/*   Updated: 2021/05/04 17:19:29 by slescure         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../include/cub3d.h"
#include "../../include/struct_cub3d.h"

void	print_error(t_param *param, char *str)
{
	printf("Error\n");
	printf("%s\n", str);
	free_address_params(param);
	exit(0);
}

int		print_error_2(t_param *param, char *str)
{
	int return_value;

	printf("Error\n");
	printf("%s\n", str);
	free_address_params(param);
	return_value = system("killall -9 aplay");
	exit(0);
	return (return_value);
}

int		manage_errors(int argc, char **argv, t_param *param)
{
	if (argc != 2 && argc != 3)
		print_error(param, "Wrong number of arguments");
	if (argc == 3 && ft_strncmp(argv[2], "--save", ft_strlen(argv[2])) != 0)
		print_error(param, "Wrong third argument");
	file_is_cub(argv[1], param);
	return (0);
}

int		file_is_cub(char *str, t_param *param)
{
	int		i;

	i = 0;
	while (str[i] != '.')
		i++;
	i++;
	if (str[i] == 'c' && str[i + 1] == 'u' && str[i + 2] == 'b'
			&& str[i + 3] == '\0')
		return (1);
	else
		print_error(param, "Wrong format of file");
	return (0);
}
