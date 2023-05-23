

# ChatBARD : An Intelligent Customer Service Center App

This is a Flutter app for an intelligent customer service center. It provides a chat interface where users can interact with a chatbot to get customer support. The app uses machine learning and natural language processing techniques specifically **PaLM APIs** to understand and respond to user messages.

## How does it work?
The ChatBARD responds to customer queries based on the information it has been fed with in terms of context and examples. Then it summarizes the conversation and stores the summary in the database in Firebase.

## Features

- Chat interface: Users can send messages and receive responses from the chatbot.
- Intelligent responses: The app uses a machine learning model to generate intelligent responses based on the user's input.
- Chat history: The app keeps track of the chat history and displays it in the chat interface.
- Summarization and saving: The app can summarize the chat session and save it to a Firebase database for future reference.

## Screenshots

Here are some screenshots of the app:

![Screenshot 1](screenshots/screenshot1.gif)  
_A conversation with the client, and after the conversation ends, it is summarized and stored in Firebase._


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

The app is released under the [MIT License](LICENSE).


