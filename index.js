const { Configuration, OpenAIApi } = require("openai");

async function main() {
    const configuration = new Configuration({
      apiKey: process.env.OPENAI_API_KEY,
    });
    const openai = new OpenAIApi(configuration);

    const completion = await openai.createCompletion({
      // TODO: Seems this leaked ChatGPT API model got taken down already..
      //   https://github.com/acheong08/ChatGPT/issues/523
      //     https://github.com/acheong08/ChatGPT/issues/523#issuecomment-1414524642
      // model: "text-chat-davinci-002-20230126",
      model: "text-davinci-003",
      prompt: "Hello world",
    });
    console.log(completion.data.choices[0].text);
}

main()
