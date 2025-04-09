# Artificial Intelligence and Machine Learning

## Narrow AI

**Narrow AI** focuses on performing specific tasks, such as:

- **Virtual Assistants**: Understands what you are saying and executes a few commands.
- **Self-Driving Cars**: Capable of driving vehicles autonomously.
- **Image Processing**: Detects and identifies objects in images.

## Machine Learning

**Machine Learning (ML)** is a subset of Narrow AI that learns from data examples. It builds predictive models by training on large datasets. 

- **Training a Model**: 
  - To build an ML model, you use millions of examples (data) to train the system.
  - Once trained, the model can be used to make predictions, such as identifying objects in images.

## Pre-built ML Models in GCP

Google Cloud Platform (GCP) offers a range of pre-built ML models accessible via APIs:

- **Speech-to-Text API**: Converts spoken language into text.
- **Text-to-Speech API**: Converts text into spoken language.
- **Translation API**: Translates text between different languages.
- **Natural Language API**: Derives insights from unstructured text (e.g., sentiment analysis, entity recognition).
- **Cloud Vision API**: Provides image intelligence, including:
  - **Classifying Images**: Classifies images into predefined categories.
  - **Object and Face Detection**: Detects objects and faces within images.
  - **Text Recognition**: Reads and extracts printed words from images.

# ML – Custom Models

## AutoML: Build custom models with minimum ML expertise and effort; simple models
- **AutoML Vision**: Build custom models based on images
  - Provide examples (e.g., images and categorization) and AutoML will create a model for you.
  
- **AutoML Video Intelligence**: Adds labels to videos
  - Streaming video analysis.
  
- **AutoML Tables**: Automatically build models on structured data.

## BigQuery ML: Write queries and build models using those queries
- Based on data in BigQuery.

## Vertex AI: Build and deploy ML models faster (custom or pre-built)
- Manage the lifecycle of your models.
- Custom tooling within a unified AI platform.
- Entire lifecycle management of your ML model.

## ML Optimization

### TPU (Tensor Processing Units)
- Attach to your computer and run ML workloads 20-30x faster.
- Helps you quickly iterate over ML solutions and training data.
- Attach to your VM created via GCE, CKE, or AI platform.
