

# ChatBARD : An Intelligent Customer Service Center App

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

![Screenshot 1](screenshots/screenshot1.gif)  
_A conversation with the client, and after the conversation ends, it is summarized and stored in Firebase._

![Screenshot 2](screenshots/screenshot2.gif)  
_Arabic Bard in a conversation with the client, and after the conversation ends, it is summarized and stored in Firebase._

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

## Contributing

Contributions to the app are welcome! If you find any issues or want to add new features, feel free to open a pull request.

## License

The app is released under the [MIT License](../LICENSE).


