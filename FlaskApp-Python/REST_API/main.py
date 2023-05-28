import os
import vertexai
from vertexai.preview.language_models import ChatModel, InputOutputTextPair
from vertexai.preview.language_models import TextGenerationModel
from flask import Flask, render_template, request, jsonify
from deep_translator import GoogleTranslator
import var


########################################################
#         Functions to get PaLM API and Teranslation
########################################################

#-----------------chat_bard--------------
def chat_bard(
    message: str, 
    ) :
    project_id=var.projectId
    model_name="chat-bison@001"
    temperature= 0.2
    max_output_tokens=256
    top_p= 0.8
    top_k=40
    location = "us-central1"

    vertexai.init(project=project_id, location=location)

    chat_model = ChatModel.from_pretrained(model_name)
    parameters = {
      "temperature": temperature,
      "max_output_tokens": max_output_tokens,
      "top_p": top_p,
      "top_k": top_k,
    }

    chat = chat_model.start_chat(
     context="Online Customer Service: Assisting for Clothing Purchase.",
      examples = [
    InputOutputTextPair(
        input_text="Hi, My name is Ruqiya",
        output_text="Hi Ruqiya How can I help you?",
    ),
    InputOutputTextPair(
        input_text="Are you a human assistant?",
        output_text="No, I am the chatbot of Fashion Junction: Discover Stylish Clothing for Every Occasion",
    ),

    InputOutputTextPair(
        input_text="I'm interested in purchasing clothing from your online store. Can you please provide me with some information about your online shopping service?",
        output_text="Certainly! We offer a convenient and secure online shopping experience for our customers. Our website is designed to make browsing and purchasing clothing items easy and enjoyable. You can explore our wide range of clothing options, including shirts, jeans, dresses, and more.",
    ),
]
    )
    response = chat.send_message(message, **parameters) 
    return response

#-----------------summarize_chat--------------
def summarize_chat(
    content: str,
    ) :
    project_id=var.projectId
    model_name="text-bison@001"
    temperature= 0.2
    max_decode_steps=256
    top_p= 0.8
    top_k=40
    location = "us-central1"
    tuned_model_name: str = ""

    vertexai.init(project=project_id, location=location)

    model = TextGenerationModel.from_pretrained(model_name)

    if tuned_model_name:
      model = model.get_tuned_model(tuned_model_name)

    response = model.predict(
        content,
        temperature=temperature,
        max_output_tokens=max_decode_steps,
        top_k=top_k,
        top_p=top_p,)
    return response
########################################################
#                       Arabic BARD 
########################################################

#---------------en2ar_bard--------------
def en2ar(text):
    arabic_text=GoogleTranslator(source='auto', target='ar').translate(text=text)
    return arabic_text

#---------------ar2en_bard--------------
def ar2en(text):
    arabic_text=GoogleTranslator(source='auto', target='en').translate(text=text)
    return arabic_text

#-----------------arabic_chat_bard--------------
def arabic_chat_bard(
    message: str, 
    ) :
    project_id=var.projectId
    model_name="chat-bison@001"
    temperature= 0.2
    max_output_tokens=256
    top_p= 0.8
    top_k=40
    location = "us-central1"

    vertexai.init(project=project_id, location=location)

    chat_model = ChatModel.from_pretrained(model_name)
    parameters = {
      "temperature": temperature,
      "max_output_tokens": max_output_tokens,
      "top_p": top_p,
      "top_k": top_k,
    }

    chat = chat_model.start_chat(
     context="Online Customer Service: Assisting for Clothing Purchase.",
      examples = [
    InputOutputTextPair(
        input_text="Hi, My name is Ruqiya",
        output_text="Hi Ruqiya How can I help you?",
    ),
    InputOutputTextPair(
        input_text="Are you a human assistant?",
        output_text="No, I am the chatbot of Fashion Junction: Discover Stylish Clothing for Every Occasion",
    ),

    InputOutputTextPair(
        input_text="I'm interested in purchasing clothing from your online store. Can you please provide me with some information about your online shopping service?",
        output_text="Certainly! We offer a convenient and secure online shopping experience for our customers. Our website is designed to make browsing and purchasing clothing items easy and enjoyable. You can explore our wide range of clothing options, including shirts, jeans, dresses, and more.",
    ),
]
    )
    en_message = str(ar2en(message))
    response = chat.send_message(en_message, **parameters) 
    arabic_response=en2ar(str(response))
    return arabic_response


#-----------------arabic_summarize_chat--------------
def arabic_summarize_chat(
    content: str,
    ) :
    project_id=var.projectId
    model_name="text-bison@001"
    temperature= 0.2
    max_decode_steps=256
    top_p= 0.8
    top_k=40
    location = "us-central1"
    tuned_model_name: str = ""

    vertexai.init(project=project_id, location=location)

    model = TextGenerationModel.from_pretrained(model_name)

    if tuned_model_name:
      model = model.get_tuned_model(tuned_model_name)

    en_content=str(ar2en(content))
    response = model.predict(
        en_content,
        temperature=temperature,
        max_output_tokens=max_decode_steps,
        top_k=top_k,
        top_p=top_p,)
    arabic_response=en2ar(str(response))
    return arabic_response

########################################################
#                       REST API 
########################################################

app = Flask(__name__)

#---------- render index --------------
@app.route("/")
def index():
    return render_template("index.html")
#---------- start using ChatBARD --------------
@app.route('/chat', methods=['POST'])
def chatbot():
    data = request.get_json()
    message=data['message']
    response = chat_bard(message)
    return jsonify({'response': response.text})

#---------- get the summary of chating  --------------
@app.route('/summary', methods=['POST'])
def summary():
    data = request.get_json()
    content=data['content']
    Prompt="Summarize the following conversation between a service ChatBARD and a customer in a few sentences. Use only the information from the conversation.  "
    response = summarize_chat(Prompt+content)
    return jsonify({'response': response.text})

#########################################

#---------- start using Arabic ChatBard --------------
@app.route('/chat_ar', methods=['POST'])
def chat_ar():
    data = request.get_json()
    message=data['message']
    response = arabic_chat_bard(message)
    return jsonify({'response': response})

#---------- get the summary of Arabic chating  --------------
@app.route('/summary_ar', methods=['POST'])
def summary_ar():
    data = request.get_json()
    content=data['content']
    Prompt="Summarize the following conversation between a service ChatBARD and a customer in a few sentences. Use only the information from the conversation.  "
    response = arabic_summarize_chat(Prompt+content)
    return jsonify({'response': response})

#---------- en2ar --------------
@app.route('/en2ar', methods=['POST'])
def ara():
    data = request.get_json()
    text=data['response']
    response = en2ar(text)
    return jsonify({'response': response})

#---------- ar2en --------------
@app.route('/ar2en', methods=['POST'])
def eng():
    data = request.get_json()
    text=data['response']
    response = ar2en(text)
    return jsonify({'response': response})

#--------run the app ----------
if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=int(os.environ.get("PORT", 8080)))