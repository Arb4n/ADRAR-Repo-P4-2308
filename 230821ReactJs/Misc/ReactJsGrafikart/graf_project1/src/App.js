import React from 'react';
// import { render } from "react-dom";


import './App.css';




// 1: On crée cette constante theme qui est dépendante du ctxt de react
const theme = {
  dark: {
    background: '#000',
    color: '#FFF',
    border: '#000'
  },
  light: {
    background: '#FFF',
    color: '#000',
    border: '#FFF'

  }
}


// 2>> Contexte : il faut définir un contexte → methode React.createContext ;
// On lui asse en params une valeur initiale par défaut ; ici, le theme dark. 
// Dans ce contexte, on a une propriété background et color, donc. 
//  puis on peut le sauvegarder dans une variable 

const ThemeContext = React.createContext(theme.dark)

// function SearchForm({ theme }) {
//   return <div>
//     <input style={theme} />
//     <button style={theme}>M'inscrire</button>
//   </div>
// }

// function Toolbar({ theme }) {
//   return <div>
//     <button style={theme}>! POP !</button>
//   </div>
// }


// 2.2>> On retire donc la propriété ({ theme }) qui était   
// passé de composant en composant, d'élément en élément.
function SearchForm() {
  return <div>
    <input />
    <ThemedButton >Rechercher</ThemedButton>
  </div>
}

function Toolbar() {
  return <div>
    <ThemedButton > Inscription </ThemedButton>
  </div>
}

// 2.3 Création alors d'une fonction  ThemedButton = un bouton qui va être influencé par le theme.
// Il recevra en params des enfants ({children}) → permettra de changer les boutons Rechercher et Inscription
// Quand la fonction est définie, elle remplace les différents boutons. 
function ThemedButton({ children }) {
  return <ThemeContext.Consumer>
    {value => {
      return <button style={value}>{children}</button>
    }}
  </ThemeContext.Consumer>

}


// 2.1>> A partir de ce moment, il va falloir que l'élément applciation définisse un provider
// = il va être responsable de passer le contexte à ses enfants 
// DONC>> tous les composants qui vont avoir besoin de ce contexte vont devoir être entourés
// d'un élément qui s'appelle context provider. 
function App() {
  return (
    <div className="App">
      <header className="App-header">
        <div>

          <div>HI. AM I ALIVE ?</div>
          {/* 2.1>> Création d'un nouvel élément : context.Provider */}
          {/* 2.3>> Si on supprime </ThemeContext.Provider></ThemeContext.Provider>, 
          on aura le theme dark par défaut, sur des boutons qui viennent d'où putain ???
          Si on veut changer le theme, on peut changer la valeur 
          avec value = {} 
          
          !!!
          Le theme est maintenant dépendant du provider, et est donc moins réutilisable 
          = on ne peut pas prendre le composant 
          et le mettre dans un projet si il n'y a pas ce principe de contexte.
          */}
          <ThemeContext.Provider value={theme.light}>
            <SearchForm />
            <Toolbar />
          </ThemeContext.Provider>
        </div>
      </header>
    </div>
  );
}


// render(
//   <App />,
//   document.getElementById('app')
// )

export default App;
