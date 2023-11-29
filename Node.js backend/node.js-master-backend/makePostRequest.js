// makePostRequest.js

const axios = require('axios');

const baseUrl = 'http://127.0.0.1:3500';

async function makePostRequest(endpoint, data) {
  try {
    const response = await axios.post(`${baseUrl}/${endpoint}`, data);
    return response.data;
  } catch (error) {
    console.error(`Error calling ${endpoint}:`, error.message);
    return null;
  }
}

module.exports = makePostRequest;
