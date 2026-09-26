FROM node:18-alpine

WORKDIR /app

RUN apk add --no-cache curl

RUN cat > server.js << 'JSEOF'
const http = require("http");
const os = require("os");
const server = http.createServer((req, res) => {
  if (req.url === "/health") {
    res.writeHead(200, {"Content-Type": "application/json"});
    res.end(JSON.stringify({status: "healthy", hostname: os.hostname()}));
  } else {
    res.writeHead(200, {"Content-Type": "text/html"});
    res.end("<h1>Umair Production App</h1><p>Hostname: " + os.hostname() + "</p><p>Environment: dev</p>");
  }
});
server.listen(3000, () => console.log("Server running on port 3000"));
JSEOF

EXPOSE 3000

CMD ["node", "server.js"]
