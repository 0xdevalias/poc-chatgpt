# poc-chatgpt

Run this script:

```bash
# https://platform.openai.com/account/api-keys
export OPENAI_API_KEY=TODO-YOUR-API-KEY-HERE

node index.js
```

List available models:

```bash
# https://platform.openai.com/account/api-keys
export OPENAI_API_KEY=TODO-YOUR-API-KEY-HERE

# Fetch all the model data
⇒ curl https://api.openai.com/v1/models -H "Authorization: Bearer $OPENAI_API_KEY" > models.json

# Extract just the model names from the model data
⇒ jq -r '.data[].id' models.json > models.txt
```

- [models.json](./models.json)
- [models.txt](./models.txt)

## Leaked Model Controversy

You can read more about my running notes/research around the leaked model, how it was taken down, and the supposed existence of a new model (though that situation seems super scammy) here:

- [leaked-model.md](./leaked-model.md)

## See Also

- https://github.com/openai/openai-node
- https://platform.openai.com/account/api-keys
- https://platform.openai.com/account/usage
- https://platform.openai.com/docs/api-reference/introduction
  - https://platform.openai.com/docs/api-reference/authentication
- https://github.com/acheong08/ChatGPT#official-api-browserless
  - https://github.com/acheong08/ChatGPT/wiki/revChatGPT
  - https://github.com/acheong08/ChatGPT/blob/main/src/revChatGPT/Official.py#L13
    - `text-chat-davinci-002-20230126`
