module.exports = {
  apps: [{
    name: "buzzer",
    script: "index.js",
    watch: true,
    ignore_watch: ["node_modules", "update.log"],
    env: {
      NODE_ENV: "production",
    }
  }]
} 