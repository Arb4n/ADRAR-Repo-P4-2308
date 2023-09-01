import React from 'react';
import { render } from "react-dom";


// 1: On crée cette constante theme qui est dépendante du ctxt de react
const theme = {
    dark: {
        background: '#000',
        color: '#FFF'
    },
    light: {
        background: '#FFF',
        color: '#000'
    }
}


// 2>> Contexte : il faut définir un contexte → methode React.createContext ;
// On lui asse en params une valeur initiale par défaut ; ici, le theme dark. 
// Dans ce contexte, on a une propriété background et color, donc. 
//  puis on peut le sauvegarder dans une variable 
const ThemeContext = React.createContext(theme.dark)

function SearchForm({ theme }) {
    return <div>
        <input style={theme} />
        <button style={theme}>M'inscrire</button>
    </div>
}

function Toolbar({ theme }) {
    return <div>
        <button style={theme}>pop</button>
    </div>
}


function App() {
    return <div>
        <Toolbar theme={theme.dark} />
        <SearchForm theme={theme.light}/>

    </div>

}

render(
    <App />,
    document.getElementById('app')
)

