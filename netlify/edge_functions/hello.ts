import jsonResponseBuilder from "./utils/json_response.ts";

const jsonResponse = jsonResponseBuilder([]);

export default (request: Request) => {
  return jsonResponse(
    {
      message: "Hello, World!",
      time: new Date().toISOString(),
    },
    true
  );
}

export const config = {
  path: "/api/v1/hello",
  cache: "manual",
};