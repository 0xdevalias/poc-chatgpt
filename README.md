# poc-chatgpt

Run this script:

```bash
# https://platform.openai.com/account/api-keys
export OPENAI_API_KEY=TODO-YOUR-API-KEY-HERE

node index.js
```

List available models ([Ref](https://platform.openai.com/docs/api-reference/models/list)):

```bash
# https://platform.openai.com/account/api-keys
export OPENAI_API_KEY=TODO-YOUR-API-KEY-HERE

# Fetch all the model data
curl https://api.openai.com/v1/models -H "Authorization: Bearer $OPENAI_API_KEY" > models.json

# Extract just the model names from the model data
jq -r '.data[].id' models.json > models.txt
```

- [models.json](./models.json)
- [models.txt](./models.txt)

Get details for a single model ([Ref](https://platform.openai.com/docs/api-reference/models/retrieve)):

```bash
# https://platform.openai.com/account/api-keys
export OPENAI_API_KEY=TODO-YOUR-API-KEY-HERE

# Fetch a specific model's data
curl https://api.openai.com/v1/models/TODO-MODEL-ID-HERE -H "Authorization: Bearer $OPENAI_API_KEY" > models.json
```

List available engines (deprecated) ([Ref](https://platform.openai.com/docs/api-reference/engines/list)):

```bash
# https://platform.openai.com/account/api-keys
export OPENAI_API_KEY=TODO-YOUR-API-KEY-HERE

# Fetch all the engine data
curl https://api.openai.com/v1/engines -H "Authorization: Bearer $OPENAI_API_KEY" > engines.json
```

- [models.json](./engines.json)

## Leaked Model Controversy

You can read more about my running notes/research around the leaked model, how it was taken down, and the supposed existence of a new model (though that situation seems super scammy) here:

- [leaked-model.md](./leaked-model.md)

The following leaked model names have been found, and may or may not still be working:

- `text-chat-davinci-002-20230126`
- `text-chat-davinci-002-20221122`

## See Also

- https://github.com/openai/openai-node
- https://platform.openai.com/account/api-keys
- https://platform.openai.com/account/usage
- https://platform.openai.com/docs/api-reference/introduction
  - https://platform.openai.com/docs/api-reference/authentication
  - https://platform.openai.com/docs/api-reference/models
    - > Models: List and describe the various models available in the API. You can refer to the Models documentation to understand what models are available and the differences between them.
      - https://platform.openai.com/docs/models
    - https://platform.openai.com/docs/api-reference/models/list
      - `GET https://api.openai.com/v1/models`
      - > Lists the currently available models, and provides basic information about each one such as the owner and availability.
    - https://platform.openai.com/docs/api-reference/models/retrieve
      - `GET https://api.openai.com/v1/models/{model}`
      - > Retrieves a model instance, providing basic information about the model such as the owner and permissioning.
  - https://platform.openai.com/docs/api-reference/engines
    - > Engines (deprectated): These endpoints describe and provide access to the various engines available in the API.
    - > The Engines endpoints are deprecated. Please use their replacement, Models, instead.
      - https://platform.openai.com/docs/api-reference/engines/list
        - > `GET https://api.openai.com/v1/engines`
        - > `[DEPRECATED]` Lists the currently available (non-finetuned) models, and provides basic information about each one such as the owner and availability.
      - https://platform.openai.com/docs/api-reference/engines/retrieve
        - > `GET https://api.openai.com/v1/engines/{engine_id}`
        - > `[DEPRECATED]` Retrieves a model instance, providing basic information about it such as the owner and availability.
  - https://platform.openai.com/docs/api-reference/completions
    - > Completions: Given a prompt, the model will return one or more predicted completions, and can also return the probabilities of alternative tokens at each position.
    - https://platform.openai.com/docs/api-reference/completions/create
      - `POST https://api.openai.com/v1/completions`
      - > Creates a completion for the provided prompt and parameters
  - https://platform.openai.com/docs/api-reference/edits
    - > Edits: Given a prompt and an instruction, the model will return an edited version of the prompt.
    - https://platform.openai.com/docs/api-reference/edits/create
      - `POST https://api.openai.com/v1/edits`
      - > Creates a new edit for the provided input, instruction, and parameters.
  - https://platform.openai.com/docs/api-reference/images
    - > Images: Given a prompt and/or an input image, the model will generate a new image.
    - https://platform.openai.com/docs/api-reference/images/create
      - `POST https://api.openai.com/v1/images/generations`
      - > Creates an image given a prompt.
    - https://platform.openai.com/docs/api-reference/images/create-edit
      - `POST https://api.openai.com/v1/images/edits`
      - > Creates an edited or extended image given an original image and a prompt.
    - https://platform.openai.com/docs/api-reference/images/create-variation
      - `POST https://api.openai.com/v1/images/variations`
      - > Creates a variation of a given image.
  - https://platform.openai.com/docs/api-reference/embeddings
    - > Embeddings: Get a vector representation of a given input that can be easily consumed by machine learning models and algorithms.
    - https://platform.openai.com/docs/api-reference/embeddings/create
      - `POST https://api.openai.com/v1/embeddings`
      - > Creates an embedding vector representing the input text.
  - https://platform.openai.com/docs/api-reference/files
    - > Files: Files are used to upload documents that can be used with features like Fine-tuning.
  - https://platform.openai.com/docs/api-reference/fine-tunes
    - > Fine-tunes: Manage fine-tuning jobs to tailor a model to your specific training data.
  - https://platform.openai.com/docs/api-reference/moderations
    - > Moderations: Given a input text, outputs if the model classifies it as violating OpenAI's content policy.
- https://github.com/acheong08/ChatGPT#official-api-browserless
  - https://github.com/acheong08/ChatGPT/wiki/revChatGPT
  - https://github.com/acheong08/ChatGPT/blob/main/src/revChatGPT/Official.py#L13
    - `text-chat-davinci-002-20230126`
