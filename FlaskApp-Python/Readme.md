# Flask App / Python

The app uses **Generative AI** and Large Language Models (**LLM**) specifically **PaLM2 APIs** to understand and respond to user messages.


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


## Contributing

Contributions to the app are welcome! If you find any issues or want to add new features, feel free to open a pull request.

## License

The app is released under the [MIT License](../LICENSE).