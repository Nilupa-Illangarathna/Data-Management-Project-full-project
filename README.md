# WonderPal Fantasy driven

# WonderPal

Welcome to WonderPal, your personalized travel companion! WonderPal integrates advanced machine learning and natural language processing to offer tailored travel recommendations. Whether you're exploring new destinations, seeking hotel suggestions, or discovering hidden gems, WonderPal is here to enhance your travel experience.


 [![Flutter](https://img.shields.io/badge/framework-Flutter-blue)](https://flutter.dev/)
 [![NLP](https://img.shields.io/badge/NLP-Natural%20Language%20Processing-green)](https://en.wikipedia.org/wiki/Natural_language_processing)
 [![Python](https://img.shields.io/badge/language-Python-brightgreen)](https://www.python.org/)
 [![Flask](https://img.shields.io/badge/framework-Flask-brightgreen)](https://flask.palletsprojects.com/)
 [![Node.js](https://img.shields.io/badge/runtime-Node.js-green)](https://nodejs.org/)
 [![SQLite3](https://img.shields.io/badge/database-SQLite3-brightgreen)](https://www.sqlite.org/)
 [![GitHub](https://img.shields.io/badge/version%20control-GitHub-lightgrey)](https://github.com/)
 [![Hugging Face](https://img.shields.io/badge/model%20repository-Hugging%20Face-9cf)](https://huggingface.co/)
 [![Google Colab](https://img.shields.io/badge/platform-Google%20Colab-blue)](https://colab.research.google.com/)
 [![Kaggle](https://img.shields.io/badge/dataset-Kaggle-orange)](https://www.kaggle.com/)
 [![Spark](https://img.shields.io/badge/technology-Apache%20Spark-yellow)](https://spark.apache.org/)
 [![Spring Boot](https://img.shields.io/badge/framework-Spring%20Boot-brightgreen)](https://spring.io/projects/spring-boot)
 [![GPT-3](https://img.shields.io/badge/model-GPT-3-important)](https://www.openai.com/gpt-3/)
 [![T5](https://img.shields.io/badge/model-T5-important)](https://huggingface.co/t5)
 [![BERT](https://img.shields.io/badge/model-BERT-important)](https://huggingface.co/bert-base-uncased)
 [![DistilBERT](https://img.shields.io/badge/model-DistilBERT-important)](https://huggingface.co/distilbert-base-uncased)
 [![NLTK](https://img.shields.io/badge/library-NLTK-blue)](https://www.nltk.org/)
 [![All-MiniLM-L6-v2](https://img.shields.io/badge/model-All--MiniLM--L6--v2-important)](https://huggingface.co/sentence-transformers/all-MiniLM-L6-v2)
 [![Babelscape/wikineural-multilingual-ner](https://img.shields.io/badge/model-Babelscape%2Fwikineural--multilingual--ner-important)](https://huggingface.co/Babelscape/wikineural-multilingual-ner)
 [![Dizex/FoodBaseBERT](https://img.shields.io/badge/model-Dizex%2FFoodBaseBERT-important)](https://huggingface.co/Dizex/FoodBaseBERT-NER)


## 1. Basic overview of the project is inside the following ppt

[WonderPal Final Presentation-compressed-compressed.pdf](https://github.com/Nilupa-Illangarathna/Data-Management-Project-full-project/files/13749860/WonderPal.Final.Presentation-compressed-compressed.pdf)

## 2. Final Article of the project is inside the following pdf

[Article.pdf](https://github.com/Nilupa-Illangarathna/Data-Management-Project-full-project/files/13749889/Article.pdf)


## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Technologies Used](#technologies-used)
- [Machine Learning Model](#machine-learning-model)
- [Backend](#backend)
- [Database](#database)
- [Deployment](#deployment)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Introduction

WonderPal is a smart travel companion designed to make your journey unforgettable. Leveraging the power of machine learning and natural language processing, WonderPal provides personalized fa travel recommendations based on your preferences and positive hotel experiences.

## Features

- Explore personalized location suggestions based on positive reviews.
- Seamless integration with advanced machine learning for accurate recommendations.
- User-friendly Flutter frontend for an intuitive travel experience.
- Feedback loop mechanism for continuous learning and improvement.

## Technologies Used

- **Machine Learning and NLP:**
  - SentenceTransformer library
  - Natural Language Toolkit (NLTK)
  - Hugging Face Models:
    - [DISTILlBERT](https://huggingface.co/distilbert-base-uncased) by Hugging Face Team
    - [BERT](https://huggingface.co/tftransformers/bert-base-uncased) by Google AI and Hugging Face Team
    - [GPT-2](https://huggingface.co/gpt2) by OpenAI and Hugging Face Team
    - [T5](https://huggingface.co/google/t5-small-lm-adapt) by Google AI and Hugging Face Team
    - [All-MiniLM-L6-v2](https://huggingface.co/sentence-transformers/all-MiniLM-L6-v2) by Google AI and Hugging Face Team
    - [wikineural-multilingual-ner](https://huggingface.co/Babelscape/wikineural-multilingual-ner) by Babelscape
    - [FoodBaseBERT-NER](https://huggingface.co/Dizex/FoodBaseBERT-NER) by Dizex
    - [jina-embedding-t-en-v1](https://huggingface.co/jinaai/jina-embedding-t-en-v1) by Jina AI

- **Python Backend (Flask):**
  - Flask
  - Pandas for data manipulation
  - Pickle for model persistence

- **Node.js Backend:**
  - Node.js
  - Express.js
  - SQLite3 for backend side database management

- **Frontend (Flutter):**
  - Dart
  - Flutter SDK

- **Database:**
  - SQLite3

- **planned Deployment:**
  - Google Cloud Platform (GCP)
  
- **Other Tools and Libraries:**
  - Google Drive API for model storage
  - Google Colab for ML
  - Various data transformation libraries
  - Git and GitHub for version control



## Frontend

The Flutter frontend provides a delightful user interface with creative designs, input forms, and location cards. Key components include:
- Splash Screen
- Helper Screen
- App Drawer
- Homepage with interactive cards
- Suggestions and Recommendations
- Visited Places
- Feedback

## Machine Learning Model

WonderPal's recommendation engine employs a sophisticated machine learning model using SentenceTransformer for embedding positive reviews. The model calculates cosine similarities to offer personalized location suggestions.

## Backend

### Python Backend (Flask)

- Flask-powered backend handles user queries, recommendations, and feedback loops.
- Multiple APIs for retrieving recommendations, filtering data, and more.

### Node.js Backend

- Node.js backend serves as the master, coordinating communication between the frontend and Python backend.
- Manages 19 APIs, orchestrating CRUD operations and handling SQLite3 databases.

## Database

- SQLite3 database stores essential data, including positive review embeddings and user feedback.
- Seamless integration with backend for efficient data retrieval.

## Contributing

We welcome contributions to WonderPal! If you'd like to contribute, please follow the guidelines in the [Contributing](#contributing) section.



# 4. Screenshots of screens

<table>
  <tr>
    <td> Splash screen</td>
     <td> App Drawer</td>
     <td> Welcome screen</td>
  </tr>
  <tr>
    <td><img src="https://github.com/Nilupa-Illangarathna/Data-Management-Project-full-project/assets/95247831/6fa68557-63b9-41ba-a544-374e647b9188" width=300></td>
    <td><img src="https://github.com/Nilupa-Illangarathna/Data-Management-Project-full-project/assets/95247831/cca6362c-cd19-4605-a97e-9eef32985577" width=300></td>
    <td><img src="https://github.com/Nilupa-Illangarathna/Data-Management-Project-full-project/assets/95247831/839735e5-edf3-4e21-894a-42efc39ff67f" width=300></td>
  </tr>
 </table>

<table>
  <tr>
    <td> Helper screen</td>
     <td> Helper screen</td>
     <td> Helper screen</td>
  </tr>
  <tr>
    <td><img src="https://github.com/Nilupa-Illangarathna/Data-Management-Project-full-project/assets/95247831/59089468-847c-48f8-a3e1-78559c9fa93b" width=300></td>
    <td><img src="https://github.com/Nilupa-Illangarathna/Data-Management-Project-full-project/assets/95247831/e6c73b0f-f3d3-4619-b28a-7fbfcf57ae38" width=300></td>
    <td><img src="https://github.com/Nilupa-Illangarathna/Data-Management-Project-full-project/assets/95247831/15ae5c6e-0d1e-47ed-bd82-aa4c008b5fd4" width=300></td>
  </tr>
 </table>


<table>
  <tr>
    <td> Wonder Finder screen</td>
     <td> Travel Buddy screen</td>
     <td> Wonder Lust screen</td>
  </tr>
  <tr>
    <td><img src="https://github.com/Nilupa-Illangarathna/Data-Management-Project-full-project/assets/95247831/4a6d0631-0685-4d65-94aa-71444adca034" width=300></td>
    <td><img src="https://github.com/Nilupa-Illangarathna/Data-Management-Project-full-project/assets/95247831/d1528c45-f873-4dbd-8a08-bedbb1bbe430" width=300></td>
    <td><img src="https://github.com/Nilupa-Illangarathna/Data-Management-Project-full-project/assets/95247831/90851487-9961-4b9e-9515-f35b1c2b647c" width=300></td>
  </tr>
 </table>


<table>
  <tr>
    <td> Wonder Finder screen</td>
     <td> Travel Buddy screen</td>
     <td> Wonder Lust screen</td>
  </tr>
  <tr>
    <td><img src="https://github.com/Nilupa-Illangarathna/Data-Management-Project-full-project/assets/95247831/4a6d0631-0685-4d65-94aa-71444adca034" width=300></td>
    <td><img src="https://github.com/Nilupa-Illangarathna/Data-Management-Project-full-project/assets/95247831/d1528c45-f873-4dbd-8a08-bedbb1bbe430" width=300></td>
    <td><img src="https://github.com/Nilupa-Illangarathna/Data-Management-Project-full-project/assets/95247831/90851487-9961-4b9e-9515-f35b1c2b647c" width=300></td>
  </tr>
 </table>

<table>
  <tr>
    <td> Wonder Finder screen</td>
     <td> Cart screen</td>
     <td> Purchase screen</td>
  </tr>
  <tr>
    <td><img src="https://github.com/Nilupa-Illangarathna/Data-Management-Project-full-project/assets/95247831/4a069604-6940-4617-b0c7-f921fef22b07" width=300></td>
    <td><img src="https://github.com/Nilupa-Illangarathna/Data-Management-Project-full-project/assets/95247831/c5ce03bd-2322-4fde-8aa7-75df7dc572e3" width=300></td>
    <td><img src="https://github.com/Nilupa-Illangarathna/Data-Management-Project-full-project/assets/95247831/13a49880-da4f-4903-ba83-b15ac2017244" width=300></td>
  </tr>
 </table>


