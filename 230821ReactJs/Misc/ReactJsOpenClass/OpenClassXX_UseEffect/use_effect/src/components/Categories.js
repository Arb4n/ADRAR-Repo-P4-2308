import '../styles/Categories.css'

function Categories({ setActiveCategory, categories, activeCategory }) {
	return (
		<div className='montcuq-categories'>
			<select
				value={activeCategory}
				onChange={(e) => setActiveCategory(e.target.value)}
				className='montcuq-categories-select'
			>
				<option value=''>---</option>
				{categories.map((cat) => (
					<option key={cat} value={cat}>
						{cat}
					</option>
				))}
			</select>
			<button className='montcuq-button-reinit' onClick={() => setActiveCategory('')}>Réinitialiser</button>
		</div>
	)
}

export default Categories
