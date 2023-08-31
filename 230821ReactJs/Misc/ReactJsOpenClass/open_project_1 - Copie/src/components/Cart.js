


const Banner = () => {
const objet1 = 18; 
const objet2 = 45; 
const objet3 = 12; 
return (   
    <>
    <h2>PANIER</h2>
    <ol>
        <li>Objet 1  {objet1}€</li>
        <li> Objet 2  {objet2}€ </li>
        <li>Objet 3  {objet3}€ </li>
    </ol>
    TOTAL {objet1 + objet2 + objet3}
    </>
)
}
export default Banner