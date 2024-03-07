const jsonResponse = <T extends {}>(
  json: T,
  shouldCache: boolean,
  statusCode = 200
) => {
  const payload = JSON.stringify(json)

  // NOTE: this will show up in the Netlify dashboard
  console.log(`JSON Response (${statusCode}): ${payload}`)
  
  return new Response(payload, {
    status: statusCode,
    headers: {
      "Content-Type": "application/json",
      "Access-Control-Allow-Origin": "*",
      "Netlify-CDN-Cache-Control": shouldCache ? "public, s-maxage=3600" : "no-store",
      "Netlify-Vary": "query=no_cache",
    },
  });
}

export default jsonResponse