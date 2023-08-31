import { plantList } from '../datas/plantList'
import '../styles/shoppingList.css'




/*L'objectif principal de cette fonction est de générer une liste de catégories uniques à partir de plantList.

La partie avec .reduce fait exactement cela :

	Au départ, l'accumulateur acc est un tableau vide [].
	À chaque itération, la fonction vérifie si la catégorie 
	de la plante en cours (plant.category) est déjà présente 
	dans l'accumulateur (acc.includes(plant.category)).
	Si la catégorie n'existe pas dans l'accumulateur, elle est 
	ajoutée (acc.concat(plant.category)).
	Si la catégorie existe déjà, l'accumulateur reste inchangé (acc).
	À la fin, categories contient un tableau 
	d'éléments uniques ['Flower', 'Vegetable', 'Succulent'].

*/

	function ShoppingList() {
	// Reduce va accumuler les valeurs category
	const categories = plantList.reduce(
		(acc, plant) =>
			acc.includes(plant.category) ? acc : acc.concat(plant.category),
		[]
	)

	/*
	Ensuite, dans le rendu JSX, deux listes non ordonnées (ul) sont affichées :

	La première liste affiche les catégories uniques en utilisant .map 
	sur le tableau categories. Chaque catégorie unique est affichée en tant 
	qu'élément de liste (li).
	La deuxième liste affiche les noms de toutes les plantes 
	en utilisant .map sur le tableau plantList. Chaque nom de plante 
	est affiché en tant qu'élément de liste (li).

En somme, cette fonction génère une liste de catégories uniques 
et une liste de noms de plantes à partir de plantList, 
en utilisant .reduce pour accumuler les cao^pm!tégories uniques.  */
	return (
		<div className='shoppingList'>
			<ul className='plantCategories'>
				{categories.map((cat) => (
					<li key={cat}>{cat}</li>
				))}
			</ul>
			<ul className='plantName'>
				{plantList.map((plant) => (
					// <li key={plant.id}>{plant.name}, {plant.isBestSale ? <span>🔥</span> : <span>👎</span>}</li>
					<li key={plant.id} /* className = 'lmj-plant-item'*/>{plant.name}, {plant.isBestSale ? <span>🔥</span> : null}</li>
					// {plant.isBestSale && <span>🔥</span>}
					
				))}
			</ul>
		</div>
	)
}

export default ShoppingList
