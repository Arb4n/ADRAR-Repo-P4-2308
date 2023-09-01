import CareScale from './CareScale'
import '../styles/Passes.css'

function handleClick(plantName) {
	alert(`Vous voulez acheter 1 ${plantName}? Très bon choix 🌱✨`)
}

function Passes({ cover, name, moon, light, price }) {
	return (
		<li className='montcuq-item' onClick={() => handleClick(name)}>
			<span className='montcuq-item-price'>{price}€</span>
			<img className='montcuq-item-cover' src={cover} alt={`${name} cover`} />
			{name}
			<span className='care-scales'>
				<CareScale careType='light' scaleValue={light} />
				<CareScale careType='moon' scaleValue={moon} />
			</span>
		</li>
	)
}

export default Passes
