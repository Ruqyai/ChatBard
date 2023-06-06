

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
   
   3.[Third Example: Demo via Gradio in Colab Notebook](#third-example-demo-via-gradio-in-colab--python)
- [Contributing](#contributing)
- [License](#license)
- [Further resources](#further-resources)


---

# First Example: Flutter App / Drat

ChatBard  is an intelligent customer service center app powered by **Generative AI** and large language models (**LLM**) using **PaLM2 APIs**. 🤖💬   
This demo of Flutter app is designed to inspire you and showcase how ChatBard can revolutionize customer support. It provides a chat interface where users can interact with a chatbot to ask questions and get answers. The app utilizes generative AI and large language models (LLMs), specifically PaLM2 APIs, to understand and respond intelligently to user messages. The demo app analyzes the context and examples provided to respond accurately, making it an invaluable tool for any customer service center.   
ChatBard can be easily customized to align with the nature of your business. By modifying the context and examples, you can tailor the chatbot's responses to your specific business requirements and customer interactions.  
Screenshots of the app showcase its functionality, including capturing conversations with clients and providing summarized records stored in Firebase. It offers both English and Arabic language support. Note that this is a developed feature in this app by creating a custom REST API for translation. PaLM2 and Bard are still under development and do not yet support the Arabic language.  

## How does it work?
The ChatBard responds to customer queries based on the information it has been fed with in terms of context and examples. Then it summarizes the conversation and stores the summary in the database in Firebase.

## Features

Key features of ChatBard include:  
- 📱 User-friendly chat interface for seamless communication.   
- 🧠 Intelligent responses powered by PaLM2 model.  
- 🔧 Easily customizable to align with the nature of your business by modifying the context and examples.  
- 🌍 Multi-language support (English and Arabic).    
- 📚 Chat history tracking and display in real-time.    
- 💾 Summarization and saving of conversations to Firebase database for future reference.   


## Screenshots

Here are some screenshots of the app:

![Screenshot 1](/FluttrApp-Dart/screenshots/screenshot1.gif)  
_A conversation with the client, and after the conversation ends, it is summarized and stored in Firebase._

![Screenshot 2](/FluttrApp-Dart/screenshots/screenshot2.gif)  
_Arabic Bard in a conversation with the client, and after the conversation ends, it is summarized and stored in Firebase._
![Screenshot 5](/FluttrApp-Dart/screenshots/screenshot5.png)  
_On Android mobile: A conversation with the client, and after the conversation ends, it is summarized and stored in Firebase._ 
![Screenshot 6](/FluttrApp-Dart/screenshots/screenshot6.png)  
_On Android mobile: Arabic Bard in a conversation with the client, and after the conversation ends, it is summarized and stored in Firebase._ 

<h4 style="color:Tomato;"><i> Note: It is a developed feature in this app by creating a custom REST API for translation. PaLM2 and Bard are still under development and do not yet support the Arabic language.</i> </h4> 


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
 
## Screenshots

Here are some screenshots of the app:

![Screenshot 3](/FluttrApp-Dart/screenshots/screenshot3.gif)  
_A simple UI for the conversation with the clients_  

![Screenshot 7](/FluttrApp-Dart/screenshots/screenshot7.png)  
_If the Summarize button clicked, the summary will appear on the bottom_

## [Deploying a REST API on Cloud Run](https://cloud.google.com/run/docs/quickstarts/build-and-deploy/deploy-python-service)

This is a step-by-step guide to deploying a Python-based REST API on Cloud Run. The guide follows the instructions provided in the official Cloud Run documentation [here](https://cloud.google.com/run/docs/quickstarts/build-and-deploy/deploy-python-service).



## To Use The Deployment API Endpoints

To interact with the deployed API endpoints, their information below.



### /chat  
This endpoint allows you to have a conversation with the English Chat Bard model.
#### Endpoint
- URL: `<Your URL>/chat`
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
- URL: `<Your URL>/summary`
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

- URL: `<Your URL>/chat_ar`
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

- URL: `<Your URL>/summary_ar`
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
- URL: `<Your URL>/en2ar`
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
- URL: `<Your URL>/ar2en`
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

---

# Third Example: Demo via Gradio in Colab / Python     
   

Google Colab is a powerful online platform and easy to use. It provides a simple and convenient way to demonstrate code, create tutorials, and review demos.
[Take a look](https://github.com/Ruqyai/chatBard/tree/main/Notebooks-Python) 

## Screenshots 


![Screenshot 4](/FluttrApp-Dart/screenshots/screenshot4.gif)  
_A simple Demo via Gradio in Colab_
     
---

## Contributing

Contributions to the app are welcome! If you find any issues or want to add new features, feel free to open a pull request.

## License

The app is released under the [MIT License](LICENSE).

## Further Resources
- [Google AI: PaLM2](https://ai.google/discover/palm2)
- [Build generative AI applications](https://developers.generativeai.google/)
- [Docs of Gen AI on Vertex AI](https://cloud.google.com/vertex-ai/docs/generative-ai/learn/overview)
- [Docs of Generative AI for Developers](https://developers.generativeai.google/api)
- [Generative AI repository](https://github.com/GoogleCloudPlatform/generative-ai)
- [Python-docs-samples/generative_ai](https://github.com/GoogleCloudPlatform/python-docs-samples/tree/main/generative_ai)
- [Awesome Prompt Engineering](https://github.com/promptslab/Awesome-Prompt-Engineering)
- [LangChain for Google Cloud Platform Vertex AI PaLM](https://python.langchain.com/en/latest/modules/models/llms/integrations/google_vertex_ai_palm.html)



