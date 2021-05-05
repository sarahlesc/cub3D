/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   shadow.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: slescure <slescure@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/05/03 18:19:23 by slescure          #+#    #+#             */
/*   Updated: 2021/05/03 18:42:06 by slescure         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../include/struct_cub3d.h"
#include "../../include/cub3d.h"

double	shadow_texture(double distance, char addr)
{
	double shadow;

	shadow = distance / 0.8;
	if (shadow < 1)
		shadow = 1;
	return ((addr & 0xff) / shadow);
}
