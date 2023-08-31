import React from 'react';
import ReactDOM from 'react-dom/client';
// import 'C:/Users/Hal/Downloads/MontpellierAdrarP32308/230821ReactJs/firstProject/mon_first_projet/src/index.js';
import App from './components/App';
import reportWebVitals from './reportWebVitals';

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
