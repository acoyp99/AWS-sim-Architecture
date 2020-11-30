import logo from './logo.svg';
import './App.css';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          This is <code>frond-end</code> for technical test
        </p>
        <a
          className="App-link"
          href="https://www.linkedin.com/in/fernando-coy/"
          target="_blank"
          rel="noopener noreferrer"
        >
          CV
        </a>
      </header>
    </div>
  );
}

export default App;
