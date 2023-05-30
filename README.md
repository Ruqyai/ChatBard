

# ChatBard : An Intelligent Customer Service Center App    

The apps use **Generative AI** and Large Language Models (**LLM**) specifically **PaLM2 APIs**.

<h3>The table of contents:<h3>

- [ChatBard: An Intelligent Customer Service Center App](#chatbard--an-intelligent-customer-service-center-app)
1. [First Example: Flutter App / Drat](#first-example-flutter-app--drat)
   - [How does it work?](#how-does-it-work)
   - [Features](#features)
   - [Screenshots](#screenshots)
   - [Prerequisites](#prerequisites)
   - [Getting Started](#getting-started)
   - [Customize The App](#customize-the-app)
   - [Usage](#usage)
2. [Second Example: Flask App / Python](#second-example-flask-app--python)
   - [Screenshots](#screenshots-1)
   - [Deploying a REST API on Cloud Run](#deploying-a-rest-api-on-cloud-run)
   - [To Use My Deployment API Endpoints](#to-use-my-deployment-api-endpoints)
      - [/chat](#chat)
      - [/summary](#summary)
    - [Arabic Chat Bard](#arabic-chat-bard)
      - [/chat_ar](#chat_ar)
      - [/summary_ar](#summary_ar)
      - [/en2ar](#en2ar)
      - [/ar2en](#ar2en)  
   
   3.[Third Example: Demo via Gradio in Colab Notebook](https://github.com/Ruqyai/chatBard/tree/main/Notebooks-Python)
- [Contributing](#contributing)
- [License](#license)


---

# First Example: Flutter App / Drat

This is a Flutter app for an intelligent customer service center. It provides a chat interface where users can interact with a chatbot to get customer support. The app uses **Generative AI** and Large Language Models (**LLM**) specifically **PaLM2 APIs** to understand and respond to user messages.

## How does it work?
The ChatBARD responds to customer queries based on the information it has been fed with in terms of context and examples. Then it summarizes the conversation and stores the summary in the database in Firebase.

## Features

- Chat interface: Users can send messages and receive responses from the chatbot.
- Intelligent responses: The app uses a machine learning model to generate intelligent responses based on the user's input.
- Chat history: The app keeps track of the chat history and displays it in the chat interface.
- Summarization and saving: The app can summarize the chat session and save it to a Firebase database for future reference.

## Screenshots

Here are some screenshots of the app:

![Screenshot 1](/FluttrApp-Dart/screenshots/screenshot1.gif)  
_A conversation with the client, and after the conversation ends, it is summarized and stored in Firebase._

![Screenshot 2](/FluttrApp-Dart/screenshots/screenshot2.gif)  
_Arabic Bard in a conversation with the client, and after the conversation ends, it is summarized and stored in Firebase._

## Prerequisites

Before running the app, make sure you have the following:

- Flutter SDK installed on your machine.
- A valid Firebase project with Firestore enabled.
- API credentials for the PaLM APIs of chat and text summarization used in the code.

## Getting Started

Follow these steps to get started with the app:

1. Clone the repository to your local machine.
2. Open the project in your preferred IDE or editor.
3. Replace the placeholder API credentials in the code with your actual credentials.
4. Update the Firebase configuration in the code to match your project.
5. Run `flutter pub get` in the project directory to install dependencies.
6. Connect a device or start an emulator. Skip this step if you prefer to use a web browser for displaying the app.
7. Run the app using `flutter run lib/main.dart`.

## Customize The App

To customize the app according to the nature of your business, you can modify the following variables in the `examples.dart` file:

1. `context`: This variable represents the context and scope of your business. Update it with a brief description that reflects the purpose and domain of your customer service center.

2. `examples`: This variable contains example conversations that include important information relevant to your business. These examples help learn the chatbot model to understand and respond accurately to user queries. 

By updating the `context` and `examples` variables with relevant information, you can tailor the chatbot's responses to align with your business's specific requirements and customer interactions.

Feel free to modify other parts of the code or user interface to meet your needs.


## Usage

1. Launch the app on a device or emulator.
2. Enter your message in the text input at the bottom of the screen and press enter.
3. The app will send your message to the chatbot API and display the response in the chat interface.
4. Continue the conversation by entering more messages.
5. To summarize and save the chat session, click on the "Summarize and Save" floating action button.

---

# Second Example: Flask App / Python
 - Try it [here](https://chat-btfpe7ljtq-uc.a.run.app/)
## Screenshots

Here are some screenshots of the app:

![Screenshot 3](/FluttrApp-Dart/screenshots/screenshot3.gif)  
_A simple UI for the conversation with the clients_

## [Deploying a REST API on Cloud Run](https://cloud.google.com/run/docs/quickstarts/build-and-deploy/deploy-python-service)

This is a step-by-step guide to deploying a Python-based REST API on Cloud Run. The guide follows the instructions provided in the official Cloud Run documentation [here](https://cloud.google.com/run/docs/quickstarts/build-and-deploy/deploy-python-service).



## To Use My Deployment API Endpoints

To interact with the deployed API endpoints, their information below.
**FYI**, these endpoints will be deleted after one month.


### /chat  
This endpoint allows you to have a conversation with the English Chat Bard model.
#### Endpoint
- URL: `https://chat-btfpe7ljtq-uc.a.run.app/chat`
- Method: POST
#### Request Payload

  ```json
  {
      "message": "User's message in English"
  }
  ```

#### Response Payload

  ```json
  {
      "response": "Response from the English Chat Bard model"
  }
  ```

### /summary 
This endpoint generates a summary of a conversation between a customer and the English Chat Bard model.

#### Endpoint
- URL: `https://chat-btfpe7ljtq-uc.a.run.app/summary`
- Method: POST
#### Request Payload

  ```json
  {
      "content": "Conversation content in English"
  }
  ```

#### Response Payload

  ```json
  {
      "response": "Summary of the conversation in English"
  }
  ```


## Arabic Chat Bard

This section includes endpoints related to the Arabic Chat Bard model.


### /chat_ar

This endpoint allows you to have a conversation with the Arabic Chat Bard model.

#### Endpoint

- URL: `https://chat-btfpe7ljtq-uc.a.run.app/chat_ar`
- Method: POST


#### Request Payload

```json
{
  "message": "User's message in Arabic"
}
```

#### Response Payload

```json
{
  "response": "Response from the Arabic Chat Bard "
}
```

### /summary_ar

This endpoint generates a summary of a conversation between a customer and the Arabic Chat Bard.

#### Endpoint

- URL: `https://chat-btfpe7ljtq-uc.a.run.app/summary_ar`
- Method: POST


#### Request Payload

```json
{
  "content": "Conversation content in Arabic"
}
```

#### Response Payload

```json
{
  "response": "Summary of the conversation in Arabic"
}
```

### /en2ar

This endpoint translates English text to Arabic.

#### Endpoint
- URL: `https://chat-btfpe7ljtq-uc.a.run.app/en2ar`
- Method: POST

#### Request Payload

```json
{
  "response": "English text to be translated"
}
```

#### Response Payload

```json
{
  "response": "Translated Arabic text"
}
```

### /ar2en

This endpoint translates Arabic text to English.

#### Endpoint
- URL: `https://chat-btfpe7ljtq-uc.a.run.app/ar2en`
- Method: POST


#### Request Payload

```json
{
  "response": "Arabic text to be translated"
}
```

#### Response Payload

```json
{
  "response": "Translated English text"
}
```

Feel free to use these endpoints to interact with the deployed REST API.
**NOTE:** These endpoints will be deleted after one month.

---

## Contributing

Contributions to the app are welcome! If you find any issues or want to add new features, feel free to open a pull request.

## License

The app is released under the [MIT License](LICENSE).


