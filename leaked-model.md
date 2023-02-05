## Leaked Model Controversy

These are my running notes/research around the leaked model, how it was taken down, and the supposed existence of a new model (though that situation seems super scammy).

Oldest notes (based on time I captured them) at the top, newest notes at the bottom.

---

**2023-02-03 09:53am AEDT**

ChatGPT Plus officially announced (edit: and apparently the official API has been leaked too):

https://openai.com/blog/chatgpt-plus/

$20/mo, US only for now but expanding to other countries soon, free version will still be available.

ChatGPT Plus Waitlist: https://docs.google.com/forms/d/e/1FAIpQLScee6ST3o-kZDjlw1ROfUNyjuRBwGdcoewxjCULNejbP5hdzQ/viewform

ChatGPT API Waitlist: https://share.hsforms.com/1u4goaXwDRKC9-x9IvKno0A4sk30

---

**2023-02-03 09:53am AEDT**

Edit: Also seems like the official ChatGPT API has been leaked too.. haven't looked too deeply into it all yet, but here are the few references I found so far:

https://github.com/wong2/chatgpt-google-extension/issues/116#issuecomment-1414493203

https://github.com/acheong08/ChatGPT#official-api-browserless

https://github.com/acheong08/ChatGPT/blob/main/src/revChatGPT/Official.py#L13

---

**2023-02-03 10:46am AEDT**

Playing around with attempting to call the supposed leaked official API; so far not looking promising.. unless i'm missing something..

---

**2023-02-03 10:56am AEDT**

Looks like it's already been taken down according to this thread: https://github.com/acheong08/ChatGPT/issues/523

And the related issues I linked to here: https://github.com/acheong08/ChatGPT/issues/523#issuecomment-1414524642

---

**2023-02-03 11:24am AEDT**

Though someone apparently claims to have found the new model name already.. just isn't publicly known/released yet..

https://github.com/waylaidwanderer/node-chatgpt-api#update-2023-02-02

---

**2023-02-03 11:30am AEDT**

Here's my little PoC repo anyways: https://github.com/0xdevalias/poc-chatgpt

Including the list of models that are currently available: https://github.com/0xdevalias/poc-chatgpt/blob/main/models.txt

And the full JSON returned for each of those: https://github.com/0xdevalias/poc-chatgpt/blob/main/models.json

---

**2023-02-03 11:57am AEDT**

Here's the source of the person who apparently figured out the new model: https://github.com/PawanOsman/ChatGPT-Official/issues/1#issuecomment-1414402940

They claim to have made a web service that people can use with their OpenAI API keys, to 'prevent OpenAI shutting down the new model name too quickly'..

Sounds super scammy to me.. but.. here's the gist anyways..

https://gist.github.com/PawanOsman/be803be44caed2449927860956b240ad

---

**2023-02-03 12:54pm AEDT**

Ha.. so.. seems at least some of the peoples plan now is to try and hack OpenAI to figure out what the new model name is called.. that's going to end well.....

https://github.com/acheong08/ChatGPT/issues/530#issuecomment-1414584094

---

**2023-02-03 12:58pm AEDT**

> > I do not share the model name to prevent OpenAI remove it soon
>
> That is pretty much a lie. The use of the model was given the green light by OpenAI devs to one of our discord community members. They simply update the model every week but we lost access to the info leak that allowed us to get the model name.
>
> _Originally posted by @acheong08 in https://github.com/acheong08/ChatGPT/issues/517#issuecomment-1414572152_

---

**2023-02-03 12:58pm AEDT**

Shared a link to this file on Twitter:

- https://twitter.com/_devalias/status/1621328218170195969

> Did you hear that OpenAI's ChatGPT API model got leaked? And then taken down? And then supposedly a new one is out there?
>
> Here's my running notes/research if you want to keep up to date:
>
> https://github.com/0xdevalias/poc-chatgpt#leaked-model-controversy
>
> Also would appreciate any tips/insights I can add to it too!

---

**2023-02-03 01:30pm AEDT**

> Anyone with Azure's OpenAI service might be able to find the new model name.
>
> Refer to
> - https://learn.microsoft.com/en-us/rest/api/cognitiveservices/azureopenaistable/models/list?tabs=HTTP
>
> _Originally posted by @acheong08 in https://github.com/acheong08/ChatGPT/issues/533#issuecomment-1414701386_

---

**2023-02-03 02:05pm AEDT**

> I have found a model that works, but I am not sure if it is the new one.
> `text-chat-davinci-002-20221122`
> It seems to work well for me 👍
>
> _Originally posted by @canfam in https://github.com/waylaidwanderer/node-chatgpt-api/issues/19#issuecomment-1414759800_

> Not as smart as ` text-chat-davinci-002-20230126`, quite far from~
>
> _Originally posted by @timestee in https://github.com/waylaidwanderer/node-chatgpt-api/issues/19#issuecomment-1415102926_

> From our testing, it's identical in most ways to web ChatGPT's output but performs worse in some aspects like math, which is to be expected as it's an older model.
>
> _Originally posted by @waylaidwanderer in https://github.com/waylaidwanderer/node-chatgpt-api/issues/19#issuecomment-1415125301_

---

**2023-02-03 02:17pm AEDT**

> Found without access to Azure's OpenAI
>
> ```python
> import openai
> import concurrent.futures
>
> from revChatGPT.Official import Chatbot
>
> defaultModel = "text-chat-davinci-002-XXXXXXXX"
> successfulModels = []
>
> def test_model(model):
>     try:
>         bot = Chatbot(api_key="", engine=model)
>         response = bot.ask("what is the capitol of the unitd states of america?")
>         if response:
>             successfulModels.append(model)
>     except openai.InvalidRequestError:
>         print("Model [" + model + "] failed to load. (Invalid Request Error)")
>
> with concurrent.futures.ThreadPoolExecutor(max_workers=16) as executor:
>     for year in range(2020, 2031):
>         for month in range(1, 13):
>             for day in range(1, 32):
>                 formatted_year = "{:04d}".format(year)
>                 formatted_month = "{:02d}".format(month)
>                 formatted_day = "{:02d}".format(day)
>                 model = defaultModel.replace("XXXXXXXX", formatted_year + formatted_month + formatted_day)
>                 executor.submit(test_model, model)
>
> print("Successful Models: " + str(successfulModels))
> ```
> Slightly modified the module to take in a "model" property
>
> _Originally posted by @canfam in https://github.com/acheong08/ChatGPT/issues/533#issuecomment-1414779079_

---

**2023-02-03 11:02pm AEDT**

> Confirmed it works and doesn't use credit on an account with `$`0. It still charges the same amount as davinci on account with `$`
>
> _Originally posted by @acheong08 in https://github.com/acheong08/ChatGPT/issues/533#issuecomment-1415775972_

---

**2023-02-05 07:05am AEDT**

> `text-chat-davinci-002-20230126` is down for me the whole time. But `text-chat-davinci-002-20221122` is up for me
>
> _Originally posted by @Cellenseres in https://github.com/fuergaosi233/wechat-chatgpt/issues/524#issuecomment-1416839085_
