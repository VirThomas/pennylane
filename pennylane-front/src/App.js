import './App.css';
import React, { useState } from 'react';
import axios from 'axios';
import RecipeReviewCard from './components/RecipeReviewCard';
import { Pagination } from '@mui/material';

function App() {
  const [searchTerm, setSearchTerm] = useState('');
  const [responseData, setResponseData] = useState(null);
  const [currentPage, setCurrentPage] = useState(0);

  const handleChange = (event, value) => {
    setCurrentPage(value);
  };
  const handleSearch = (event) => {
    setSearchTerm(event.target.value);
  };

  const handleSubmit = () => {
    if (searchTerm.trim() !== '') {
      axios.get(process.env.REACT_APP_ENDPOINT_URL, { params: { ingredients: searchTerm } })
        .then(response => {
          setResponseData(response.data);
          setCurrentPage(0);
        })
        .catch(error => {
          console.error('Error fetching data:', error);
        });
    } else {
      console.log('Search term is empty');
    }
  };

  return (
    <div className="App">
      <input
        type="text"
        value={searchTerm}
        onChange={handleSearch}
        placeholder="Mes ingredients..."
      />
      <button onClick={handleSubmit}>Trouve moi des recettes !</button>
      {responseData && <div>
        {responseData.slice(0 + 9 * currentPage, 9 + 9 * currentPage).map(data => 
          <RecipeReviewCard recipe={data}/>
        )}
         <Pagination page={currentPage} count={responseData && Math.floor(responseData.length / 9)} onChange={handleChange} color="primary" />
         </div> 
      }
    </div>
  );
}

export default App;
