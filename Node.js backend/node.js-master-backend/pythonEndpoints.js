// apiFunctions.js

const makePostRequest = require('./makePostRequest');

async function getRecommendations(querySentence, numRecommendations) {
  const data = {
    query_sentence: querySentence,
    num_recommendations: numRecommendations || 5,
  };

  return await makePostRequest('get_recommendations', data);
}

async function filterRows(columnName, columnValue) {
  const data = {
    column_name: columnName,
    column_value: columnValue,
  };

  return await makePostRequest('filter_rows', data);
}

async function getItemByRank(recommendations, desiredRank) {
  const data = {
    recommendations: recommendations,
    desired_rank: desiredRank,
  };

  return await makePostRequest('get_item_by_rank', data);
}

async function getAttributeKeys(recommendation) {
  const data = {
    recommendation: recommendation,
  };

  return await makePostRequest('get_attribute_keys', data);
}

async function getAttributeValue(recommendation, key) {
  const data = {
    recommendation: recommendation,
    key: key,
  };

  return await makePostRequest('get_attribute_value', data);
}

async function getColumnNamesFromEntireRow(entireRow) {
  const data = {
    entire_row: entireRow,
  };

  return await makePostRequest('get_column_names_from_entire_row', data);
}

async function getColumnValueFromEntireRow(entireRow, columnName) {
  const data = {
    entire_row: entireRow,
    column_name: columnName,
  };

  return await makePostRequest('get_column_value_from_entire_row', data);
}

async function editColumnValue(row, columnName, newValue) {
  const data = {
    row: row,
    column_name: columnName,
    new_value: newValue,
  };

  return await makePostRequest('edit_column_value', data);
}

async function getDatasetSize() {
  return await makePostRequest('get_dataset_size', {});
}

async function addNewHotelDataFeedbackLoop(newData) {
  const data = {
    new_data: newData,
  };

  return await makePostRequest('add_new_hotel_data_feedback_loop', data);
}

async function saveModel(outputFilePath) {
  const data = {
    output_file_path: outputFilePath,
  };

  return await makePostRequest('save_model', data);
}

module.exports = {
  getRecommendations,
  filterRows,
  getItemByRank,
  getAttributeKeys,
  getAttributeValue,
  getColumnNamesFromEntireRow,
  getColumnValueFromEntireRow,
  editColumnValue,
  getDatasetSize,
  addNewHotelDataFeedbackLoop,
  saveModel,
};
