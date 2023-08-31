import '../styles/Banner.css'
// import logo from '../assets/logoLeaf.bmp'
import logo from '../assets/leaf+1.png'
import logo2 from '../assets/logoLeaf.bmp'

function Banner () {
    return (<div className="lmj-banner">
    <h1> La Maison Jungle </h1>
    <img src = {logo} alt = 'feuille verte' className="lmj-logo"/>
    <img src = {logo} alt = 'feuille verte' className="lmj-logo"/>
    <img src = {logo2} alt = 'feuille verte' className="lmj-logo"/>
    </div>)
}

export default Banner