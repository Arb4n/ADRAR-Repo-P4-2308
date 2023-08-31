import logo from './logo.svg';
import './App.css';

import React from 'react';
import ReactDOM from 'react-dom';



// COMPONENTS >>

import Banner from './components/Banner.js'
import Cart from './components/Cart.js'
import ShoppingList from './components/ShoppingList.js'


// Components <<

function MyComponent() {
  return (<div className = "MyComponent">Hello OpenClassrooms 👋</div>)
}

ReactDOM.render(<MyComponent />, document.getElementById("react-goes-here"))



function App() {
  return (
    <div className="App">
      <header className="App-header">

      
        <Banner/>

        <ShoppingList/>

        <Cart/>

        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.js</code> and save to reload.
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>
    </div>
  );
}

export default App;
