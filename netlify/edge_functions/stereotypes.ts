import OpenAI from "https://deno.land/x/openai@v4.28.4/mod.ts";
import jsonResponse from "./utils/json_response.ts";

const client = new OpenAI();

export default async (request: Request) => {
  const url = new URL(request.url);
  const country = url.searchParams.get("country");
  if (country === null) {
    throw jsonResponse({ error: "country is required" }, false, 400);
  }

  // TODO protect against prompt injection attacks
  const prompt = `Pretend you are a stereotypical person from ${country} and introduce your country. Make fun of yourself as much as you can. Keep it short and witty.`;

  const response = await client.chat.completions.create({
    model: "gpt-4",
    messages: [{ role: 'user', content: prompt }],
  });

  return jsonResponse(
    {
      prompt,
      content: response.choices[0].message.content,
      raw: response,
    },
    true
  );
};

export const config = {
  path: "/api/v1/stereotypes",
  cache: "manual",
};
