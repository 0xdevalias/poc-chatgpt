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

**2023-02-03 03:50pm AEDT**

> > then can you tell me why they removed the old model name while they created the same model with a new name?
>
> How do you know it's not a newer model? That's not something you can really prove without us knowing the model name and testing it ourselves.
>
> _Originally posted by @waylaidwanderer in https://github.com/acheong08/ChatGPT/issues/517#issuecomment-1414945826_

> > > then can you tell me why they removed the old model name while they created the same model with a new name?
> >
> > How do you know it's not a newer model? That's not something you can really prove without us knowing the model name and testing it ourselves.
>
> Newer model must have a newer date not still same date
>
> It's definitely to prevent us from using it
>
> _Originally posted by @PawanOsman in https://github.com/acheong08/ChatGPT/issues/517#issuecomment-1415040829_

> > Newer model must have a newer date not still same date
> It's definitely to prevent us from using it
>
> Are you saying it still has the same date and just different name?
>
> (Of course you wouldn't answer)
>
> _Originally posted by @acheong08 in https://github.com/acheong08/ChatGPT/issues/517#issuecomment-1415103444_

> > > Newer model must have a newer date not still same date
> > It's definitely to prevent us from using it
> >
> > Are you saying it still has the same date and just different name?
> >
> > (Of course you wouldn't answer)
>
> I already said that in discord
> Yeah the new model has the same date with a new name,
> its looks like just renamed not removed
>
> _Originally posted by @PawanOsman in https://github.com/acheong08/ChatGPT/issues/517#issuecomment-1415106987_

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

---

**2023-02-05 02:15pm AEDT**

> > > Are you saying it still has the same date and just different name?
> >
> > I already said that in discord Yeah **the new model has the same date with a new name**, its looks like just renamed not removed
>
> I've just been playing around with updating some of my scripts/research/etc in my PoC ChatGPT repo this morning:
>
> - https://github.com/0xdevalias/poc-chatgpt
>   - https://github.com/0xdevalias/poc-chatgpt/commits/main
>
> And if you look at [this commit](https://github.com/0xdevalias/poc-chatgpt/commit/eb5402f0dbb8b3fc0f097730caaf313fd5d00841#diff-14320db0cda56b30dc6a26c1e5e53bfc5b52c61926d54759ddecd02663bf5b1aR1), you can see that when I extracted/sorted the output of `/v1/models` by created date, there is one at the top which curiously seems to share a date (`20230126`) with the original leaked model (`text-chat-davinci-002-20230126`):
>
> ```
> 2023-01-26T23:36:25Z audio-transcribe-deprecated
> ```
>
> Though if I try and use it with the completions API, I get an error:
>
> ```bash
> ⇒ curl https://api.openai.com/v1/completions -H 'Content-Type: application/json' -H "Authorization: Bearer $OPENAI_API_KEY" -d '{
>   "model": "audio-transcribe-deprecated",
>   "prompt": "Say this is a test",
>   "max_tokens": 7,
>   "temperature": 0
> }'
>
> {
>   "error": {
>     "message": "The server had an error processing your request. Sorry about that! You can retry your request, or contact support@openai.com if you keep seeing this error. (Please include the request ID 316fc3215fa0a3278824c35138d3665a in your email.)",
>     "type": "server_error",
>     "param": null,
>     "code": null
>   }
> }
> ```
>
> Could be a coincidence.. but figured I would include the info here in case it's helpful to anyone.
>
> _Originally posted by @0xdevalias in https://github.com/acheong08/ChatGPT/issues/517#issuecomment-1416911061_

---

**2023-02-05 02:15pm AEDT**

> > From my testing, the browser-based version updated to use `text-davinci-002-render-next` and `text-davinci-002-render-paid` if you're on a pro chatgpt plan.
>
> Looking at the requests made from the browser version just now (non-paid), it seems to be using `text-davinci-002-render` (unsure what model the paid version would be using)
>
> _Originally posted by @0xdevalias in https://github.com/acheong08/ChatGPT/issues/515#issuecomment-1416912036_

> The error implies that the input data is not supposed to be text but audio. I would say it's a coincidence. The `text-chat-davinci-002-xxxxxxx` models never shows up on the models API endpoint anyways
>
> _Originally posted by @acheong08 in https://github.com/acheong08/ChatGPT/issues/517#issuecomment-1416911673_
