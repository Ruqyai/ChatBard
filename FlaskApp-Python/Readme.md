# Flask App / Python

The app uses **Generative AI** and Large Language Models (**LLM**) specifically **PaLM2 APIs** to understand and respond to user messages.

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


## Contributing

Contributions to the app are welcome! If you find any issues or want to add new features, feel free to open a pull request.

## License

The app is released under the [MIT License](../LICENSE).