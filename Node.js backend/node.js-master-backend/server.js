// server.js

const makePostRequest = require('./makePostRequest');
const apiFunctions = require('./pythonEndpoints');

// Common configuration
// ... (if needed)

async function runExample() {
  const querySentence = "Seeking a business-friendly hotel...";
  const numRecommendations = 6;

  // Call the getRecommendations function
  const recommendations = await apiFunctions.getRecommendations(querySentence, numRecommendations);
  console.log('getRecommendations:', recommendations);

  // Check if recommendations were received
  if (recommendations && recommendations.length >= 4) {
    // Get the 4th recommendation
    const fourthRecommendation = recommendations[3]; // Arrays are zero-indexed, so index 3 is the 4th element
    console.log('Fourth Recommendation:', fourthRecommendation);

    // Call the getItemByRank function
    const desiredRank = 4;
    const itemByRank = await apiFunctions.getItemByRank(recommendations, desiredRank);
    console.log('Item by Rank:', itemByRank);
  } else {
    console.log('Received recommendations are insufficient to get the 4th recommendation.');
  }
}

// Run the example
runExample();