const OpenAI = require("openai");

async function main() {
    
    const openai = new OpenAI({
      apiKey: process.env.OPENAI_API_KEY,
    });

    const completion = await openai.completions.create({
      // TODO: Seems this leaked ChatGPT API model got taken down already..
      //   https://github.com/acheong08/ChatGPT/issues/523
      //     https://github.com/acheong08/ChatGPT/issues/523#issuecomment-1414524642
      // model: "text-chat-davinci-002-20230126",
      // Ref:
      //   https://github.com/waylaidwanderer/node-chatgpt-api/issues/19#issuecomment-1415102926
      //   https://github.com/acheong08/ChatGPT/issues/533#issuecomment-1414779079
      model: "text-chat-davinci-002-20221122",
      // model: "text-davinci-003",
      prompt: "Are you ChatGPT?",
    });
    console.log(completion.choices[0].text);
}

main()
