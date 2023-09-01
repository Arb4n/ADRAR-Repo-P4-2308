import pass_un_j from '../assets/pass_un_j.jpg'
import pass_deux_j from '../assets/pass_deux_j.jpg'
import pass_trois_j from '../assets/pass_trois_j.jpg'
import pass_trois_jours_bivouac from '../assets/pass_trois_jours_bivouac.jpg'
import pass_quatre_jours_bivouac from '../assets/pass_quatre_jours_bivouac.jpg'
import pass_deux_jours_bivouac from '../assets/pass_deux_jours_bivouac.jpg'

export const passesList = [
	{
		name: 'Pass 1 jour',
		category: 'Scène',
		id: '1ed',
		bestSale: true,
		light: 1,
		moon: 0,
		cover: pass_un_j,
		price: 35
	},
	{
		name: 'Pass 2 jours',
		category: 'Scène',
		id: '2ab',
		light: 2,
		moon: 0,
		cover: pass_deux_j,
		price: 55
	},

	{
		name: 'Pass 3 Jours',
		category: 'Scène',
		id: '3sd',
		light: 1,
		moon: 0,
		cover: pass_trois_j,

		price: 75
	},


	
	{
		name: 'Pass 2 Jours + Bivouac',
		category: 'Scène + Bivouac',
		id: '4kk',
		light: 2,
		moon: 1,
		cover: pass_deux_jours_bivouac,

		price: 75
	},
	{
		name: 'Pass 3 Jours + Bivouac',
		category: 'Scène + Bivouac',
		id: '5pl',
		light: 3,
		moon: 2,
		cover: pass_trois_jours_bivouac,
		price: 95
	},

	
	{
		name: 'Pass 4 Jours + Bivouac',
		category: 'Scène + Bivouac',
		id: '7ie',
		bestSale: true,
		light: 2,
		moon: 3,
		cover: pass_quatre_jours_bivouac,
		price: 125
	},
	
	
	
	// {
	// 	name: 'succulente',
	// 	category: 'plante grasse',
	// 	id: '9vn',
	// 	light: 2,
	// 	moon: 1,
	// 	cover: succulent,
	// 	price: 8
	// },

	// {
	// 	name: 'menthe',
	// 	category: 'extérieur',
	// 	id: '6uo',
	// 	light: 2,
	// 	moon: 2,
	// 	cover: mint,
	// 	price: 4
	// }
]
