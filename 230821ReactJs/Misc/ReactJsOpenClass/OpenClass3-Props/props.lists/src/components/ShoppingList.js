import { plantList } from '../datas/plantList'
import '../styles/ShoppingList.css'

function ShoppingList() {


	// const currentMonth = new Date().getMonth();
	// const isSpring = currentMonth >= 2 && currentMonth <=5;
	// const recommendation = isSpring ? (
	// 	<div> C'est le printemps , rempotez 🗾</div>)
	// 	: 
	// 	(<div>Ce n'est pas le moment de rempoter 🌑</div>
	// );

	const categories = plantList.reduce(
		(acc, plant) =>
			acc.includes(plant.category) ? acc : acc.concat(plant.category),
		[]
	)
		
	return (
		
		<div>

		{/*recommendation*/}

			<ul className="lmj-plant-cat">
				{categories.map((cat) => (
					<li key={cat}>{cat}</li>
				))}
			</ul>
			<ul className='lmj-plant-list'>
				{plantList.map((plant) => (
					<li key={plant.id} className='lmj-plant-item'>
						{plant.name}
						{/*J'ai également ajouté une variable  isSpecialOffer  
					 à  true   pour les plantes qui sont en promotion. 
					Votre mission est d'afficher un élément  div  
				qui contient le mot “Soldes” si la plante est en promotion. 
			Vous pouvez lui passer la classe  lmj-sales  pour lui ajouter du style.*/ }
						{plant.isSpecialOffer && <div className = 'lmj-sales'>Soldes</div>}
					</li>
				))}
			</ul>
			
		</div>
	)
}

export default ShoppingList
