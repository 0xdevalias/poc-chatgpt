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