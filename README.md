# ivorywalletsolution

## Contents
### 1. Final presentation
### 2. Final Article
### 3. Screenshots of screens
### 4. Screen Recordings of the app
 
# 1. Basic overview of the project is inside the following ppt

[WonderPal Final Presentation-compressed-compressed.pdf](https://github.com/Nilupa-Illangarathna/Data-Management-Project-full-project/files/13749860/WonderPal.Final.Presentation-compressed-compressed.pdf)

# 1. Final Article of the project is inside the following pdf

[Article.pdf](https://github.com/Nilupa-Illangarathna/Data-Management-Project-full-project/files/13749889/Article.pdf)




# WonderPal

Welcome to WonderPal, your personalized travel companion! WonderPal integrates advanced machine learning and natural language processing to offer tailored travel recommendations. Whether you're exploring new destinations, seeking hotel suggestions, or discovering hidden gems, WonderPal is here to enhance your travel experience.

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
  - Pre-trained embedding model: 'jinaai/jina-embedding-t-en-v1'
  
- **Backend:**
  - Flask (Python)
  - Node.js

- **Frontend:**
  - Flutter

- **Database:**
  - SQLite3

- **Deployment:**
  - Docker
  - Google Cloud Platform (GCP)

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

## Deployment

The WonderPal ecosystem is deployed using Docker for containerization. The deployment involves Google Cloud Platform for scalable and reliable hosting.

## Getting Started

To start exploring the wonders with WonderPal, follow the instructions in the [Getting Started](#getting-started) section.

## Usage

Learn how to make the most of WonderPal with the detailed instructions provided in the [Usage](#usage) section.

## Contributing

We welcome contributions to WonderPal! If you'd like to contribute, please follow the guidelines in the [Contributing](#contributing) section.

## License

WonderPal is licensed under [Your License Here]. See the [License](#license) section for more details.





# 2. Screenshots of screens

<table>
  <tr>
    <td> Splash screen</td>
     <td> App Drawer</td>
     <td> Welcome screen</td>
  </tr>
  <tr>
    <td><img src="hhttps://github.com/Nilupa-Illangarathna/Data-Management-Project-full-project/assets/95247831/4b856ce4-9a3d-4646-9af5-e55a854c8a29" width=300></td>
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


